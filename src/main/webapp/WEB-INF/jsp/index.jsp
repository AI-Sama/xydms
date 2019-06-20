<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="com.pojo.Suggest" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>雪渊动漫社</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/denglu.css">
    <script src="/layui-v2.5.4/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui-v2.5.4/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
    <script>
        function loadmore(){
            var page=$("#ggao div").length;
            page/=15;
            var data={
                page:page
            }
            $.ajax({ //Jq的ajax方法
                type: "POST",  //访问的方法
                // dataType: "json", //返回值
                data:data,
                url: "/AnnounceController/findAnnounceByPage", //访问的action路径
                success: function (result){ //如果成功则进入这个函数
                    obj=eval("("+result+")");
                    if(obj.msg!=undefined){
                        alert(obj.msg);
                        return false;
                    }
                    for(var x=0;x<obj.length;x++){
                    str=" <div class=\"gongao showjianjie\">\n" +
                        "        <a href=\"/AnnounceController/jumpAnnounceDetails?id="+obj[x].id+"\">\n" +
                        "                <div class=\"gongao2\">";
                    if(obj[x].imgSrc.length==0){
                      str+='<div class="annImg">\n' +
                          '                        <img width="100%" src="/Img_icon/bgSakura.jpg">\n' +
                          '                    </div>';
                    }else{
                        str+="<div class=\"annImg\" >\n" +
                            "                            <img width=\"100%\"  src=\""+obj[x].imgSrc+"\">\n" +
                            "                        </div>";
                    }
                    str+="<div style=\"margin-right: 2%;margin-top: 10px;float: right;width: 67%;height: 140px;\">\n" +
                        "                        <div style=\"width: 100%;height: 100px\">\n" +
                                               +   obj[x].annName+"\n" +
                        "                        </div>\n" +
                        "                        <div style=\"font-size: 20px;margin-top: 20px;width: 100%;height: 20px;opacity: 0.5\">\n" +
                        "                            <div style=\"float: left\">\n" +
                        "                                <div style=\"float: left\"><img width=\"20px\" height=\"20px\" src=\"/Img_icon/renIcon.png\">\n" +
                        "                                </div>\n" +
                        "                                <div style=\"float: left;color: black;line-height: 20px\">&thinsp;"+obj[x].upUser+"</div>\n" +
                        "                            </div>\n" +
                        "                            <div style=\"float: right\">\n" +
                        "                                <div style=\"float: left \"><img width=\"20px\" height=\"20px\" src=\"/Img_icon/setutime.png\">\n" +
                        "                                </div>\n" +
                        "                                <div style=\"float: left;color: black;line-height: 20px\">\n" +
                        "                                    &thinsp;"+obj[x].upTime+"\n" +
                        "                                </div>\n" +
                        "                            </div>\n" +
                        "                            <div style=\"float: right\">\n" +
                        "                                <div style=\"float: left\"><img width=\"20px\" height=\"20px\" src=\"/Img_icon/lookIcon.png\">\n" +
                        "                                </div>\n" +
                        "                                <div style=\"float: left;color: black;line-height: 20px\">&thinsp;"+obj[x].lookNum+"&#12288;</div>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                </div>\n" +
                        "          </a>\n" +
                        "        </div>";
                    $("#ggao").append(str);
                    }
                    var windowWidth = $(window).width();
                    if (windowWidth > 1200) {
                        $(".gongao2").css("width","94%");
                    }
                }
            });
        }
    </script>
</head>
<body>

<div id="loadYem"
     style="background-color: #f4f6f8;position: fixed;top: 0;left: 0;width: 100%;height: 100%;z-index: 20000;">
    <div style="text-align: center;width: 200px;z-index: 20001;position: fixed;left: 50%;top: 35%;transform:translateX(-50%);">
        <img id="loadimg" src="/Img_icon/loading.png">
        <span style="line-height: 50px;color: lightpink;font-size: 20px">Loading......</span>
    </div>
</div>

<jsp:include page="Ym_title.jsp"></jsp:include>
<div id="jianjie" style="position: relative;top: 930px;margin-top: 30px;width: 100%;height: 500px; text-align: center">
<div class="layui-carousel" id="test10" style="margin: auto">
    <div carousel-item="">
        <div><img style="width: 100%;height: 100%" src="/Img_icon/jianjie.jpg"></div>
        <div><img style="width: 100%;height: 100%"  src="/Img_icon/jianjie2.jpg"></div>
        <div><img style="width: 100%;height: 100%"  src="/Img_icon/jainjie3.jpg"></div>
    </div>
</div>
</div>
<div id="neirong"
     style="position: relative;top: 930px;color: white;background-color:lightblue;width:88%;margin: auto;margin-top: 20px;height: auto;border-radius: 10px">
    <ul style="background-color: lightblue;text-align: center;height: 100px;" class="layui-nav">
        <li id="week1" style="height: 100px;width: 14.2%" class="layui-nav-item"><a style="font-size: 30px;line-height: 100px" href="javascript:void(0)">周一</a></li>
        <li id="week2" style="height: 100px;width: 14.2%" class="layui-nav-item"><a style="font-size: 30px;line-height: 100px" href="javascript:void(0)">周二</a></li>
        <li id="week3" style="height: 100px;width: 14.2%" class="layui-nav-item"><a style="font-size: 30px;line-height: 100px" href="javascript:void(0)">周三</a></li>
        <li id="week4" style="height: 100px;width: 14.2%" class="layui-nav-item"><a style="font-size: 30px;line-height: 100px" href="javascript:void(0)">周四</a></li>
        <li id="week5" style="height: 100px;width: 14.2%" class="layui-nav-item"><a style="font-size: 30px;line-height: 100px" href="javascript:void(0)">周五</a></li>
        <li id="week6" style="height: 100px;width: 14.2%" class="layui-nav-item"><a style="font-size: 30px;line-height: 100px" href="javascript:void(0)">周六</a></li>
        <li id="week7" style="height: 100px;width: 14.2%" class="layui-nav-item"><a style="font-size: 30px;line-height: 100px" href="javascript:void(0)">周日</a></li>
    </ul>
    <div id="zhou1" style="display: none">
        <c:forEach items="${sessionScope.animaList.week1}" var="zhou1">
            <a href="${zhou1.animaAddr}">
                <div class="hoverAnima"
                     style="font-family: 楷体;line-height: 60px;font-size: 30px;width: 100%;height: 60px;background-color: lightblue;color: white">
                    &#12288;&#12288;${zhou1.animaName}
                </div>
            </a>
            <hr style="width: 100%;height: 5px;border: none;background-color: white">
        </c:forEach>
    </div>
    <div id="zhou2" style="display: none">
        <c:forEach items="${sessionScope.animaList.week2}" var="zhou1">
            <a href="${zhou1.animaAddr}">
                <div class="hoverAnima"
                     style="font-family: 楷体;line-height: 60px;font-size: 30px;width: 100%;height: 60px;background-color: lightblue;color: white">
                    &#12288;&#12288;${zhou1.animaName}
                </div>
            </a>
            <hr style="width: 100%;height: 5px;border: none;background-color: white">
        </c:forEach>
    </div>
    <div id="zhou3" style="display: none">
        <c:forEach items="${sessionScope.animaList.week3}" var="zhou1">
            <a href="${zhou1.animaAddr}">
                <div class="hoverAnima"
                     style="font-family: 楷体;line-height: 60px;font-size: 30px;width: 100%;height: 60px;background-color: lightblue;color: white">
                    &#12288;&#12288;${zhou1.animaName}
                </div>
            </a>
            <hr style="width: 100%;height: 5px;border: none;background-color: white">
        </c:forEach>
    </div>
    <div id="zhou4" style="display: none">
        <c:forEach items="${sessionScope.animaList.week4}" var="zhou1">
            <a href="${zhou1.animaAddr}">
                <div class="hoverAnima"
                     style="font-family: 楷体;line-height: 60px;font-size: 30px;width: 100%;height:60px;background-color: lightblue;color: white">
                    &#12288;&#12288;${zhou1.animaName}
                </div>
            </a>
            <hr style="width: 100%;height: 5px;border: none;background-color: white">
        </c:forEach>
    </div>
    <div id="zhou5" style="display: none">
        <c:forEach items="${sessionScope.animaList.week5}" var="zhou1">
            <a href="${zhou1.animaAddr}">
                <div class="hoverAnima"
                     style="font-family: 楷体;line-height: 60px;font-size: 30px;width: 100%;height: 60px;background-color: lightblue;color: white">
                    &#12288;&#12288;${zhou1.animaName}
                </div>
            </a>
            <hr style="width: 100%;height: 5px;border: none;background-color: white">
        </c:forEach>
    </div>
    <div id="zhou6" style="display: none">
        <c:forEach items="${sessionScope.animaList.week6}" var="week">
            <a href="${week.animaAddr}">
                <div class="hoverAnima"
                     style="font-family: 楷体;line-height: 60px;font-size: 30px;width: 100%;height: 60px;background-color: lightblue;color: white">
                    &#12288;&#12288;${week.animaName}
                </div>
            </a>
            <hr style="width: 100%;height: 5px;border: none;background-color: white">
        </c:forEach>
    </div>
    <div id="zhou7" style="display: none">
        <c:forEach items="${sessionScope.animaList.week7}" var="zhou1">
            <a href="${zhou1.animaAddr}">
                <div class="hoverAnima"
                     style="font-family: 楷体;line-height: 60px;font-size: 30px;width: 100%;height:60px;background-color: lightblue;color: white">
                    &#12288;&#12288;${zhou1.animaName}
                </div>
            </a>
            <hr style="width: 100%;height: 5px;border: none;background-color: white">
        </c:forEach>
    </div>
</div>
<%-- 公告 --%>

<div id="ggao" style="position: relative;margin-top: 950px">
    <c:forEach items="${anns}" var="item">
        <div class="gongao">
        <a href="/AnnounceController/jumpAnnounceDetails?id=${item.id}">
                <div class="gongao2">
                    <c:if test="${empty item.imgSrc}">
                    <div class="annImg">
                        <img width="100%" src="/Img_icon/bgSakura.jpg">
                    </div>
                    </c:if>
                    <c:if test="${ not empty item.imgSrc}">
                        <div class="annImg" >
                            <img width="100%"  src="${item.imgSrc}">
                        </div>
                    </c:if>
                    <div style="margin-right: 2%;margin-top: 10px;float: right;width: 67%;height: 140px;">
                        <div style="width: 100%;height: 100px">
                          ${item.annName}
                        </div>
                        <div style="font-size: 20px;margin-top: 20px;width: 100%;height: 20px;opacity: 0.5">
                            <div style="float: left">
                                <div style="float: left"><img width="20px" height="20px" src="/Img_icon/renIcon.png">
                                </div>
                                <div style="float: left;color: black;line-height: 20px">&thinsp;${item.upUser}</div>
                            </div>
                            <div style="float: right">
                                <div style="float: left "><img width="20px" height="20px" src="/Img_icon/setutime.png">
                                </div>
                                <div style="float: left;color: black;line-height: 20px">
                                    &thinsp;${item.upTime}
                                </div>
                            </div>
                            <div style="float: right">
                                <div style="float: left"><img width="20px" height="20px" src="/Img_icon/lookIcon.png">
                                </div>
                                <div style="float: left;color: black;line-height: 20px">&thinsp;${item.lookNum}&#12288;</div>
                            </div>
                        </div>
                    </div>
                </div>
          </a>
        </div>
    </c:forEach>
</div>
<div id="loadmore" style="text-align: center;margin-top: 20px">
    <button style="background-color: lightblue"  type="button" onclick="loadmore()" class="layui-btn layui-btn-normal">点击加载更多</button>
</div>
<div style="width: 100%">
    <div style="text-align: center;color: white">
        本网站资源均来自于网络,仅供学校社团内部交流使用,如有侵权,请联系管理员QQ79479334
    </div>
</div>
<script>
    layui.use(['carousel', 'form'], function(){
        var carousel = layui.carousel
            ,form = layui.form;

        //常规轮播
        carousel.render({
            elem: '#test1'
            ,arrow: 'always'
        });

        //改变下时间间隔、动画类型、高度
        carousel.render({
            elem: '#test2'
            ,interval: 1800
            ,anim: 'fade'
            ,height: '120px'
        });

        //设定各种参数
        var ins3 = carousel.render({
            elem: '#test3'
        });
        //图片轮播
        carousel.render({
            elem: '#test10'
            ,width: '94%'
            ,height: '100%'
            ,interval: 5000
        });

        //事件
        carousel.on('change(test4)', function(res){
            console.log(res)
        });

        var $ = layui.$, active = {
            set: function(othis){
                var THIS = 'layui-bg-normal'
                    ,key = othis.data('key')
                    ,options = {};

                othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                options[key] = othis.data('value');
                ins3.reload(options);
            }
        };

        //监听开关
        form.on('switch(autoplay)', function(){
            ins3.reload({
                autoplay: this.checked
            });
        });

        $('.demoSet').on('keyup', function(){
            var value = this.value
                ,options = {};
            if(!/^\d+$/.test(value)) return;

            options[this.name] = value;
            ins3.reload(options);
        });

        //其它示例
        $('.demoTest .layui-btn').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });
</script>
</body>
</html>