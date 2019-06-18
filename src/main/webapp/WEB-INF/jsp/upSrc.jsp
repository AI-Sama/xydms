<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>发布资源</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/srcMess.css"/>
</head>
<body bgcolor="#e4e7ee" >
<!-- 登录表头-->
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>
<div style="width: 91%;height: auto;margin: auto;background-color: white;margin-top: 20px;padding: 20px">
<form  class="layui-form layui-form-pane" action="/ResourceController/upSrc" method="post" enctype="multipart/form-data">
    <div class="layui-form-item">
        <label class="layui-form-label">资源名称</label>
        <div class="layui-input-block">
            <input type="text" name="srcTitle" autocomplete="off" placeholder="请输入资源标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">资源描述</label>
        <div class="layui-input-block">
            <textarea  name="srcText" style="height: 180px" placeholder="请输入资源描述" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">下载链接</label>
        <div class="layui-input-block">
            <input type="text" name="srcDownload" autocomplete="off" placeholder="请输入完整下载链接(包含http....)" class="layui-input">
        </div>
    </div>
       <div>
           <span style="background-color: lightblue;width: 70px;height: 30px;line-height: 30px;" class="layui-badge">主图 :</span>
           &nbsp;:&#12288;<input type="file" accept="image/*" name="srcFile"><span style="opacity: 0.5">必须选择一张主图,图二图三可以留空</span><br/>
           <span style="margin-top: 15px;background-color: lightblue;width: 70px;height: 30px;line-height: 30px;" class="layui-badge">图二 :</span>
           &nbsp;:&#12288;<input type="file" accept="image/*" name="srcFile"><br/>
           <span style="margin-top: 15px;background-color: lightblue;width: 70px;height: 30px;line-height: 30px;" class="layui-badge">图三 :</span>
           &nbsp;:&#12288;<input type="file" accept="image/*" name="srcFile">
        </div>
    <div style="text-align: center;margin-top: 20px">
        <input type="submit" style="background-color: lightblue;width: 100px;height: 40px;margin-top: 20px;margin: auto" class="layui-btn layui-btn-normal" value="提交">
    </div>
</form>
</div>
</body>
</html>
