<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>资源审核</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/srcMess_mobile.css"/>
    <script>
        function judgeSrc(id, state, num) {
            var data = {
                srcId: id,
                srcState: state
            }
            $.ajax({
                type: "POST",
                data: data,
                url: "/ResourceController/setSrcState",
                success: function (result) {
                    alert(result);
                    if (result == "操作成功") {
                        $("#src" + num).remove();
                    }
                }
            })
        }
        function judgeAll() {
            $.ajax({
                type: "POST",
                data: null,
                url: "/ResourceController/setAllSrcState",
                success: function (result) {
                    alert(result);
                    if (result == "操作成功") {
                        $("#all").remove();
                    }
                }
            })
        }
    </script>
    <style >
        .judge:hover {
            transform: scale(1.2);
        }
    </style>
</head>
<body bgcolor="#e4e7ee" >
<!-- 登录表头-->
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>

<c:if test="${not empty srcs}">
    <a href="javascript:void(0)">
        <div class="judge" onclick="judgeAll()" style="text-align: center;color:white;border-radius: 5px;
            font-size:22px;width: 150px;line-height: 50px;height: 50px;background-color:lightblue;margin: auto;margin-top: 20px">
            全部通过
        </div>
    </a>
</c:if>
<c:if test="${empty srcs}">
    <div  style="text-align: center;color:white;border-radius: 5px;
            font-size:22px;width: 300px;line-height: 50px;height: 50px;background-color:lightblue;margin: auto;margin-top: 20px">
        暂无待审核的资源
    </div>
</c:if>
<div id="all" class="srcBig">
    <c:forEach items="${srcs}" var="message" varStatus="num">
            <div id="src${num.index}" class="srcSmall">
                <a  href="/ResourceController/jumpResDetails?messId=${message.id}">
                <div style="width: 90%;height: 70%;margin:auto;margin-top:10px;overflow: hidden;">
                <img style="width: 100%;" src="/srcImg/${message.srcImg01}">
                </div>
                <div class="srcTitle">
                        ${message.srcTitle}
                </div>
                </a>
                <div style="width: 100%;height: 40px;margin-bottom: 20px;">
                    <a href="javascript:void(0)">
                        <div onclick="judgeSrc('${message.id}',1,'${num.index}')" class="judge"
                             style="color: white;line-height: 40px;font-size: 20px;float: left;text-align: center;width: 50%;height:100%;background-color: lightblue">
                            通过
                        </div>
                        <div onclick="judgeSrc('${message.id}',2,'${num.index}')" class="judge"
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
