package com.service;

import com.mapper.AnimaMapper;
import com.pojo.Anima;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AnimaService {
    @Autowired
    AnimaMapper animaMapper;
    public Map<String,List<Anima>> findAnima(){ //查找全部番剧,填充到map集合里面
        List<Anima> lists=animaMapper.findAnima();
        Map<String,List<Anima>> map=new HashMap<>();
        List<Anima> li1=new ArrayList<>();
        List<Anima> li2=new ArrayList<>();
        List<Anima> li3=new ArrayList<>();
        List<Anima> li4=new ArrayList<>();
        List<Anima> li5=new ArrayList<>();
        List<Anima> li6=new ArrayList<>();
        List<Anima> li7=new ArrayList<>();
        for ( Anima a:lists
        ) {
            switch (a.getWeekDay()){
                case"周一":
                    li1.add(a);
                    break;
                case"周二":
                    li2.add(a);
                    break;
                case"周三":
                    li3.add(a);
                    break;
                case"周四":
                    li4.add(a);
                    break;
                case"周五":
                    li5.add(a);
                    break;
                case"周六":
                    li6.add(a);
                    break;
                case"周日":
                    li7.add(a);
                    break;
            }
        }
        map.put("week1",li1);
        map.put("week2",li2);
        map.put("week3",li3);
        map.put("week4",li4);
        map.put("week5",li5);
        map.put("week6",li6);
        map.put("week7",li7);
        return map;
    }
}
