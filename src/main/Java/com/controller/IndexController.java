package com.controller;

import com.pojo.Anima;
import com.service.AnimaService;
import com.service.AnnounceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/IndexController")
public class IndexController {
    @Autowired
    AnimaService animaService;
    @Autowired
    AnnounceService announceService;
    @RequestMapping(value = "*",produces = {"text/html;charset=UTF-8;", "application/json;"})
    //*的优先级最低,所以如果找不到其他匹配的路径,就会跳到这个页面,进行404处理
    public ModelAndView pageNotFound() {
        //统一404处理
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("404Error");
        return modelAndView;
    }

    @RequestMapping(value = "/jumpIndex",produces = {"text/html;charset=UTF-8;", "application/json;"})
    public ModelAndView jumpIndex(HttpSession httpSession, HttpServletRequest httpServletRequest){//跳转到首页
        ModelAndView modelAndView=new ModelAndView();
        Cookie cookie[]=httpServletRequest.getCookies(); //获取cookie,填充到session
        if(cookie!=null){
            for ( Cookie c:cookie
            ) {
                if(c.getName().equals("userName")){
                    httpSession.setAttribute("userName",c.getValue());
                }
                if(c.getName().equals("password")){
                    httpSession.setAttribute("password",c.getValue());
                }
            }
        }
        if(httpSession.getAttribute("animaList")==null){ //填充番剧到session
            Map<String,List<Anima>> animaList= animaService.findAnima();
            httpSession.setAttribute("animaList", animaList);
        }
       modelAndView.addObject("anns",announceService.findAnnounceByPage(1));
        modelAndView.setViewName("index");
        return modelAndView;
    }
}
