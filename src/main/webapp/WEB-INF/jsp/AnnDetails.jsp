<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>公告详情</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/srcMess_mobile.css"/>
    <script>
        function setTop(id,top) {
            var topNum;
            if(top=='true'){
                topNum=0;
            }else{
                topNum=1;
            }
            var data={
                id:id,
                top:topNum
            }
            $.ajax({
                type:"POST",
                url:"/AnnounceController/changeAnnTop",
                data:data,
                success:function (result) {
                    alert(result);
                    window.location.reload();
                }
            })
        }
        function fabuPl(itemid) {
            var ptext = $("#plun").val();
            if(ptext.trim().length<=0){
                alert("评论不能为空");
                return false;
            }
            var plun = {
                pXm: 0,
                pWzId: itemid,
                pText: ptext
            }
            $.ajax({
                type: "POST",  //访问的方法
                contentType:"application/json",
                url: "/Items/insertPL", //访问的action路径
                dataType: "json", //返回值
                data: JSON.stringify(plun),//传输的数据
                success:function (result) {
                    alert(result.message);
                    location.reload();
                }
            })
        }
        function deleteGongao(id) {
            var data = {
                id:id
            };
            var boo = confirm("您确定要删除这条公告吗?");

            if (boo) {
                $.ajax({
                    type: "POST",  //访问的方法
                    url: "/AnnounceController/deleteAnn", //访问的action路径
                    data: data,//传输的数据
                    success:function (result) {
                        alert(result);
                        window.location.replace("/IndexController/jumpIndex");
                    }
                })
            }
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
    </script>
</head>
<body bgcolor="#e4e7ee">
<!-- 登录表头-->
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>
<div class="bigSrc_Big">
    <div class="bigSrc_title"><b>${announce.annName}</b>
        <table style="font-size: 8px;margin: auto; color: #5e5e5e;opacity: 0.6 ">
            <tr>
                <th><img style="height: 18px;width: 18px;" src="/Img_icon/lookIcon.png"></th>
                <td>&nbsp;</td>
                <td> ${announce.lookNum}</td>
                <td>&nbsp;&nbsp;</td>
                <th><img style="height: 18px;width: 18px" src="/Img_icon/renIcon.png"></th>
                <td>&nbsp;</td>
                <td>${announce.upUser}</td>
            </tr>
        </table>
    </div>
    <div style="width: 100%;height: 2px;background-color: lightblue"></div>
    <div class="bigSrc_text">
        ${announce.annText}
    </div>
    <div style="text-align: center">
        <c:if test="${sessionScope.user.lv>=1}">
                <c:if test="${announce.top==true}">
                    <button style="width: 100px;background-color: lightblue;" type="button" onclick="setTop('${announce.id}','${announce.top}')" class="layui-btn layui-btn-normal">取消置顶</button>
                </c:if>
                <c:if test="${announce.top==false}">
                    <button style="width: 100px;background-color: lightblue;" type="button" onclick="setTop('${announce.id}','${announce.top}')" class="layui-btn layui-btn-normal">设为置顶</button>
                </c:if>
        </c:if>
    <button type="button" style="width: 100px;background-color: lightblue;" onclick="window.history.go(-1)" class="layui-btn layui-btn-normal">返回</button>
    <c:if test="${sessionScope.user.lv>=1}">
        <button style="width: 100px;background-color: lightblue;" type="button" onclick="deleteGongao('${announce.id}')" class="layui-btn layui-btn-normal">删除</button>
    </c:if>
    </div>
</div>
<%--<div style="width: 95%;height: 200px;margin: auto">--%>
    <%--<textarea id="plun" style="resize: none;border-radius: 5px;font-size: 20px;width: 100%;height: 200px"--%>
              <%--placeholder="说点什么吧......"></textarea>--%>
   <%--<a href="javascript:void(0)">--%>
    <%--<div onclick="fabuPl('${xiangxiGongao.id}')"--%>
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
<script>
    $("p img").css("max-width", "100%");
</script>
</body>
</html>
