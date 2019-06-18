<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>壁纸审核</title>
</head>

<script>
    function judgeImg(id, state, num) {
        var data = {
            imgId: id,
            imgState: state
        }
        $.ajax({
            type: "POST",
            data: data,
            url: "/WallpaperController/JudgeImg",
            success: function (result) {
                alert(result);
                if (result == "操作成功") {
                    $("#img" + num).remove();
                }
            }
        })
    }

    function judgeAll() {
        $.ajax({
            type: "POST",
            data: null,
            url: "/WallpaperController/JudgeAll",
            success: function (result) {
                alert(result);
                if (result == "操作成功") {
                    $("#all").remove();
                }
            }
        })
    }
</script>
<style>
    .judge:hover {
        transform: scale(1.2);
    }

    .imgHover:hover {
        transform: scale(1.1);
    }
</style>
<body bgcolor="#f0f8ff">
<jsp:include page="Ym_title.jsp"></jsp:include>
   <c:if test="${not empty imgs}">
    <a href="javascript:void(0)">
        <div class="judge" onclick="judgeAll()" style="text-align: center;color:white;border-radius: 5px;
            font-size:22px;width: 150px;line-height: 50px;height: 50px;background-color:lightblue;margin: auto;margin-top: 20px">
            全部通过
        </div>
    </a>
   </c:if>
<c:if test="${empty imgs}">
        <div  style="text-align: center;color:white;border-radius: 5px;
            font-size:22px;width: 300px;line-height: 50px;height: 50px;background-color:lightblue;margin: auto;margin-top: 20px">
            暂无待审核的图片
        </div>
</c:if>
<div id="all" style="width: 95%;margin:auto;">
    <c:forEach items="${imgs}" var="img" varStatus="num">
        <div id="img${num.index}" style="margin-top: 20px;margin-left:2%;width: 31%;float: left;height: 450px;">
            <a href="/WallpaperController/jumpImgDetails?id=${img.id}">
                <div class="imgHover" style="background-image: url('/smallImg/${img.imgAddr}');
                        background-size:cover;background-position:center;
                        overflow:hidden;margin-top:30px;
                        border-radius: 8px 8px 0 0;
                        width: 100%;height: 410px;">
                </div>
            </a>
            <div style="width: 100%;height: 40px;margin-bottom: 20px;">
                <a href="javascript:void(0)">
                    <div onclick="judgeImg('${img.id}',1,'${num.index}')" class="judge"
                         style="color: white;line-height: 40px;font-size: 20px;float: left;text-align: center;width: 50%;height:100%;background-color: lightblue">
                        通过
                    </div>
                    <div onclick="judgeImg('${img.id}',2,'${num.index}')" class="judge"
                         style="color: white;line-height: 40px;font-size: 20px;float: left;text-align: center;width: 50%;height:100%;background-color: lightpink">
                        未通过
                    </div>
                </a>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>