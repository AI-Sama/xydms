package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ToolsController")
public class ToolsController {

    @RequestMapping(value = "/jumpTools",produces = {"text/html;charset=UTF-8;", "application/json;"})
    public String jumpTools(){//跳转到工具页面
        return "tool";
    }


}
