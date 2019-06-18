<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>社团资源详情</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/srcMess_mobile.css"
    />
    <script>
        function fabuPl(itemid) {
            var ptext = $("#plun").val();
            if(ptext.trim().length<=0){
                alert("评论不能为空");
                return false;
            }
            var plun = {
                pXm: 1,
                pWzId: itemid,
                pText: ptext
            }
            $.ajax({
                type: "POST",  //访问的方法
                contentType:"application/json",
                url: "/Items/insertPL", //访问的action路径
                dataType: "json", //返回值
                data: JSON.stringify(plun),  //传输的数据
                success:function (result) {
                    alert(result.message);
                    location.reload();
                }
            })
        }
        function deletePL(id){
            var boolean=confirm("您确定要删除这条评论吗?");
            if(!boolean){
                return false;
            }
            $.ajax({
                type:"post",
                url:"/Items/deletePL",
                contentType:"application/json",
                data:JSON.stringify(id),
                dataType: "json",
                success:function (result) {
                    alert(result.message)
                    location.reload();
                }

            })
        }

        function deleteZY(srcId) {
            var data={
                id:srcId
            }
            var boo=confirm("您确定要删除这条资源吗?");
            if(boo){
                $.ajax({
                    type:"post",
                    url:"/ResourceController/deleteSrc",
                    data:data,
                    success:function (result) {
                        alert(result)
                        window.location.replace("/ResourceController/loadSrc");
                    }
                })
            }
        }
    </script>
</head>
<body bgcolor="#e4e7ee" >
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>
<div class="bigSrc_Big">
    <div class="bigSrc_title"><b>${bigSrcMess.srcTitle}</b>
        <table style="font-size: 8px;margin: auto; color: #5e5e5e;opacity: 0.6 ">
            <tr>
                <th><img style="height: 18px;width: 18px;" src="/Img_icon/lookIcon.png"></th>
                <td>&nbsp;</td>
                <td> ${bigSrcMess.lookNum}</td>
                <td>&nbsp;&nbsp;</td>
                <th><img style="height: 18px;width: 18px" src="/Img_icon/renIcon.png"></th>
                <td>&nbsp;</td>
                <td>${bigSrcMess.upUser}</td>
            </tr>
        </table>
    </div>
    <hr style="background-color: lightblue;height: 2px">
    <div class="bigSrc_text ">
                ${bigSrcMess.srcText}
    </div>
    <br>
    <c:if test="${not empty bigSrcMess.srcImg01}">
        <div class="img_kuang"><img class="src_img" src="/srcImg/${bigSrcMess.srcImg01}"></div>
    </c:if>
    <br>
    <c:if test="${not empty bigSrcMess.srcImg02}">
        <div class="img_kuang"><img class="src_img" src="/srcImg/${bigSrcMess.srcImg02}"></div>
    </c:if>
    <br>
    <c:if test="${not empty bigSrcMess.srcImg03}">
        <div class="img_kuang"><img class="src_img" src="/srcImg/${bigSrcMess.srcImg03}"></div>
    </c:if>
    <div style="text-align: center">
        <button style="width: 100px;background-color: lightblue;" type="button" onclick="window.history.go(-1)" class="layui-btn layui-btn-normal">返回</button>
        <a href="${bigSrcMess.srcDownload}"><button style="width: 100px;background-color: lightblue;" type="button"  class="layui-btn layui-btn-normal">下载</button></a>
        <c:if test="${sessionScope.user.lv>=1}">
            <button style="width: 100px;background-color: lightblue;" type="button" onclick="deleteZY('${bigSrcMess.id}')" class="layui-btn layui-btn-normal">删除</button>
        </c:if>
    </div>
</div>
<%--<div style="width: 95%;height: 200px;margin: auto">--%>
    <%--<textarea id="plun" style="resize: none;border-radius: 5px;font-size: 20px;width: 100%;height: 200px"--%>
              <%--placeholder="说点什么吧......"></textarea>--%>
    <%--<a href="javascript:void(0)">--%>
        <%--<div onclick="fabuPl('${bigSrcMess.id}')"--%>
             <%--style="border-radius: 0 0 8px 8px;float: right;line-height: 30px;color: white;width: 100px;height: 30px;text-align: center;background-color: lightblue">--%>
            <%--发表评论--%>
        <%--</div>--%>
    <%--</a>--%>
<%--</div>--%>
<%--<br><br><br>--%>
<%--<c:forEach items="${pluns}" var="plun" varStatus="num">--%>
    <%--<div style="width: 95%;margin: auto;">--%>
        <%--<div style="overflow: hidden;border-bottom: 1px #428bca dashed;margin: auto;width: 100%;background-color: white">--%>
            <%--<div style="margin:10px 10px;float: left;overflow: hidden;width: 80px;height: 80px;border-radius: 50%">--%>
                <%--<img width="100%" height="100%" src="/Img_icon/bgSakura.jpg">--%>
            <%--</div>--%>
            <%--<div style="float: right">#${num.index+1}</div>--%>
            <%--<c:if test="${sessionScope.user.lv>4}">--%>
                <%--<a href="javascript:deletePL('${plun.id}')"><div style="float: right;color: blue;margin-right: 5px">删除</div></a>--%>
            <%--</c:if>--%>
            <%--<div style="color: red;margin-left: 20px;font-size: 25px;float: left;width:80%;height: 40px;">--%>
                <%--<div>${plun.pUserName}</div>--%>
            <%--</div>--%>
            <%--<div style="overflow: auto;margin-top: 10px;font-family: 楷体;font-size: 18px;float: left;width: 80%;margin-left: 20px">--%>
                    <%--${plun.pText}--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</c:forEach>--%>
</body>
</html>
