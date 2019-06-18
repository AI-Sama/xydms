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
    <script src="/layui-v2.5.4/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui-v2.5.4/layui/css/layui.css">
</head>
<body style="width: 100%;height: 100%;overflow-x: hidden">
<div style="position: relative;overflow: auto;width: 90%;max-height:90%;margin: auto;text-align: center">
    <img style="min-width: 50%;max-width: 100%" src="/bigImg/${img.imgAddr}">
</div>
<div style="text-align: center;margin-top: 10px">
    <span  class="layui-badge-rim">观看数:${img.clickNum}</span>
    <span  class="layui-badge-rim">上传人:${img.upUser}</span>
    <span  class="layui-badge-rim">图片出处:${img.imgMsg}</span>
</div>
<div style="text-align: center;margin-top: 10px">
    <button type="button" style="background-color: lightblue;"  onclick="window.history.go(-1)" class="layui-btn layui-btn-normal">返回</button>
    <c:if test="${sessionScope.user.lv>0}">
        <button style="background-color: lightblue;" type="button" onclick="deleteImg('${img.id}')" class="layui-btn layui-btn-normal">删除</button>
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