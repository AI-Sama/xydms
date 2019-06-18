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
           if(!animaName){
               return false;
           }
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
<div style="width: 90%;padding: 20px;margin: auto;font-size: 10px;margin-top: 20px;background-color: white">
    <form class="layui-form layui-form-pane" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">番剧名称</label>
            <div class="layui-input-block">
                <input id="animaName" type="text" name="title" autocomplete="off" placeholder="请输入番剧名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">番剧链接</label>
            <div class="layui-input-block">
                <input id="animaHref"  type="text" name="title" autocomplete="off" placeholder="请输入番剧链接" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">更新日期</label>
            <div class="layui-input-inline">
                <select id="weekDay" name="quiz1">
                    <option value="周一" selected="">星期一</option>
                    <option value="周二">星期二</option>
                    <option value="周三">星期三</option>
                    <option value="周四">星期四</option>
                    <option value="周五">星期五</option>
                    <option value="周六">星期六</option>
                    <option value="周日">星期日</option>
                </select>
            </div>
        </div>
        <div style="text-align: center">
            <button type="button" style="width: 100px;background-color: lightblue;" onclick="updateAnima()" class="layui-btn layui-btn-normal">提交</button>
            <button type="button" style="width: 150px;background-color: lightblue;" onclick="deleteAnima()" class="layui-btn layui-btn-normal">删除一条番剧</button>
            <button type="button" style="width: 150px;background-color: lightblue;" onclick="dropAnimas()" class="layui-btn layui-btn-normal">删除全部番剧</button>
        </div>
    </form>
</div>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
    });
</script>
</body>
</html>
