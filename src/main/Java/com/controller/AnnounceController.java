package com.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.pojo.User;
import com.service.AnnounceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

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
            throws Exception {
        User user=(User)httpSession.getAttribute("user");
        String username=user.getUserName();
        try{
            announceService.insertAnn(annText,annTitle,username);
        }catch (Exception e){
            System.out.println(e);
            return null;
        }
        return "yes";
    }
}
