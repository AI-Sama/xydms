<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>壁纸审核</title>
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
</div>
</body>
</html>