package com.controller;

import com.service.ToolsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ToolsController")
public class ToolsController {
    @Autowired
    ToolsService toolsService;
    @RequestMapping(value = "/jumpTools", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public String jumpTools() {//跳转到工具页面
        return "tool";
    }

    @RequestMapping(value = "/findKB", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public ModelAndView findKB(String userName,String password) throws Exception {//课表查询
             ModelAndView modelAndView=new ModelAndView();
             Map<String, List<String>> kbs=toolsService.findKB(userName,password) ;
             modelAndView.addObject("kbs",kbs);
              modelAndView.setViewName("curriculum");
             return modelAndView;
    }
    @RequestMapping(value = "/findCJ", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public ModelAndView findCJ(String userName,String password) throws Exception {//成绩查询
        ModelAndView modelAndView=new ModelAndView();
        List<Map<String,String>> cjs=toolsService.findCJ(userName,password) ;
        modelAndView.addObject("cjs",cjs);
        modelAndView.setViewName("grade");
        return modelAndView;
    }
}
