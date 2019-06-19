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
<
<script>
   function addSuggest(userName) {
       var sgText=$("#suggestText").val();
       var data={
           userName:userName,
           suggestText:sgText
       }
       $.ajax({
           type:"POST",
           data:data,
           url:"/SuggestController/addSuggest",
           success:function (result) {
                alert(result);
               $("#suggestText").val("");
           }
       })
   }
</script>
<body>
<!-- 登录表头-->
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>
<form  class="layui-form layui-form-pane" style="width: 94%;margin: auto;margin-top: 20px">
<div class="layui-form-item layui-form-text">
    <label class="layui-form-label">意见反馈</label>
    <div class="layui-input-block">
        <textarea  id="suggestText" style="height: 180px" placeholder="请输入您的建议以及其他问题" class="layui-textarea"></textarea>
    </div>
</div>
    <button style="float: right;width: 100px;background-color: lightblue;" onclick="addSuggest('${sessionScope.user.userName}')" type="button"  class="layui-btn layui-btn-normal">提交</button>
</form>
</body>
</html>
