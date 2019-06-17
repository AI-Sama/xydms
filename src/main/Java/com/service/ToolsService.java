package com.service;

import org.apache.commons.codec.binary.Base64;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class ToolsService {
    public Map<String,List<String>> findKB(String name,String password) throws Exception{//课表查询
        Base64 base64=new Base64();
        String userName=base64.encodeToString(name.getBytes());
        String userPass=base64.encodeToString(password.getBytes());
        Map<String,String> data=new HashMap<>();//创建一个data集合
        data.put("userAccount",name);
        data.put("userPassword",password);
        data.put("encoded",userName+"%%%"+userPass);//MTczMDU1Nzc5%%%enhxLjEyM3c=
        Map<String,String> data2=new HashMap<>();//创建一个data集合
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        data2.put("rq",simpleDateFormat.format(new Date()));
        Connection.Response c= Jsoup.connect("http://jiaowu.jvtc.jx.cn/jsxsd/xk/LoginToXk").data(data).method(Connection.Method.POST).execute();//填入数据.并调用post的方法请求url
        String sessid=c.cookie("JSESSIONID");//获取返回数据的cookie
        Connection.Response d=Jsoup.connect(" http://jiaowu.jvtc.jx.cn/jsxsd/framework/main_index_loadkb.jsp").data(data2).cookie("JSESSIONID",sessid).method(Connection.Method.POST).execute();//使用cookie的post方法请求url
        Elements elements=d.parse().select("td");
        List<String> strs=new ArrayList<String>();
        for (Element element:elements
        ) {
            if(element.html().length()<=0){
                strs.add("无");
            }else{
                String st2="";
                String rgex="<br/>课程名称：(.*)<br/>上课时间";
                Pattern pattern=Pattern.compile(rgex);
                String st=element.html();
                Matcher matcher=pattern.matcher(st);
                while (matcher.find()){
                    int i=1;
                    st2+=matcher.group(i);
                    i++;
                }
                strs.add(st2);
            }
        }
        List<String> elements1=strs.subList(1,6);
        List<String> elements2=strs.subList(9,14);
        List<String> elements3=strs.subList(17,22);
        List<String> elements4=strs.subList(25,30);
        List<String> elements5=strs.subList(33,38);
        List<String> elements6=strs.subList(41,46);
        Map<String,List<String>> map=new HashMap<>();
        map.put("class1",elements1);
        map.put("class2",elements2);
        map.put("class3",elements3);
        map.put("class4",elements4);
        map.put("class5",elements5);
        map.put("class6",elements6);
        return map;
    }

    public List<Map<String,String>> findCJ(String name,String password)throws  Exception{//成绩查询
        org.apache.commons.codec.binary.Base64 base64=new Base64();
        String userName=base64.encodeToString(name.getBytes());
        String userPass=base64.encodeToString(password.getBytes());
        Map<String,String> data=new HashMap<>();//创建一个data集合
        data.put("userAccount",name);
        data.put("userPassword",password);
        data.put("encoded",userName+"%%%"+userPass);//MTczMDU1Nzc5%%%enhxLjEyM3c=
        Connection.Response c=Jsoup.connect("http://jiaowu.jvtc.jx.cn/jsxsd/xk/LoginToXk").data(data).method(Connection.Method.POST).execute();//填入数据.并调用post的方法请求url
        String sessid=c.cookie("JSESSIONID");//获取返回数据的cookie
        Map<String,String> data2=new HashMap<>();//创建一个data集合
        data2.put("kksj","2018-2019-2");
        data2.put("xsfs","all");
        Connection.Response d=Jsoup.connect("http://jiaowu.jvtc.jx.cn/jsxsd/kscj/cjcx_list").cookie("JSESSIONID",sessid).data(data2).method(Connection.Method.POST).execute();//使用cookie的post方法请求url
        List<Map<String,String>> list=new ArrayList<>();
        Elements e=d.parse().select("td" );
        if(e.size()<10){
            data2.put("kksj","2018-2019-1");
            d=Jsoup.connect("http://jiaowu.jvtc.jx.cn/jsxsd/kscj/cjcx_list").cookie("JSESSIONID",sessid).data(data2).method(Connection.Method.POST).execute();//使用cookie的post方法请求url
            e=d.parse().select("td" );
        }
        for (int x=3,y=4;x<e.size();x+=14,y+=14){
            Map<String,String> map=new HashMap<>();
          map.put("mc",e.get(x).html());//填充课程
            map.put("cj",e.get(y).html());//填充成绩
            list.add(map);
        }
        return list;
    }
}
