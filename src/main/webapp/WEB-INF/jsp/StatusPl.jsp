<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>评论审核</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
</head>

<body >

<!-- 登录表头-->
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>
<table style="color: #428bca;text-align: center;width: 95%;margin: auto;margin-top: 20px" >
    <tr style="color:black;">
        <td style="width: 20%;border: #428bca 1px solid;background: white">
        评论人
        </td>
        <td style="width: 60%;border: #428bca 1px solid;background: white">
            评论内容
        </td>  <td style="width: 20%;border: #428bca 1px solid;background: white">
        审核结果
    </td>

    </tr>
<c:forEach items="${pluns}" var="plun">
<tr>
    <td style="width: 20%;border: #428bca 1px solid;background: white">
            ${plun.pUserName}
    </td>
    <td style="width: 60%;border: #428bca 1px solid;background: white">
        ${plun.pText}
    </td>
    <td style="width: 20%;border: #428bca 1px solid;background: white">
            <a href="/Items/changePlueStatus?status=1&id=${plun.id}" style="color: red;">通过</a>&nbsp;|&nbsp;<a href="/Items/changePlueStatus?status=2&id=${plun.id}" style="color: red;">未通过</a>
    </td>
</tr>
</c:forEach>
</table>
</body>
</html>
