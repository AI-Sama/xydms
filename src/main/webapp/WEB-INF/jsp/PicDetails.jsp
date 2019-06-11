<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>--%>
<html>
<head>
    <title>图片查看</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/BigImg_css_mobile.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/img.js"></script>
    <script >
    $(document).ready(function(){
        var windowWidth = $(window).width();
        if (windowWidth > 1200) {
            $(".upName").css("bottom","13%");
        }

    });
    </script>
</head>
<body>
<c:if test="${img.imgType==1}">
    <div >
        <img style="position: absolute;margin-left:-20%;top:10%;width:140%;transform: rotate(90deg)"
          src="/bigImg/${img.addr}" alt="图片">
    </div>
</c:if>
<c:if test="${img.imgType==0}">
    <div>
        <div class="bigImg_hide"><img id="Img1" src="/bigImg/${img.addr}" alt="图片"></div>
    </div>
</c:if>
<table class="upName">
    <tr>
        <th><img style="height: 18px;width: 18px" src="/Img_icon/renIcon.png"></th>
        <td>&nbsp;</td>
        <td>${img.fu}</td>
        <td>&nbsp;&nbsp;</td>
        <th><img style="height: 18px;width: 18px;" src="/Img_icon/wenjian.png"></th>
        <td>&nbsp;</td>
        <td> ${img.imgMessage}</td>
    </tr>
</table>
<div class="anjian_css">
    <div class="button_css">
        <c:if test="${empty sessionScope.user}">
            <img class="heart_css" src="${pageContext.request.contextPath}/Img_icon/heart_w.png" title="收藏"
                 onclick="alert('请登录后再使用收藏功能')">
        </c:if>
        <c:if test="${not empty sessionScope.user}">
        <c:if test="${isSc==1}">
            <img class="heart_css" src="${pageContext.request.contextPath}/Img_icon/heart_r.png" title="收藏"
                 onclick="bigImgsc(this,'${img.addr}')">
        </c:if>
        <c:if test="${isSc!=1}">
            <img class="heart_css" src="${pageContext.request.contextPath}/Img_icon/heart_w.png" title="收藏"
                 onclick="bigImgsc(this,'${img.addr}')">
        </c:if>
        </c:if>
    </div>
    <div class="button_css">
        <img class="back_css" src="${pageContext.request.contextPath}/Img_icon/back.png" title="返回"
             onclick="window.history.go(-1)">
    </div>
</div>

<c:if test="${sessionScope.user.lv>=4}">
    <div class="lv_button_css">
        <img class="delete_css" src="${pageContext.request.contextPath}/Img_icon/delete.png" title="返回"
             onclick="deleteImg('${img.addr}')">
    </div>
</c:if>
</body>
</html>