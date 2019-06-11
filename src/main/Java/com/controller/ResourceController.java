package com.controller;

import com.pojo.Resource;
import com.pojo.User;
import com.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    public ModelAndView loadSrc(Integer nowPageNum, HttpSession httpSession) {//查找
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
                httpSession.setAttribute("message", "上传成功");
                return "message";
            }
        }
        return "message";
    }
    @RequestMapping(value = "/jumpResDetails", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    public ModelAndView jumpResDetails(Integer messId, HttpSession httpSession) {//跳转到社团资源详情页面
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) httpSession.getAttribute("user");
//        srcService.chickSrc(messId);
        List<Resource> srcs = (List<Resource>) httpSession.getAttribute("srcs");
        if (srcs != null) {
            for (Resource src : srcs) {
                if (src.getId().equals(messId)) {
                    modelAndView.addObject("bigSrcMess", src);
//                    List<Plun> pluns=plunService.selectGonGaoPl(1,srcmess.getId());
//                    modelAndView.addObject("pluns",pluns);
                    break;
                }
            }
        }
        modelAndView.setViewName("ResourceDetails");
        return modelAndView;
    }

}
