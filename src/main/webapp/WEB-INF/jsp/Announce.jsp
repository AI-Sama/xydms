<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>发布公告</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <link href="${pageContext.request.contextPath}/dist/summernote-lite.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/dist/summernote-lite.js"></script>
    <script src="/layui-v2.5.4/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui-v2.5.4/layui/css/layui.css">
    <script  src="/dist/lang/summernote-zh-CN.js"></script>
    <script>
            function subGongao() {
                var biaoti=$("#typebti").val();
                var neirong=$("#summernote").summernote("code");
                console.log(neirong);
                var data={
                    annTitle:biaoti,
                    annText:neirong
                }
                $.ajax({
                    data:data,
                    type:"post",
                    url:"/AnnounceController/insertAnn",
                    dataType:'text',
                    success:function(text) {
                        alert(text)
                        window.location.replace("/IndexController/jumpIndex");
                    }
                })
            }
    </script>
</head>
<body background="/Img_icon/GaTeng.jpg" style="background-attachment: fixed;background-size:cover;background-repeat: no-repeat">
<!-- 登录表头-->
<%--<div>--%>
    <%--<jsp:include page="Ym_title.jsp"></jsp:include>--%>
<%--</div>--%>
<div style="z-index: 1000;position: absolute;top: 2%;width: 850px;left: 50%;transform: translateX(-50%)">
    <input id="typebti" type="text" style="margin-bottom:10px;width: 847px;height: 40px" placeholder="&#12288请输入标题">
    <div id="summernote" ></div>

    <div style="text-align: center">
    <button  type="button" style="background-color: lightpink;height: 40px;width: 100px" onclick="subGongao()" class="layui-btn layui-btn-normal">提交</button>
    </div>
   <%--<a style="text-decoration: none" href="javascript:subGongao()">--%>
       <%--<div  style="text-align: center;line-height: 30px;font-size: 18px;color: white;margin: auto;margin-top: 10px;margin-bottom: 10px;width: 200px;height: 30px;background: lightpink">--%>
            <%--提交--%>
    <%--</div>--%>
   <%--</a>--%>
</div>
<script>
    $('#summernote').summernote({
        placeholder: '输入公告内容(默认插入的第一张图片为主图).....',
        tabsize: 2,
        height: 850,
        focus:false,
        lang:'zh-CN',
        toolbar:[
            ['style',['style','bold','italic','underline','clear','']],
            ['font', ['strikethrough']],
            ['fontsize', ['fontsize']],
            ['table', ['table']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['insert',['picture']]
        ],
        callbacks:{
            onImageUpload: function (files,editor,$editable) {
                sendFile(files[0],editor,$editable );
            }
        }
    });
    function sendFile(files,editor,$editable) {
        var text = $("#summernote").summernote("code");//获取里面的html文本内容
        var filename=false;
        try{
            filename=file['name'];
        }catch (e) {
            filename=false;
        }
        if(!filename){
            $(".note-alarm").remove();
        }
        //以上代码防止图片在编辑框里的拖拽引发二次上传导致的错误提示

        data=new FormData();
        data.append("file",files);
        data.append("key",filename);
        $.ajax({
            data:data,
            type:"post",
            url:"/AnnounceController/upAnnImg",
            dataType:'json',
            contentType:false,
            processData:false,
            success:function (url) {
                var path=url.path;
                console.log(path);
                $("#summernote").summernote("insertImage",path);//设置图片回显路径
            },
            error:function () {
                alert("上传失败");
            }
        })
    }
</script>
</body>
</html>
