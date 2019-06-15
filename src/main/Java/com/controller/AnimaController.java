package com.controller;

import com.pojo.Anima;
import com.service.AnimaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/AnimaController")
public class AnimaController {
    @Autowired
    AnimaService animaService;
    @RequestMapping(value = "/jumpAnimaManage",produces = {"text/html;charset=UTF-8;", "application/json;"})
    public String jumpAnimaManage(){//跳转到番剧管理页面
        return "updateAnima";
    }
    @RequestMapping(value = "/addAnima",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String addAnima(String animaName,String animaAddr,String weekDay){//添加一条番剧
        Anima anima=new Anima();
        if(animaName.trim().length()<=0){
            return "名称不能为空";
        }
        if(animaAddr.trim().length()<=0){
            return "链接不能为空";
        }
        anima.setAnimaName(animaName);
        anima.setAnimaAddr(animaAddr);
        anima.setWeekDay(weekDay);
        animaService.addAnima(anima);
        return "添加成功";
    }
    @RequestMapping(value = "/deleteAnima",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String deleteAnima(String animaName){//删除一条番剧
        animaService.deleteAnimaByName(animaName);
        return "删除成功";
    }
    @RequestMapping(value = "/dropAnimas",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String dropAnimas(){//删除全部番剧
        animaService.dropAnima();
        return "删除成功";
    }
}
