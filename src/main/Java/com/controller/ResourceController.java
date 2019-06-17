package com.controller;

import com.pojo.Resource;
import com.pojo.User;
import com.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/ResourceController")
public class ResourceController {
    @Autowired
    ResourceService resourceService;
    @RequestMapping(value = "/loadSrc", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    public ModelAndView loadSrc(Integer nowPageNum, HttpSession httpSession) {//跳转到社团资源页面
        if (nowPageNum == null || nowPageNum == 0) {
            nowPageNum = 1;
        }
        ModelAndView modelAndView = new ModelAndView();
        int allPageNum = resourceService.findAllSrcPageNum();
        List<Resource> srcs = resourceService.findAllSrc(nowPageNum);
        httpSession.setAttribute("srcs", srcs);
        modelAndView.addObject("nowPageNum", nowPageNum);
        modelAndView.addObject("allPageNum", allPageNum);
        modelAndView.setViewName("SocietyResource");
        return modelAndView;
    }

    @RequestMapping(value = "/jumpUpSrc",produces = {"text/html;charset=UTF-8;", "application/json;"})
    public String jumpUpSrc(){//跳转到上传资源页面
        return "upSrc";
    }

    @RequestMapping(value = "/upSrc", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    public String upSrc(Resource resource, HttpSession httpSession,
                        @RequestParam(value = "srcFile") MultipartFile srcFile[]) {//发布资源
        if (srcFile[0].isEmpty()) {
            httpSession.setAttribute("message", "主图不能为空");
            return "message";
        }
        for (MultipartFile file : srcFile) {
            if (!file.isEmpty()) {
                User user = (User) httpSession.getAttribute("user");
                String name = user.getUserName();
                resourceService.insertSrc(resource, srcFile, name);
                httpSession.setAttribute("message", "上传成功,待管理员审核后可显示");
                return "message";
            }
        }
        return "message";
    }
    @RequestMapping(value = "/jumpResDetails", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    public ModelAndView jumpResDetails(Integer messId, HttpSession httpSession) {//跳转到社团资源详情页面
        ModelAndView modelAndView = new ModelAndView();
        resourceService.clickSrc(messId);
        Resource resource =resourceService.selectSrc(messId);
        modelAndView.addObject("bigSrcMess",resource);
        modelAndView.setViewName("ResourceDetails");
        return modelAndView;
    }
    @RequestMapping(value = "/jumpJudgeSrc",produces = {"text/html;charset=UTF-8;", "application/json;"})
    public ModelAndView jumpJudgeSrc(){//跳转到资源审核页面
        List<Resource> srcs=resourceService.selectJudgeSrc();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("srcs",srcs);
        modelAndView.setViewName("JudgeSrc");
        return modelAndView;
    }
    @RequestMapping(value = "/setSrcState",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String  setSrcState(Integer srcId,Integer srcState){//资源审核
        resourceService.setJudgeState(srcId,srcState);
        return "操作成功";
    }
    @RequestMapping(value = "/setAllSrcState",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String  setAllSrcState(){//全部通过
        resourceService.setAllState();
        return "操作成功";
    }
    @RequestMapping(value = "/deleteSrc",produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String  deleteSrc(Integer id){//删除资源
        resourceService.deleteSrc(id);
        return "操作成功";
    }
}
