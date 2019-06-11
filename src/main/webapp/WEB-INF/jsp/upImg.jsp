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
            <div class="sc_biaoti"><strong style="color: brown">图片上传</strong><br>
            <span class="miaos_css">最多可选择三张图片,如图片有出处请填写出处,没有请留空</span>
            </div>
            <div class="upImg_small">
                <div class="miaoSu">
                    图片描述&nbsp;:&#12288<input  class="img_text" name="img_text" type="text" maxlength="25" placeholder="请输入图片的简介(出处,画师ID等)">
                </div>
                <div class="miaoSu">
                    <input class="input_img"   type="file" name="up_file" accept="image/*"/>
                </div>
            </div>
            <div class="upImg_small">
                <div class="miaoSu">
                    图片描述&nbsp;:&#12288<input  class="img_text" name="img_text" type="text" maxlength="25" placeholder="请输入图片的简介(出处,画师ID等)">
                </div>
                <div class="miaoSu">
                    <input class="input_img"   type="file" name="up_file" accept="image/*"/>
                </div>
            </div>
            <div class="upImg_small">
                <div class="miaoSu">
                    图片描述&nbsp;:&#12288<input  class="img_text" name="img_text" type="text" maxlength="25" placeholder="请输入图片的简介(出处,画师ID等)">
                </div>
                <div class="miaoSu">
                    <input class="input_img"   type="file" name="up_file" accept="image/*"/>
                </div>

            </div>
        </div>
        <input type="submit" class="up_button" value="提交">
    </form>
</body>
</html>
