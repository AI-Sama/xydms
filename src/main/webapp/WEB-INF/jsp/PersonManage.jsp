<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>人员管理</title>
</head>
<script >
   function  addManage(id) {
       var flag=confirm("您确定要将其设置为管理员吗?")
       if(!flag){
           return false;
       }
       var var1={
           userId:id
       };
       $.ajax({
           type:"POST",
           url:"/UserController/addManage",
           data:var1,
           success:function (result) {
                alert(result);
                window.location.reload();
           }
       })
   }
   function  deleteManage(id) {
       var flag=confirm("您确定要取消其管理员吗?")
       if(!flag){
           return false;
       }
       var var1={
           userId:id
       };
       $.ajax({
           type:"POST",
           url:"/UserController/deleteManage",
           data:var1,
           success:function (result) {
               alert(result);
               window.location.reload();
           }
       })
   }
   function  resetPassword(id) {
       var flag=confirm("您确定要重置其密码吗?");
       if(!flag){
           return false;
       }
       var var1={
           userId:id
       };
       $.ajax({
           type:"POST",
           url:"/UserController/resetPassword",
           data:var1,
           success:function (result) {
               alert(result);
               window.location.reload();
           }
       })
   }
</script>
<style>
    td{
        border: 2px solid white;
        background-color: lightblue;
        height: 40px;
        color: white;
    }
</style>
<body>
<jsp:include page="Ym_title.jsp"></jsp:include>
   <table style="margin: auto;margin-top: 20px;text-align: center;width: 95%;">
       <tr >
           <td>ID</td>
            <td>用户名</td>
            <td>邮箱</td>
            <td>权限</td>
           <td>等级</td>
            <td>操作</td>
       </tr>
  <c:forEach items="${sessionScope.users}" var="user">
      <tr>
      <td>${user.id}</td>2
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
              <td><a href="#" onclick="addManage('${user.id}')" style="color:red;">设为管理员</a>&nbsp;|&nbsp;<a href="#" onclick="resetPassword('${user.id}')" style="color:red;">重置密码</a></td>
          </c:if>
          <c:if test="${user.lv==1}">
              <td><a href="#" onclick="deleteManage('${user.id}')" style="color:red;">取消管理员</a>&nbsp;|&nbsp;<a href="#" onclick="resetPassword('${user.id}')" style="color:red;">重置密码</a></td>
          </c:if>
          <c:if test="${user.lv>=2}">
              <td>无</td>
          </c:if>
      </tr>
  </c:forEach>
   </table>
</body>
</html>
