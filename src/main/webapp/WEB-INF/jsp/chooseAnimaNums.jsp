<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>选择集数</title>
</head>
<body bgcolor="#f0f8ff">
<jsp:include page="Ym_title.jsp"></jsp:include>
<div style="width: 90%;margin: auto;margin-top: 20px;padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div style="width: 100%;" class="layui-col-md6">
            <div class="layui-card">
                <div style="font-size: 25px;text-align: center" class="layui-card-header">${animaName}</div>
                <div style="height:800px" class="layui-card-body">
                    &nbsp;&nbsp;
                    <c:forEach items="${animaUrls}" var="animaurl" varStatus="nums">
                      <a href="/AnimaController/lookAnima?url=${animaurl}&num=${nums.index}&animaName=${animaName}" style="margin-top: 20px;line-height: 60px;height: 60px;width: 23%;background-color: lightblue;" type="button"  class="layui-btn layui-btn-normal">第${nums.index+1}集</a>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>