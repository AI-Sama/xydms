<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>社团资源</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/srcMess_mobile.css"/>
</head>
<body bgcolor="#e4e7ee" >
<!-- 登录表头-->
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>
<div class="srcBig">
    <c:forEach items="${sessionScope.srcs}" var="message">
        <a href="/ResourceController/jumpResDetails?messId=${message.id}">
            <div class="srcSmall">
                <div style="width: 90%;height: 70%;margin:auto;margin-top:10px;overflow: hidden;">
                <img style="width: 100%;" src="/srcImg/${message.srcImg01}">
                </div>
                <div class="srcTitle">
                        ${message.srcTitle}
                </div>
            </div>
        </a>
    </c:forEach>
    <div style="border-radius: 10px;overflow:auto;line-height: 80px;font-size: 40px;margin-top:50px;background-color: lightblue;width: 100%;float: left;height: 100px;text-align: center">
        <c:if test="${nowPageNum>1}">
            <a href="/ResourceController/loadSrc?nowPageNum=${nowPageNum-1}&type=${type}">
                <div style="color:white;margin-left: 20%;border-radius: 20px;float: left;width: 20%;height: 80px;margin-top:10px;">
                    上一页
                </div>
            </a>
        </c:if>
        <c:if test="${nowPageNum<=1}">
            <div onclick="alert('已经是第一页了')"
                 style="color:white;margin-left: 20%;border-radius: 20px;float: left;width: 20%;height: 80px;margin-top:10px;">
                上一页
            </div>
        </c:if>
        <div style="width: 18%;float:left;line-height: 100px;color: white">${nowPageNum}/${allPageNum}</div>
        <c:if test="${nowPageNum<allPageNum}">
            <a href="/ResourceController/loadSrc?nowPageNum=${nowPageNum+1}&type=${type}">
                <div style="color:white;border-radius: 20px;margin-right: 20%;float: right;width: 20%;height: 80px;margin-top:10px">
                    下一页
                </div>
            </a>
        </c:if>
        <c:if test="${nowPageNum>=allPageNum}">
            <div onclick="alert('已经是最后一页了')"
                 style="color:white;border-radius: 20px;margin-right: 20%;float: right;width: 20%;height: 80px;margin-top:10px">
                下一页
            </div>
        </c:if>
    </div>
</div>
</body>
</html>
