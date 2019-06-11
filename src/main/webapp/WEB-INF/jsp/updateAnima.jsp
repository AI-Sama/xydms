<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>番剧更新</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
    <script>
        function updateAnima() {
            var name=$("#animaName").val();
            var href=$("#animaHref").val();
            var week=$("#weekDay").val();
            var animaList={
                animaName:name,
                animaAddr:href,
                weekDay:week
            }
            $.ajax({
                type:"post",
                contentType:"application/json",
                url:"/Items/updateAnima",
                data:JSON.stringify(animaList),
                success:function(result){
                    alert(result);
                }
            })
        }
    </script>
</head>
<body>
<!-- 登录表头-->
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>
        <form action="" style="text-align: center;width: 90%;margin: auto;font-size: 20px;margin-top: 20px;background-color: white">
        请输入番剧名称:<input id="animaName" type="text" style="width: 300px"><br>
        请输入番剧链接:<input id="animaHref" type="text" style="width: 300px"><br>
            请选择番剧更新日期:<select id="weekDay">
            <option value="周一">星期一</option>
            <option value="周二">星期二</option>
            <option value="周三">星期三</option>
            <option value="周四">星期四</option>
            <option value="周五">星期五</option>
            <option value="周六">星期六</option>
            <option value="周日">星期日</option>
        </select>
            <br>
            <input onclick="updateAnima()" type="button" value="提交" style="width: 100px">
        </form>
</body>
</html>
