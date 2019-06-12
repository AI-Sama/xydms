<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>壁纸</title>
</head>

<style>
    .imgHover:hover {
        transform: scale(1.1);
    }
</style>
<body bgcolor="#f0f8ff">
<jsp:include page="Ym_title.jsp"></jsp:include>
<div style="width: 95%;height: auto;margin:auto;margin-top: 20px;">
    <c:forEach items="${imgs}" var="img">
        <a href="/WallpaperController/jumpImgDetails?id=${img.id}">
            <div class="imgHover" style="background-image: url('/smallImg/${img.imgAddr}');
                    background-size:cover;background-position:center;
                    overflow:hidden;margin-top:30px;
                    border-radius: 8px;
                    margin-left:2%;width: 31%;float: left;height: 440px;">
            </div>
        </a>
    </c:forEach>
    <div style="border-radius: 10px;overflow:auto;line-height: 80px;font-size: 40px;margin-top:30px;background-color: lightblue;width: 100%;float: left;height: 100px;text-align: center">
        <c:if test="${nowPageCount>1}">
            <a href="/Items/LoadImg?nowPageCount=${nowPageCount-1}&type=${type}">
                <div style="color:white;margin-left: 20%;border-radius: 20px;float: left;width: 20%;height: 80px;margin-top:10px;">
                    上一页
                </div>
            </a>
        </c:if>
        <c:if test="${nowPageCount<=1}">
            <div onclick="alert('已经是第一页了')"
                 style="color:white;margin-left: 20%;border-radius: 20px;float: left;width: 20%;height: 80px;margin-top:10px;">
                上一页
            </div>
        </c:if>
        <div style="width: 19%;float:left;line-height: 100px;color: white">${nowPageCount}/${pageCount}</div>
        <c:if test="${nowPageCount<pageCount}">
            <a href="/Items/LoadImg?nowPageCount=${nowPageCount+1}&type=${type}">
                <div style="color:white;border-radius: 20px;margin-right: 20%;float: right;width: 20%;height: 80px;margin-top:10px">
                    下一页
                </div>
            </a>
        </c:if>
        <c:if test="${nowPageCount>=pageCount}">
            <div onclick="alert('已经是最后一页了')"
                 style="color:white;border-radius: 20px;margin-right: 20%;float: right;width: 20%;height: 80px;margin-top:10px">
                下一页
            </div>
        </c:if>
    </div>
</div>
</body>
</html>