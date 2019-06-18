<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>人员管理</title>
    <style>
        td {
            border: 2px solid white;
            background-color: lightblue;
            height: 40px;
            color: white;
        }
    </style>
</head>
<script>
    function addManage(id) {
        var flag = confirm("您确定要将其设置为管理员吗?")
        if (!flag) {
            return false;
        }
        var var1 = {
            userId: id
        };
        $.ajax({
            type: "POST",
            url: "/UserController/addManage",
            data: var1,
            success: function (result) {
                alert(result);
                window.location.reload();
            }
        })
    }

    function deleteManage(id) {
        var flag = confirm("您确定要取消其管理员吗?")
        if (!flag) {
            return false;
        }
        var var1 = {
            userId: id
        };
        $.ajax({
            type: "POST",
            url: "/UserController/deleteManage",
            data: var1,
            success: function (result) {
                alert(result);
                window.location.reload();
            }
        })
    }

    function resetPassword(id) {
        var flag = confirm("您确定要重置其密码吗?");
        if (!flag) {
            return false;
        }
        var var1 = {
            userId: id
        };
        $.ajax({
            type: "POST",
            url: "/UserController/resetPassword",
            data: var1,
            success: function (result) {
                alert(result);
                window.location.reload();
            }
        })
    }
</script>
<body>
<jsp:include page="Ym_title.jsp"></jsp:include>
<div class="layui-form" style="width: 94%;text-align: center;margin: auto">
    <table class="layui-table" style="text-align: center">
        <colgroup>
            <col width="60">
            <col width="150">
            <col width="350">
            <col width="150">
            <col width="80">
            <col width="300">
        </colgroup>
        <thead>
        <tr>
            <th style="text-align: center">ID</th>
            <th style="text-align: center">用户名</th>
            <th style="text-align: center">邮箱</th>
            <th style="text-align: center">权限</th>
            <th style="text-align: center">等级</th>
            <th style="text-align: center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sessionScope.users}" var="user" varStatus="num">
            <tr>
                <td>${num.index+1}</td>
                <td>${user.userName}</td>
                <td>${user.email}</td>
                <c:if test="${user.lv==0}">
                    <td>社员</td>
                </c:if>
                <c:if test="${user.lv==1}">
                    <td>管理员</td>
                </c:if>
                <c:if test="${user.lv>=2}">
                    <td>超级管理员</td>
                </c:if>
                <td>Lv.${user.userLv}</td>
                <c:if test="${user.lv==0}">
                    <td><a href="#" onclick="addManage('${user.id}')" style="color:red;">
                        <button style="width: 100px;background-color: #098ddf;" type="button"
                                class="layui-btn layui-btn-normal">设为管理员
                        </button>
                    </a>
                        <a href="#" onclick="resetPassword('${user.id}')"
                            style="color:red;">
                            <button style="width: 100px;background-color: #098ddf;" type="button"
                                    class="layui-btn layui-btn-normal">重置密码
                            </button>
                        </a>
                    </td>
                </c:if>
                <c:if test="${user.lv==1}">
                    <td><a href="#" onclick="deleteManage('${user.id}')" style="color:red;">
                        <button style="width: 100px;background-color: #098ddf;" type="button"
                                class="layui-btn layui-btn-normal">取消管理员
                        </button>
                    </a>
                        <a href="#" onclick="resetPassword('${user.id}')" style="color:red;">
                            <button style="width: 100px;background-color: #098ddf;" type="button"
                                    class="layui-btn layui-btn-normal">重置密码
                            </button>
                        </a></td>
                </c:if>
                <c:if test="${user.lv>=2}">
                    <td>无</td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
