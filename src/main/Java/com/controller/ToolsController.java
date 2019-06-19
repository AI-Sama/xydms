package com.controller;

import com.pojo.EduAccount;
import com.service.EduAccountService;
import com.service.ToolsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ToolsController")
public class ToolsController {
    @Autowired
    ToolsService toolsService;
    @Autowired
    EduAccountService eduAccountService;
    @RequestMapping(value = "/jumpTools", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public String jumpTools() {//跳转到工具页面
        return "tool";
    }

    @RequestMapping(value = "/findKB", produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String  findKB(String userName, String password, HttpSession httpSession) throws Exception {//课表查询
                   EduAccount eduAccount;
                if(userName!=null&&password==null){
                    eduAccount= eduAccountService.findEduAccount(userName);
                    userName=eduAccount.getEduUserName();
                    password=eduAccount.getEduPassword();
                }
             try{
                 if(httpSession.getAttribute("kbs")==null){
                 Map<String, List<String>> kbs=toolsService.findKB(userName,password) ;
                 httpSession.setAttribute("kbs",kbs);
                 }
             }catch (Exception e){
                return "查询失败,请检查一下您的账号密码是否正确";
             }
             return "查询成功";
    }
    @RequestMapping(value = "/jumpCurriculum", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public String  jumpCurriculum(HttpSession httpSession) throws Exception {//跳转到课表
        return "curriculum";
    }
    @RequestMapping(value = "/findCJ", produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String  findCJ(String userName,String password,HttpSession httpSession) throws Exception {//成绩查询
        EduAccount eduAccount;
        if(userName!=null && password==null){
            eduAccount= eduAccountService.findEduAccount(userName);
            userName=eduAccount.getEduUserName();
            password=eduAccount.getEduPassword();
        }
        try{
            if(httpSession.getAttribute("cjs")==null) {
                List<Map<String, String>> cjs = toolsService.findCJ(userName, password);
                httpSession.setAttribute("cjs", cjs);
            }
        }catch (Exception e){
            return "查询失败,请检查一下您的账号密码是否正确";
        }
        return "查询成功";
    }
    @RequestMapping(value = "/jumpGrade", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public String  jumpGrade(HttpSession httpSession) throws Exception {//跳转到成绩
        return "grade";
    }
}
