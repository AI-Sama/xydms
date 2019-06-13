package com.controller;

import com.pojo.User;
import com.pojo.Wallpaper;
import com.service.WallpaperService;
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
@RequestMapping("/WallpaperController")
public class WallpaperController {
    @Autowired
    WallpaperService wallpaperService;

    @RequestMapping(value = "/jumpWallpaper", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    public ModelAndView jumpWallpaper(Integer nowPageCount, Integer type)
            throws Exception {//跳转到壁纸页面
        if (nowPageCount == null || nowPageCount == 0) {//nowPageCount表示当前页数
            nowPageCount = 1;
        }
        if (type == null) {//type表示查询的是最新图片还是最热图片
            type = 0;
        }
        ModelAndView model = new ModelAndView();
        int count = wallpaperService.selectWallpaperCount();
        model.addObject("pageCount", count);
        model.addObject("nowPageCount", nowPageCount);
        if (type == 0) {
            List<Wallpaper> imgs = wallpaperService.selectHotImgList(nowPageCount);//查询最热图片地址
            model.addObject("imgs", imgs);//向modelview里面存入值
        } else if (type == 1) {
            List<Wallpaper> imgs = wallpaperService.selectNewImgList(nowPageCount);//查询最热图片地址
            model.addObject("imgs", imgs);//向modelview里面存入值
        }
        model.addObject("type", type);
        model.setViewName("wallpaper");//设置要转发的页面
        return model;
    }

    @RequestMapping(value = "/jumpUpWallpaper", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    public String jumpUpWallpaper(Integer nowPageCount, Integer type)
            throws Exception {//跳转到壁纸上传页面
        return "upImg";
    }

    @RequestMapping(value = "/upImg", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    public String upImg(@RequestParam(value = "up_file") MultipartFile up_file[], String img_text[], HttpSession httpSession)
            throws Exception {
        User user = (User) httpSession.getAttribute("user");
        for (int x = 0; x < up_file.length; x++) {
            if (!up_file[x].isEmpty()) {
                wallpaperService.upImg(up_file, user.getUserName(), img_text);
                httpSession.setAttribute("message", "上传成功");
                return "message";
            }
        }
        httpSession.setAttribute("message", "图片不能为空");
        return "message";
    }

    @RequestMapping(value = "/jumpImgDetails", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    public ModelAndView jumpImgDetails(String id, HttpSession httpSession)
            throws Exception {//跳转到图片详情页面
        ModelAndView modelAndView = new ModelAndView();
        Wallpaper wallpaper = wallpaperService.findImg(id);
        if (wallpaper == null) {
            modelAndView.setViewName("message");
            httpSession.setAttribute("message", "图片不存在或已被管理员删除");
            return modelAndView;
        }
        modelAndView.addObject("img", wallpaper);
        modelAndView.setViewName("PicDetails");
        return modelAndView;
    }
    @RequestMapping(value = "/jumpJudgeImg", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    public ModelAndView jumpJudgeImg(String id, HttpSession httpSession)
            throws Exception {//跳转到图片审核页面
        ModelAndView modelAndView = new ModelAndView();
        List<Wallpaper> wallpaper = wallpaperService.selectJudgeImgList();
        modelAndView.addObject("imgs", wallpaper);
        modelAndView.setViewName("JudgeWallpaper");
        return modelAndView;
    }
    @RequestMapping(value = "/JudgeImg", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    @ResponseBody
    public String  JudgeImg(String imgId, Integer imgState)
            throws Exception {//图片审核
       wallpaperService.setImgState(imgId,imgState);
        return "操作成功";
    }
    @RequestMapping(value = "/JudgeAll", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    @ResponseBody
    public String  JudgeAll() throws Exception {//全部通过
        wallpaperService.setAllImgState();
        return "操作成功";
    }

}
