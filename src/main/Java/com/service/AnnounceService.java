package com.service;

import com.mapper.AnnounceMapper;
import com.pojo.Announce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class AnnounceService {
    @Autowired
    AnnounceMapper announceMapper;

    public void insertAnn(String text,String name,String user){//插入一条公告
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
    public List<Announce> findAnnounceByPage(Integer page){//根据页数查找公告
        int num=page==1?0:(page-1)*5;
        List<Announce> announces=announceMapper.findAnnounceByPage(num);
        return announces;
    }
    public Announce findAnnById(Integer id){//根据id查找公告
        return announceMapper.findAnnById(id);
    }
    public void  deleteAnn(Integer id){//根据id删除公告
         announceMapper.deleteAnn(id);
    }
    public void  changeAnnTop(Integer id,Integer top){//更改置顶状态
        announceMapper.changeAnnTop(id,top);
    }
    public void  clickAnn(Integer id){//增加点击数
        announceMapper.clickAnn(id);
    }
}
