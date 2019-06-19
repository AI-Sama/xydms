package com.controller;

import com.pojo.Anima;
import com.service.AnimaService;
import com.service.SuggestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/SuggestController")
public class SuggestController {
    @Autowired
    SuggestService suggestService;
    @RequestMapping(value = "/addSuggest",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String addSuggest(String userName,String suggestText){//添加一条建议
        if(suggestText.trim().length()<=0){
            return "建议不能为空";
        }
        suggestService.addSuggest(userName,suggestText);
        return "提交成功,感谢您的建议";
    }

    @RequestMapping(value = "/jumpSuggest",produces = {"text/html;charset=UTF-8;", "application/json;"})
    public String jumpSuggest(){//跳转到建议页面
        return "suggest";
    }
}
