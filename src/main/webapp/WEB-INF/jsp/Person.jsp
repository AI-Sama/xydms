<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>个人信息</title>
</head>
<script>
    function showBindAccount() {
        $("#bindAccount").css("display","block");
        $("#hidenPage").css("display","block");
    }
    function hideBindAccount() {
        $("#bindAccount").css("display","none");
        $("#hidenPage").css("display","none");
    }
    function bindAccount(userName) {
        var eduName=$("#eduName").val();
        var eduPass=$("#eduPassword").val();
        var data={
            userName:userName,
            eduName:eduName,
            eduPassword:eduPass
        }
        $.ajax({
            type:"POST",
            data:data,
            url:"/UserController/addEduAccount",
            success:function (result) {
                alert(result)
                if(result=="绑定成功,请重新登录账号"){
                    window.location.reload();
                }
            }
        })
    }
    function deleteAccount(userName) {
        if(!confirm("您确定要取消绑定吗?")){
         return false;
        }
        var data={
            userName:userName,
        }
        $.ajax({
            type:"POST",
            data:data,
            url:"/UserController/deleteEduAccount",
            success:function (result) {
                alert(result)
                if(result=="取消绑定成功,请重新登录账号"){
                    window.location.reload();
                }
            }
        })
    }
    function changePassword(id) {
        var oldPassword = prompt("请输入原密码:");
        if (oldPassword == null) {
            return false;
        }
        var newPassword = prompt("请输入新密码:");
        if (newPassword == null) {
            return false;
        }
        var rePassword = prompt("确认新密码:");
        if (newPassword != rePassword) {
            alert("新密码和确认密码不一致");
            return false;
        }
        var data = {
            userId: id,
            oldPassword: oldPassword,
            newPassword: newPassword
        }
        $.ajax({
            type: "POST",
            data: data,
            url: "/UserController/changePassword",
            success: function (result) {
                alert(result);
            }
        })
    }
</script>
<body>
<jsp:include page="Ym_title.jsp"></jsp:include>
<div id="bindAccount"
     style="z-index: 100;color: gray;display: none;border-radius: 3px;position: fixed;width: 500px;height: 205px;left: 50%;transform: translateX(-50%);top:40%;background-color: white;">
    <input id="eduName" style="margin: 20px;width: 460px;height: 50px;font-size: 30px" type="text" name="name"
           lay-verify="pass" placeholder="&#12288请输入您的教务管理系统账号" autocomplete="off" class="layui-input">
    <input id="eduPassword" style="margin: 20px;width: 460px;height: 50px;font-size: 30px" type="password" name="password"
           lay-verify="pass" placeholder="&#12288请输入您的教务管理系统密码" autocomplete="off" class="layui-input">
    <div style="width: 500px;height:60px;margin: auto;margin-top: 10px"><input onclick="bindAccount('${sessionScope.user.userName}')" type="button" style=" font-size: 25px;
    color: white;width: 500px;border: none;border-radius: 0 0 3px 3px;
    height: 50px;background-color: lightblue" value="绑定">
    </div>
</div>
<div id="hidenPage" onclick="hideBindAccount()"
     style="display: none;position: fixed;width: 100%;height: 100%;z-index: 99;left: 0;top: 0;background-color: #5e5e5e;opacity: 0.2"></div>
<div style="width: 90%;margin: auto;margin-top: 20px;padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div style="width: 100%;" class="layui-col-md6">
            <div class="layui-card">
                <div style="font-size: 25px" class="layui-card-header">个人信息</div>
                <div style="height:800px" class="layui-card-body">
                    <div style="width:95%;height: 40px;border: 1px lightblue solid;margin: auto;margin-top: 20px ">
                        <span style="font-size: 25px;background-color: lightblue;width: 100px;height: 40px;line-height: 40px;float: left"
                              class="layui-badge">昵称 :</span>
                        <span style="line-height: 40px;font-size: 25px;">&nbsp; ${sessionScope.user.userName}</span>
                    </div>
                    <div style="width:95%;height: 40px;border: 1px lightblue solid;margin: auto;margin-top: 20px">
                            <span style="font-size: 25px;background-color: lightblue;width: 100px;height: 40px;line-height: 40px;float: left"
                                  class="layui-badge">等级 :</span>
                        <span style="line-height: 40px;font-size: 25px;">&nbsp; ${sessionScope.user.userLv}</span>
                    </div>
                    <div style="width:95%;height: 40px;border: 1px lightblue solid;margin: auto;margin-top: 20px ">
                        <span style="font-size: 25px;background-color: lightblue;width: 100px;height: 40px;line-height: 40px;float: left"
                              class="layui-badge">权限 :</span>
                        <span style="line-height: 40px;font-size: 25px;">&nbsp;
                            <c:if test="${sessionScope.user.lv==0}">
                                普通用户
                            </c:if>
                            <c:if test="${sessionScope.user.lv==1}">
                                管理员
                            </c:if>
                            <c:if test="${sessionScope.user.lv>1}">
                                超级管理员
                            </c:if>
                            </span>
                    </div>
                    <div style="width:95%;height: 40px;border: 1px lightblue solid;margin: auto;margin-top: 20px ">
                        <span style="font-size: 25px;background-color: lightblue;width: 100px;height: 40px;line-height: 40px;float: left"
                              class="layui-badge">签到: :</span>
                        <span style="line-height: 40px;font-size: 25px;">&nbsp; ${sessionScope.user.countDay}天</span><br>
                    </div>
                    <div style="width:95%;height: 40px;border: 1px lightblue solid;margin: auto;margin-top: 20px ">
                        <span style="font-size: 25px;background-color: lightblue;width: 100px;height: 40px;line-height: 40px;float: left"
                              class="layui-badge">邮箱 :</span>
                        <span style="line-height: 40px;font-size: 25px;">&nbsp; ${sessionScope.user.email}</span><br>
                    </div>
                    <div style="width:95%;height: 40px;border: 1px lightblue solid;margin: auto;margin-top: 20px ">
                        <span style="font-size: 25px;background-color: lightblue;width: 100px;height: 40px;line-height: 40px;float: left"
                              class="layui-badge">密码 :</span>&nbsp;&nbsp;
                            <button style="line-height: 30px;height: 30px;margin-top: 5px;width: 100px;background-color: lightblue;" type="button" onclick="changePassword('${user.id}')" class="layui-btn layui-btn-normal">修改密码</button>
                    </div>
                    <div style="width:95%;height: 40px;border: 1px lightblue solid;margin: auto;margin-top: 20px ">
                        <span style="font-size: 25px;background-color: lightblue;width: 100px;height: 40px;line-height: 40px;float: left"
                              class="layui-badge">账号 :</span>&nbsp;&nbsp;
                        <c:if test="${sessionScope.user.eduAccount==true}">
                            <button style="line-height: 30px;height: 30px;width: 190px;background-color: lightblue;" type="button" onclick="deleteAccount('${sessionScope.user.userName}')"  class="layui-btn layui-btn-normal">取消绑定教务管理账号</button>
                        </c:if>
                        <c:if test="${sessionScope.user.eduAccount==false}">
                        <button style="line-height: 30px;height: 30px;width: 150px;background-color: lightblue;" type="button" onclick="showBindAccount()"  class="layui-btn layui-btn-normal">绑定教务管理账号</button>
                        </c:if>
                        <span style="line-height: 40px;opacity: 0.5"> &nbsp;(绑定成功后可不用输入账号密码,直接查询课表和成绩)</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
