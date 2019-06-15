<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>雪渊动漫社</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/denglu.css">
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
    <script>
        function loadmore(){
            $.ajax({ //Jq的ajax方法
                type: "POST",  //访问的方法
                dataType: "text", //返回值
                url: "/Items/loadMoreGongao", //访问的action路径
             //   data: null,  //传输的数据
                success: function (result){ //如果成功则进入这个函数
                    if(result=="no"){
                        $("#loadmore").text("没有更多了...");
                        $("#loadmore").css("background-color","");
                        $("#loadmore").css("font-size","20px");
                        $("#loadmore").css("color","black");
                    }else{
                        window.location.reload();
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
   <img id="welcomeXy" style="width: 95%;height: 100%;border-radius: 8px" src="/Img_icon/jianjie.jpg">
</div>
<div id="neirong"
     style="position: relative;top: 930px;color: white;background-color:lightblue;width:88%;margin: auto;margin-top: 20px;height: auto;border-radius: 10px">
    <div style="width: 100%;height: 90px;">
        <div id="week1" class="backcolor"
             style="text-align: center;font-size: 30px;width: 14.2%;float: left;height: 100%;line-height: 90px">周一
        </div>
        <div id="week2" class="backcolor"
             style="text-align: center;font-size: 30px;width: 14.2%;float: left;height: 100%;line-height: 90px">周二
        </div>
        <div id="week3" class="backcolor"
             style="text-align: center;font-size: 30px;width: 14.2%;float: left;height: 100%;line-height: 90px">周三
        </div>
        <div id="week4" class="backcolor"
             style="text-align: center;font-size: 30px;width: 14.2%;float: left;height: 100%;line-height: 90px">周四
        </div>
        <div id="week5" class="backcolor"
             style="text-align: center;font-size: 30px;width: 14.2%;float: left;height: 100%;line-height: 90px">周五
        </div>
        <div id="week6" class="backcolor"
             style="text-align: center;font-size: 30px;width: 14.2%;float: left;height: 100%;line-height: 90px">周六
        </div>
        <div id="week7" class="backcolor"
             style="text-align: center;font-size: 30px;width: 14.5%;float: left;height: 100%;line-height: 90px">周日
        </div>
    </div>
    <hr style="width: 100%;height: 5px;border: none;background-color: white">

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
        <a href="/AnnounceController/jumpAnnounceDetails?id=${item.id}">
            <div class="gongao">
                <div class="gongao2"
                     style="color: gray;font-family: 楷体;font-size: 30px;margin: auto;margin-top: 20px;width: 88%;background-color: white;border-radius: 5px;height: 160px">
                    <c:if test="${empty item.imgSrc}">
                    <div style="overflow: hidden;margin-left: 2%;margin-top: 10px;float: left;width: 27%;height: 140px">
                        <img width="100%" src="/Img_icon/bgSakura.jpg">
                    </div>
                    </c:if>
                    <c:if test="${ not empty item.imgSrc}">
                        <div style="overflow: hidden;margin-left: 2%;margin-top: 10px;float: left;width: 27%;height: 140px">
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
                                <div style="float: left;color: black;line-height: 20px">&thinsp;<fmt:formatDate value="${item.upTime}" type="date"></fmt:formatDate></div>
                            </div>
                            <div style="float: right">
                                <div style="float: left"><img width="20px" height="20px" src="/Img_icon/lookIcon.png">
                                </div>
                                <div style="float: left;color: black;line-height: 20px">&thinsp;${item.lookNum}&#12288</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </c:forEach>
    <a href="javascript:loadmore()"><div id="loadmore" style="width: 20%;height: 40px;margin: auto;margin-top: 20px;text-align: center;color: white;line-height: 40px;background-color: lightblue">
        点击加载更多..
    </div></a>
</div>

<div style="width: 100%">
    <div style="text-align: center;color: white">
        本网站资源均来自于网络,仅供学校社团内部交流使用,如有侵权,请联系管理员QQ79479334
    </div>
</div>
</body>
</html>