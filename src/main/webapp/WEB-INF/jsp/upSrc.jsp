<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>发布资源</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/srcMess.css"/>
</head>
<body bgcolor="#e4e7ee" >
<!-- 登录表头-->
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>
    <form class="upSrcBig" action="/ResourceController/upSrc" method="post" enctype="multipart/form-data">
    <div class="upSrcTitle">
        资源标题&nbsp;:&#12288<input style="width: 74.5%;height: 30px" type="text" maxlength="80" name="srcTitle" placeholder="请输入资源标题(最多80个字)">
    </div>
    <div class="upSrcText">
        资源描述:<textarea style="font-size: 20px;width: 91.5% " rows="10" cols="60" name="srcText" placeholder="请输入资源描述,出处等(最多500个字)......"></textarea>
    </div>
    <div class="upSrcImg">
        主图&nbsp;:&#12288<input type="file" accept="image/*" name="srcFile"><br><br>
        图一&nbsp;:&#12288<input type="file" accept="image/*" name="srcFile"><br><br>
        图二&nbsp;:&#12288<input type="file" accept="image/*" name="srcFile"><br><br>
    </div>
        <div style="width: 100px;margin: auto;margin-bottom: 40px">
        <input class="submit_src" type="submit" value="提交">
        </div>
    </form>
</body>
</html>
