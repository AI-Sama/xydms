<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style>
       ul li{
           list-style: none;
            margin-top: 20px;
        }
    </style>
    <title>个人信息</title>
</head>
<script >
    function changePassword(id) {
          var oldPassword=prompt("请输入原密码:");
          if(oldPassword==null){
              return false;
          }
          var newPassword=prompt("请输入新密码:");
         if(newPassword==null){
            return false;
         }
          var rePassword=prompt("确认新密码:");
          if(newPassword!=rePassword){
              alert("新密码和确认密码不一致");
              return false;
          }
          var data={
              userId:id,
              oldPassword:oldPassword,
              newPassword:newPassword
          }
          $.ajax({
              type:"POST",
              data:data,
              url:"/UserController/changePassword",
              success:function (result) {
                  alert(result);
              }
          })
    }
</script>
<body>
<jsp:include page="Ym_title.jsp"></jsp:include>

<div style="text-align: center;width: 95%;height:1000px;margin: auto;color: white;margin-top: 20px;background-color: white">
    <h1 style="margin-top: 20px;color: black" >个人信息</h1>
  <ul style="color: black;padding-top: 50px;font-size: 30px">
    <li>
        昵称:&nbsp;<span>${sessionScope.user.userName}</span>
    </li>
      <li>
          等级:&nbsp;<span>${sessionScope.user.userLv}</span>
      </li>
      <li>
          权限:&nbsp;<span>
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
      </li>
      <li>
          签到天数:&nbsp;<span>${sessionScope.user.countDay}&nbsp;</span>天
      </li>
      <li>
          邮箱:&nbsp;<span>${sessionScope.user.email}</span>
      </li>
      <li>
          密码:&nbsp;<span onclick="changePassword('${user.id}')" style="color: lightblue">修改密码</span>
      </li>
      <li>
          学工网账号:&nbsp;<span style="color: lightblue" title="(绑定学工网账号后可以不输入账号密码直接查询素拓分)">绑定</span>
      </li>
      <li>
          教务管理系统账号:&nbsp;<span style="color: lightblue" title="(绑定教务管理系统账号后可以不输入账号密码直接查询课表和成绩)">绑定</span>
      </li>
  </ul>
</div>
</body>
</html>
