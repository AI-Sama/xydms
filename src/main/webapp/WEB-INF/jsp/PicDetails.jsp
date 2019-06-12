<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>--%>
<html style="width: 100%;height: 100%;">
<head>
    <title>图片查看</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/BigImg_css_mobile.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/img.js"></script>
</head>
<body style="width: 100%;height: 100%">
<div style="position: relative;overflow: auto;width: 90%;max-height:90%;margin: auto;text-align: center">
    <img style="min-width: 60%;max-width: 100%" src="/bigImg/${img.imgAddr}">
</div>
<table class="upName">
    <tr>
        <th><img style="height: 18px;width: 18px" src="/Img_icon/renIcon.png"></th>
        <td>${img.upUser}</td>
        <td>&nbsp;&nbsp;</td>
        <th><img style="height: 18px;width: 18px;" src="/Img_icon/wenjian.png"></th>
        <td> ${img.imgMsg}</td>
    </tr>
</table>
<div style="width: 20%;height: 50px;margin: 0 auto;">
    <div  style="position: relative;float: left;left: 50%;margin-left: -70px;border-radius: 50%;width: 50px;height: 50px;background-color: black;border:2px solid black">
        <img class="buttons" style="border-radius: 50%;width: 100%" src="${pageContext.request.contextPath}/Img_icon/back.png" title="返回"
             onclick="window.history.go(-1)">
    </div>
    <c:if test="${sessionScope.user.lv>=0}">
    <div  style="position: relative;float: left;left: 50%;border-radius: 50%;width: 50px;height: 50px;background-color: black;border:2px solid black">
        <img class="buttons" style="border-radius: 50%;width: 100%" src="${pageContext.request.contextPath}/Img_icon/delete.png" title="删除"
             onclick="deleteImg('${img.id}')">
    </div>
    </c:if>
</div>
<%--<div class="anjian_css">--%>
<%--<div class="button_css">--%>
<%--<c:if test="${empty sessionScope.user}">--%>
<%--<img class="heart_css" src="${pageContext.request.contextPath}/Img_icon/heart_w.png" title="收藏"--%>
<%--onclick="alert('请登录后再使用收藏功能')">--%>
<%--</c:if>--%>
<%--<c:if test="${not empty sessionScope.user}">--%>
<%--<c:if test="${isSc==1}">--%>
<%--<img class="heart_css" src="${pageContext.request.contextPath}/Img_icon/heart_r.png" title="收藏"--%>
<%--onclick="bigImgsc(this,'${img.addr}')">--%>
<%--</c:if>--%>
<%--<c:if test="${isSc!=1}">--%>
<%--<img class="heart_css" src="${pageContext.request.contextPath}/Img_icon/heart_w.png" title="收藏"--%>
<%--onclick="bigImgsc(this,'${img.addr}')">--%>
<%--</c:if>--%>
<%--</c:if>--%>
<%--</div>--%>
<%--</div>--%>
</body>
</html>