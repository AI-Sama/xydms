package com.controller;


import com.pojo.User;
import com.service.EduAccountService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/UserController")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private EduAccountService eduAccountService;
    @RequestMapping(value = "/addUser",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String addUser(User user) throws Exception{//注册账号
        String mess=userService.addUser(user);
        return mess;
    }
    @RequestMapping(value = "/signIn",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String signIn(String str1, String password, HttpServletRequest httpServletRequest,
           String rememberPass, HttpSession httpSession, HttpServletResponse response) throws Exception{//登录账号
        if(rememberPass!=null){ //记住密码
            Cookie c1=new Cookie("userName",str1);
            Cookie c2=new Cookie("password",password);
            c1.setPath("/");//设置路径,这样全网站所有路径都能获取cookie
            c2.setPath("/");
            c1.setMaxAge(5*365*24*60*60);
            c2.setMaxAge(5*365*24*60*60);
            response.addCookie(c1);
            response.addCookie(c2);
        }else{ //取消记住密码
            Cookie c1=new Cookie("userName",null);
            Cookie c2=new Cookie("password",null);
            c1.setPath("/");
            c2.setPath("/");
            c1.setMaxAge(0);
            c2.setMaxAge(0);
            response.addCookie(c1);
            response.addCookie(c2);
        }
        User user2 = userService.signIn(str1,password);
        if (user2 != null) {
            String ip= httpServletRequest.getRemoteAddr();//获取登陆ip
            userService.countDL(user2.getUserName(),ip);//更新登陆时间
                user2.setPassword("");
                httpSession.setAttribute("user", user2);
                return "登录成功";
            } else {
                return "账号或密码错误";
            }
    }
    @RequestMapping(value = "/signOut", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    public ModelAndView signOut(HttpSession httpSession)
            throws Exception { //退出登录
        ModelAndView modelAndView = new ModelAndView();
        httpSession.removeAttribute("user");
        modelAndView.setViewName("redirect:/IndexController/jumpIndex");
        return modelAndView;
    }
    @RequestMapping(value = "/checkIn",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String checkIn(HttpSession httpSession) throws Exception{//签到
        User user = (User) httpSession.getAttribute("user");
        String str=userService.checkIn(user.getUserName());
        return str;
    }

    @RequestMapping(value = "/jumpPersonManage",produces = {"text/html;charset=UTF-8;", "application/json;"})
    public String jumpPersonManage(HttpSession httpSession) throws Exception{//跳转到人员管理页面
       List<User> users= userService.findUsers();
      httpSession.setAttribute("users",users);
        return "PersonManage";
    }
    @RequestMapping(value = "/addManage",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String addManage(Integer userId,HttpSession httpSession) throws Exception{//添加管理员
        userService.addManage(userId);
        return "设置管理员成功";
    }
    @RequestMapping(value = "/deleteManage",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String deleteManage(Integer userId,HttpSession httpSession) throws Exception{//删除管理员
         userService.deleteManage(userId);
        return "取消管理员成功";
    }
    @RequestMapping(value = "/resetPassword",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String resetPassword(Integer userId,HttpSession httpSession) throws Exception{//重置密码
        userService.resetPassword(userId);
        return "操作成功,密码已重置为123456";
    }
    @RequestMapping(value = "/jumpPerson",produces = {"text/html;charset=UTF-8;", "application/json;"})
    public String jumpPerson() throws Exception{//跳转到个人信息页面
        return "Person";
    }
    @RequestMapping(value = "/changePassword",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String changePassword(Integer userId,String oldPassword,String newPassword) throws Exception{//修改密码
          User user= userService.selectByUserId(userId);
          if(!user.getPassword().equals(oldPassword)){
              return "原密码错误";
          }
        if (newPassword.trim().length() < 6||newPassword.trim().length() >10) {
            return  "密码在6-10位之间";
        }
        userService.changePassword(userId,newPassword);
        return "修改成功,重新登录后生效";
    }

    @RequestMapping(value = "/addEduAccount",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String addEduAccount(String  userName,String eduName,String eduPassword,HttpSession httpSession) throws Exception{//添加绑定账号
        userService.setEduAccount(true,userName);
        try{
        eduAccountService.addEduAccount(userName,eduName,eduPassword);
     }catch (Exception c){
        userService.setEduAccount(false,userName);
        return "绑定失败,请稍后再重试";
    }
         httpSession.removeAttribute("user");
        return "绑定成功,请重新登录账号";
    }
    @RequestMapping(value = "/deleteEduAccount",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String deleteEduAccount(String  userName,HttpSession httpSession) throws Exception{//取消绑定账号
        userService.setEduAccount(false,userName);
            eduAccountService.deleteEduAccount(userName);
        httpSession.removeAttribute("user");
        return "取消绑定成功,请重新登录账号";
    }
}
