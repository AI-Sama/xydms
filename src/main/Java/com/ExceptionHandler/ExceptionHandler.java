package com.ExceptionHandler;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExceptionHandler implements HandlerExceptionResolver {//统一异常处理
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        //e是异常类型
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("500Error");//统一返回到500异常界面
        return modelAndView;
    }
}
