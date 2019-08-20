package com.controller;

import com.pojo.Anima;
import com.service.AnimaService;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/AnimaController")
public class AnimaController {
    @Autowired
    AnimaService animaService;

    @RequestMapping(value = "/jumpAnimaManage", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public String jumpAnimaManage() {//跳转到番剧管理页面
        return "updateAnima";
    }

    @RequestMapping(value = "/addAnima", produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String addAnima(String animaName, String animaAddr, String weekDay) {//添加一条番剧
        Anima anima = new Anima();
        if (animaName.trim().length() <= 0) {
            return "名称不能为空";
        }
        if (animaAddr.trim().length() <= 0) {
            return "链接不能为空";
        }
        anima.setAnimaName(animaName);
        anima.setAnimaAddr(animaAddr);
        anima.setWeekDay(weekDay);
        animaService.addAnima(anima);
        return "添加成功";
    }

    @RequestMapping(value = "/deleteAnima", produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String deleteAnima(String animaName) {//删除一条番剧
        animaService.deleteAnimaByName(animaName);
        return "删除成功";
    }

    @RequestMapping(value = "/dropAnimas", produces = {"text/html;charset=UTF-8;", "application/json;"})
    @ResponseBody
    public String dropAnimas() {//删除全部番剧
        animaService.dropAnima();
        return "删除成功";
    }

    @RequestMapping(value = "/chooseAnimaNums", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public ModelAndView chooseAnimaNums(String url) throws Exception {//选择番剧集数
        ModelAndView modelAndView = new ModelAndView();
        Connection.Response response = Jsoup.connect(url).ignoreContentType(true).method(Connection.Method.GET).execute();
        Document document = response.parse();
        String animaName = document.select(".names").text();
        Elements elements = document.select("#play_0");
        int nums = elements.select("li").size();//查找一共有多少集
        Pattern pattern = Pattern.compile("(?<=view/).*(?=.html)");
        Matcher matcher = pattern.matcher(url);
        matcher.find();//查找番剧所在的页数
        String pageNums = matcher.group();//查找之后的结果
        int lookNums = 0;
        modelAndView.addObject("animaName", animaName);
        List<String> animaUrls = new ArrayList<>();
        for (int x = 0; x < nums; x++) {
            lookNums = x;
            String lasturl = "http://www.imomoe.io/player/" + pageNums + "-0-" + String.valueOf(lookNums) + ".html";
            animaUrls.add(lasturl);
        }
        modelAndView.setViewName("chooseAnimaNums");
        modelAndView.addObject("animaUrls", animaUrls);
        return modelAndView;
    }

    @RequestMapping(value = "/searchAnima", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public ModelAndView searchAnima(String animaName)throws Exception{
       ModelAndView modelAndView=new ModelAndView();
       String urlEncode= URLEncoder.encode(animaName,"gb2312");
       String str="http://www.imomoe.io/search.asp?searchword=";
        str+=urlEncode;
        Connection.Response response=Jsoup.connect(str).method(Connection.Method.GET).ignoreContentType(true).execute();
        Document document=response.parse();
        Element elements=document.select(".pics").get(0);
        Elements hrefs=elements.select("a[href]");
        Elements names=elements.select("img[alt]");
        Elements imgs=elements.select("img[src]");
        List<Map> animas=new ArrayList<>();
        for(int x=0;x<names.size();x++){
            Map<String,String> map=new HashMap<>();
            map.put("animaName",names.get(x).attr("alt"));
            map.put("href",hrefs.get(2*x).attr("abs:href"));
            map.put("imgs",imgs.get(x).attr("src"));
            animas.add(map);
        }
        modelAndView.addObject("animas",animas);
        modelAndView.setViewName("selectAnima");
        System.out.println(animas);
        return modelAndView;
    }
    @RequestMapping(value = "/lookAnima", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public String lookAnima(String url, Integer num, String animaName, HttpSession httpSession) throws Exception {
        if (httpSession.getAttribute(animaName) != null) {
            List<String> animaUrls = (List<String>) httpSession.getAttribute(animaName);
            return "redirect:" + animaUrls.get(num);
        }
        Connection.Response response = Jsoup.connect(url).ignoreContentType(true).method(Connection.Method.GET).execute();
        Document document = response.parse();
        String str = document.select(".player").html();
        Pattern pattern = Pattern.compile("(?<=/playdata).*(?=.js)");
        Matcher matcher = pattern.matcher(str);
        matcher.find();//查找js链接
        String jsurl = matcher.group();//js链接
        // http://www.imomoe.io/playdata/135/7047.js
        String url3 = "http://m.imomoe.io/playdata" + jsurl + ".js";
        Connection.Response response2 = Jsoup.connect(url3).ignoreContentType(true).method(Connection.Method.GET).execute();
        String returnjson = response2.body();
//        System.out.println(returnjson);//输出json返回的链接
        pattern = Pattern.compile("(?=http).{0,130}(?=\\$flv)");
        matcher = pattern.matcher(returnjson);
        List<String> lastUrls = new ArrayList<>();
        while (matcher.find()) {
            lastUrls.add("https://api.xiaomingming.org/cloud/mp4.php?vid=" + matcher.group());
        }
        httpSession.setAttribute(animaName, lastUrls);
        return "redirect:" + lastUrls.get(num);
    }
}
