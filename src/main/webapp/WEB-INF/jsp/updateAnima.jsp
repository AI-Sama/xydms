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
        function dropAnimas() {
            if(confirm("您确定要删除全部动画吗?")){
                $.ajax({
                    type:"post",
                    url:"/AnimaController/dropAnimas",
                    success:function (result) {
                         alert(result)
                    }
                })
            }
        }
        function deleteAnima() {
           var animaName= prompt("请输入要删除的动画名称:");
           var data={
               animaName:animaName
           }
           $.ajax({
                 type:"post",
                 data:data,
                 url:"/AnimaController/deleteAnima",
                 success:function (result) {
                       alert(result);
                 }
           })
        }
        function updateAnima() {
            var name = $("#animaName").val();
            var href = $("#animaHref").val();
            var week = $("#weekDay").val();
            var animaList = {
                animaName: name,
                animaAddr: href,
                weekDay: week
            }
            $.ajax({
                type: "post",
                url: "/AnimaController/addAnima",
                data: animaList,
                success: function (result) {
                    alert(result);
                    $("#animaName").val("");
                    $("#animaHref").val("");
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
<div style="width: 90%;padding: 20px;margin: auto;font-size: 20px;margin-top: 20px;background-color: white">
    <div style="width: 80%;margin: auto;margin-top: 50px;margin-bottom:50px;border: 2px lightblue solid">
    <div style="margin: auto;;margin-top:10px;width: 100%;height: 50px;font-size: 20px;line-height: 50px;text-align: center">
        <span style="display: block;float: left;width: 40%">请选择动画更新日期:</span>
        <select id="weekDay" style="float: left;font-size: 20px;width:55%;height: 30px;margin-top: 10px">
        <option value="周一">星期一</option>
        <option value="周二">星期二</option>
        <option value="周三">星期三</option>
        <option value="周四">星期四</option>
        <option value="周五">星期五</option>
        <option value="周六">星期六</option>
        <option value="周日">星期日</option>
    </select>
    </div>
    <div style="text-align: center;margin: auto;width: 100%;height: 50px;font-size: 20px;line-height: 50px">
        <span style="display: block;float: left;width: 40%">请输入动画名称:</span>
        <input id="animaName" type="text" style="float: left;font-size: 20px;width:55%;height: 30px;margin-top: 10px">
    </div>
    <div style="text-align: center;margin: auto;width: 100%;height: 50px;font-size: 20px;line-height: 50px">
        <span style="display: block;float: left;width: 40%">请输入动画链接:</span>
        <input id="animaHref" type="text" style="float: left;font-size: 20px;width:55%;height: 30px;margin-top: 10px">
    </div>
        <div style="text-align: center;margin: auto;margin-top: 20px;margin-bottom: 20px;width: 95%;height: 50px;font-size: 25px;line-height: 50px">

          <a href="javascript:void(0)">
              <div style="margin-left: 1%;float: left;width: 32.3%;height: 100%;background-color: lightblue;color: white;line-height: 50px;font-size: 20px"
                 onclick="updateAnima()" style="width: 100px">提交
            </div>
            <div onclick="deleteAnima()" style="margin-left: 1%;float: left;width: 32.3%;height: 100%;background-color: lightblue;color: white;line-height: 50px;font-size: 20px">
                删除一条番剧
            </div>
            <div onclick="dropAnimas()" style="margin-left: 1%;float: left;width: 32.3%;height: 100%;background-color: lightblue;color: white;line-height: 50px;font-size: 20px">
                删除全部番剧
            </div>
          </a>
        </div>
    </div>
</div>
</body>
</html>
