package com.interceptor;

import com.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SuperAdminInterceptor implements HandlerInterceptor {//超级管理员拦截器
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //preHandle方法是在目标方法执行之前执行的
        HttpSession httpSession=httpServletRequest.getSession();
        User user=(User)httpSession.getAttribute("user");
        if(user==null||user.getLv()<2){
          httpServletRequest.getRequestDispatcher("/IndexController/jumpIndex").forward(httpServletRequest,httpServletResponse);
          return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
      //postHandle方法是在目标方法执行之后，渲染页面之前执行调用。
    }
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
     //afterCompletion方法是在渲染视图之后调用的。
    }
}
