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
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
