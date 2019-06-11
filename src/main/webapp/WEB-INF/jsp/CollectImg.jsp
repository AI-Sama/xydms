<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>我的收藏</title>
</head>
<body bgcolor="#f0f8ff" >
<%
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-cache");
    //禁用缓存
%>
<jsp:include page="Ym_title.jsp"></jsp:include>
<div style="width: 95%;height: auto;margin:auto;margin-top: 20px;">
    <c:forEach items="${sessionScope.ScImg}" var="img">
       <a href="/Items/bigImgShow?addr=${img}"> <div style="overflow:auto;margin-top:30px;margin-left:2%;width: 31%;float: left;height: 300px;text-align: center">
            <img style="border-radius: 8px;height:100%;" src="/smallImg/${img}">
        </div></a>
    </c:forEach>
    <div style="border-radius: 10px;overflow:auto;line-height: 80px;font-size: 40px;margin-top:30px;background-color: lightblue;width: 100%;float: left;height: 100px;text-align: center">
        <c:if test="${pageNum>1}">
      <a href="/Items/MyScImg?nowPageCount=${pageNum-1}">  <div style="color:white;margin-left: 20%;border-radius: 20px;float: left;width: 20%;height: 80px;margin-top:10px;">
            上一页
        </div></a>
        </c:if>
        <c:if test="${pageNum<=1}">
            <div onclick="alert('已经是第一页了')" style="color:white;margin-left: 20%;border-radius: 20px;float: left;width: 20%;height: 80px;margin-top:10px;">
                上一页
            </div>
        </c:if>
        <div style="width: 18%;float:left;line-height: 100px;color: white">${pageNum}/${allPageNum}</div>
        <c:if test="${pageNum<allPageNum}">
        <a href="/Items/MyScImg?pageNum=${pageNum+1}"><div style="color:white;border-radius: 20px;margin-right: 20%;float: right;width: 20%;height: 80px;margin-top:10px">
            下一页
        </div></a>
        </c:if>
        <c:if test="${pageNum>=allPageNum}">
           <div onclick="alert('已经是最后一页了')" style="color:white;border-radius: 20px;margin-right: 20%;float: right;width: 20%;height: 80px;margin-top:10px">
                下一页
            </div>
        </c:if>
    </div>
</div>
</body>
</html>