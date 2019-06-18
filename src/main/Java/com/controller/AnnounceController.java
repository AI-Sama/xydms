package com.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.pojo.Announce;
import com.pojo.User;
import com.service.AnnounceService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsDateJsonValueProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Controller
@RequestMapping("/AnnounceController")
public class AnnounceController {

    @Autowired
    AnnounceService announceService;
    @RequestMapping(value = "/jumpAnnounce", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    public String jumpAnnounce(){//跳转到发布公告页面
        return "Announce";
    }

    @RequestMapping(value = "/upAnnImg", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    @ResponseBody
    public String upAnnImg(HttpServletRequest request)
            throws Exception {//上传公告图片
        MultipartHttpServletRequest mhs=(MultipartHttpServletRequest) request;
        Iterator<String> iter=mhs.getFileNames();
        String filename=null;
        while(iter.hasNext()){
            MultipartFile file=mhs.getFile(iter.next());
            if(file!=null){
                filename= UUID.randomUUID().toString().replaceAll("-","")+".jpg";
                    File f=new File("D:\\showImg\\AnnImg\\"+filename);
//                File f=new File("/home/BigImg/GongaoImg/"+filename);
                file.transferTo(f);
                // System.out.println("文件名:"+filename);
            }
        }
        //String filepath = "D:\\showImg\\SrcImg\\" + fileName;
        Map<String,String> m=new HashMap<>();
        m.put("name","文件名");
        //m.put("path","/srcImg/"+filename);
        m.put("path","/annImg/"+filename);
        return JSONUtils.toJSONString(m);
    }
    @RequestMapping(value = "/insertAnn", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    @ResponseBody
    public String insertAnn(String  annTitle, String annText, HttpSession httpSession)
            throws Exception {//插入一条公告
        if(annTitle.trim().length()<=0){
            return "标题不能为空";
        }
        if(annText.trim().length()<=0){
            return "内容不能为空";
        }
        User user=(User)httpSession.getAttribute("user");
        String username=user.getUserName();
        try{
            announceService.insertAnn(annText,annTitle,username);
        }catch (Exception e){
            return "操作失败,请稍候重试";
        }
        return "操作成功";
    }

    @RequestMapping(value = "/jumpAnnounceDetails", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    public ModelAndView jumpAnnounceDetails(Integer id){//跳转到公告详情页面
        ModelAndView modelAndView=new ModelAndView();
         modelAndView.setViewName("AnnDetails");
         Announce announce=announceService.findAnnById(id);
         announceService.clickAnn(id);
         modelAndView.addObject("announce",announce);
        return modelAndView;
    }
    @RequestMapping(value = "/deleteAnn", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    @ResponseBody
    public String  deleteAnn(Integer id){//删除一条公告
        announceService.deleteAnn(id);
        return "删除成功";
    }
    @RequestMapping(value = "/findAnnounceByPage", produces = {"text/html;charset=utf-8;","application/json;"})//配置方法url路径
    @ResponseBody
    public String  findAnnounceByPage(Integer page,HttpSession httpSession){//根据页数查找公告
        page=page%5==0?page/5:page/5+1;
        page+=1;
       List<Announce> anns= announceService.findAnnounceByPage(page);
       if(anns.size()<=0){
           JSONObject jsonObject=new JSONObject();
           jsonObject.put("msg","没有更多了");
           return jsonObject.toString();
       }
        JSONArray jsonArray=JSONArray.fromObject(anns);
        return  jsonArray.toString();
    }
    @RequestMapping(value = "/changeAnnTop", produces = {"text/html;charset=UTF-8;", "application/json;"})//配置方法url路径
    @ResponseBody
    public String  changeAnnTop(Integer id,Integer top){//更改置顶状态
        announceService.changeAnnTop(id,top);
        return "操作成功";
    }
}
