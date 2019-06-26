package com.Test;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class FindAnimaTest {
    public static void main(String args[])throws  Exception{
//        http://www.imomoe.io/player/7047-0-1.html
       String strUrl="http://www.imomoe.io/view/7423.html";//传入的链接
        Pattern pattern=Pattern.compile("(?<=view/).*(?=.html)");
        Matcher matcher=pattern.matcher(strUrl);
        matcher.find();//查找番剧所在的页数
        String pageNums=matcher.group();//查找之后的结果
        int lookNums=0;
        String url2="http://www.imomoe.io/player/"+pageNums+"-0-"+String.valueOf(lookNums)+".html";

       Connection.Response response=Jsoup.connect(url2).ignoreContentType(true).method(Connection.Method.GET).execute();
        Document document= response.parse();
        String str=document.select(".player").html();
//          System.out.println(str);
        pattern=Pattern.compile("(?<=/playdata).*(?=.js)");
        matcher=pattern.matcher(str);
        matcher.find();//查找js链接
        String jsurl=matcher.group();//js链接
        // http://www.imomoe.io/playdata/135/7047.js
          String url3="http://www.imomoe.io/playdata"+jsurl+".js";
         Connection.Response response2=Jsoup.connect(url3).ignoreContentType(true).method(Connection.Method.GET).execute();
         String returnjson=response2.body();
         System.out.println(returnjson);//输出json返回的链接
        pattern=Pattern.compile("(?=http).{0,130}(?=\\$flv)");
        matcher=pattern.matcher(returnjson);
        List<String> lastUrl=new ArrayList<>();
        while ( matcher.find()){
            lastUrl.add("https://api.xiaomingming.org/cloud/mp4.php?vid="+matcher.group());
        }
        System.out.println(lastUrl.get(1));
// https://api.xiaomingming.org/cloud/mp4.php?vid=https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_a1723ed4c94e4f2b5014ccf8cb2da50b.mp4

//       Connection.Response response=Jsoup.connect("http://www.imomoe.io/view/7423.html").ignoreContentType(true).method(Connection.Method.GET).execute();
//       Document document= response.parse();
//         String animaName=document.select(".names").text();
//       Elements elements=document.select("#play_0");
//       int nums=elements.select("li").size();//查找一共有多少集
    }
}
