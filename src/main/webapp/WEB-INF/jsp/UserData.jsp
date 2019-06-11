<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>个人资料</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
</head>

<body>

<!-- 登录表头-->
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>

<div style="width: 95%;height: 1000px;background-color:lightblue;margin: auto;margin-top: 30px;border-radius: 8px" >
        <div style="border: 5px lightpink solid;overflow: hidden;border-radius: 50%;position: relative;background-color: red;width: 300px;height: 300px;left: 50%;top: 50px;transform: translateX(-50%)">
             <img src="/Img_icon/bgSakura.jpg" style="width: 100%;height: 100%" >
        </div>
</div>
</body>
</html>
