<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>成绩</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
</head>
<script >
    $("#loadIng").css("display","none");
</script>
<body>
<!-- 登录表头-->
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>
<div style="margin-top: 30px;font-family: '楷体'">
    <table style="margin: auto;text-align: center;width: 95%;">
        <tr style="font-size: 30px;color: lightblue;height: 50px;background: white;border:lightblue 1px solid; "><td>编号</td><td>课程名称</td><td>成绩</td></tr>
        <c:forEach items="${cjs}" var="kemu" varStatus="num">
            <tr style="font-size: 30px;background: lightblue ">
                <td  style="width: 10%;border:white 1px solid;height: 60px;color: white"> ${num.index+1}</td>
                    <td  style="border:white 1px solid;height: 60px;color: white"> ${kemu['mc']}</td>
                    <td  style="width: 15%;border:white 1px solid;height: 60px;color: white"> ${kemu['cj']}</td>
            </tr>
        </c:forEach>
    </table>
    <c:if test="${empty cjs}">
            <script>
                alert("账号或密码错误");
                window.location.replace("/ToolsController/jumpTools");
            </script>
    </c:if>
</div>
</body>
</html>
