package com.service;

import com.mapper.AnnounceMapper;
import com.pojo.Announce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class AnnounceService {
    @Autowired
    AnnounceMapper announceMapper;

    public void insertAnn(String text,String name,String user){
        Announce ann=new Announce();
        ann.setAnnName(name);
        text=text.replaceAll("strike","del");
        ann.setAnnText(text);
        ann.setUpUser(user);
        try{
            String imgtext=text.substring(text.indexOf("<img"),text.indexOf(">",text.indexOf("<img")+1));
            String imgsrc=imgtext.substring(imgtext.indexOf("\"")+1,imgtext.indexOf("\"",imgtext.indexOf("\"")+1));
            ann.setImgSrc(imgsrc);
        }catch (Exception e){

        }
        announceMapper.insertAnn(ann);
    }
}
