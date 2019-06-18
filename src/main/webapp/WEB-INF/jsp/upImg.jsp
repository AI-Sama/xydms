<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/imgUp.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
    <script src="${pageContext.request.contextPath}/js/imgUp.js"></script>
    <title>上传壁纸</title>
</head>
<body>
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>
    <form  action="/WallpaperController/upImg" enctype="multipart/form-data" method="post">
        <div class="upImg_Big" >
            <br>
            <div class="sc_biaoti"><strong style="font-size: 30px;color: lightblue">图片上传</strong><br><br>
            <span class="miaos_css">最多一次可上传三张图片,如图片有出处请填写出处,没有请留空</span>
            </div>
            <div style="padding: 20px;border: solid 1px #f2f2f2;width: 90%;text-align: center;height: 60px;margin: auto;margin-top: 20px;">
                <span style="background-color: lightblue;width: 70px;height: 50px;line-height: 50px;float: left" class="layui-badge">图片出处 :</span>
              <input name="img_text" style="margin-left: 5px;float: left;width:60%;height: 50px" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入图片出处" class="layui-input">
               <input class="input_img"   type="file" name="up_file" accept="image/*"/>
            </div>
            <div style="padding: 20px;border: solid 1px #f2f2f2;width: 90%;text-align: center;height: 60px;margin: auto;margin-top: 20px;">
                <span style=" background-color: lightblue;width: 70px;height: 50px;line-height: 50px;float: left" class="layui-badge">图片出处 :</span>
                <input name="img_text" style="margin-left: 5px;float: left;width:60%;height: 50px" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入图片出处" class="layui-input">
                <input class="input_img"   type="file" name="up_file" accept="image/*"/>
            </div>
            <div style="padding: 20px;border: solid 1px #f2f2f2;width: 90%;text-align: center;height: 60px;margin: auto;margin-top: 20px;">
                <span style="background-color: lightblue;width: 70px;height: 50px;line-height: 50px;float: left" class="layui-badge">图片出处 :</span>
                <input name="img_text" style="margin-left: 5px;float: left;width:60%;height: 50px" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入图片出处" class="layui-input">
                <input class="input_img"   type="file" name="up_file" accept="image/*"/>
            </div>
            <div style="text-align: center;margin-top: 20px">
            <input type="submit" style="background-color: lightblue;width: 100px;height: 40px;margin-top: 20px;margin: auto" class="layui-btn layui-btn-normal" value="提交">
            </div>
        </div>
    </form>
</body>
</html>
