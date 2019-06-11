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
        <tr style="color: lightpink;height: 40px;background: white;border:lightpink 1px solid; "><td>开课学期</td><td>课程名称</td><td>分数</td><td>学分</td><td>考核方式</td><td>课程属性</td></tr>
        <c:forEach items="${sessionScope.cji}" var="kemu">
            <tr style="background: lightpink ">
                <c:forEach items="${kemu}" var="item">
                    <td  style="border:white 1px solid;height: 50px;color: white"> ${item}</td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    <c:if test="${empty sessionScope.cji}">
            <script>
                alert("账号密码错误或成绩暂未公布");
                window.location.replace("/Items/title_Click?titName=工具");
            </script>
    </c:if>
</div>
</body>
</html>
