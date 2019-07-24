package com.controller;

import com.pojo.Anima;
import com.pojo.Announce;
import com.pojo.User;
import com.service.AnimaService;
import com.service.AnnounceService;
import com.service.UserService;
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
    @Autowired
    UserService userService;

    @RequestMapping(value = "/notSignMsg", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public ModelAndView notSignMsg(HttpSession httpSession) {//未登录提示
        ModelAndView modelAndView = new ModelAndView();
        httpSession.setAttribute("message", "请先登录");
        modelAndView.setViewName("message");
        return modelAndView;
    }

    @RequestMapping(value = "/jumpIndex", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public ModelAndView jumpIndex(HttpSession httpSession, HttpServletRequest httpServletRequest) throws Exception {//跳转到首页
        ModelAndView modelAndView = new ModelAndView();
        Cookie cookie[] = httpServletRequest.getCookies(); //获取cookie,填充到session
        String userName = "";
        String password = "";
        if (httpSession.getAttribute("user") == null) {
            if (cookie != null) {
                for (Cookie c : cookie
                ) {
                    if (c.getName().equals("userName")) {
                        userName = c.getValue();
                        httpSession.setAttribute("userName", userName);
                    }
                    if (c.getName().equals("password")) {
                        password = c.getValue();
                        httpSession.setAttribute("password", password);
                    }
                }
            }
            User user = userService.signIn(userName, password);
            if (user != null) {
                String ip = httpServletRequest.getRemoteAddr();//获取登陆ip
                userService.countDL(user.getUserName(), ip);//更新登陆时间
                user.setPassword("");
                httpSession.setAttribute("user", user);
            }
        }
        if (httpSession.getAttribute("animaList") == null) { //填充番剧到session
            Map<String, List<Anima>> animaList = animaService.findAnima();
            httpSession.setAttribute("animaList", animaList);
        }
        List<Announce> announces = announceService.findAnnounceByPage(1);
        modelAndView.addObject("anns", announces);
        modelAndView.setViewName("index");
        return modelAndView;
    }
}
