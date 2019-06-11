<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>课表</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
    <script >
        $(document).ready(function (){
            $("#loadIng").css("display","none");
            for(let x=1;x<=5;x++){
                $("#weekday"+x).bind("click",function () {
                    var index=this.id;
                    var num=index.substring(index.length-1,index.length);
                    $(".backcolor").css("background-color","lightpink");
                    $(".backcolor").css("color","white");
                    $(".showKebiao").css("display","none");
                    $(this).css("background-color","white");
                    $(this).css("color","lightpink");
                    $("#class"+x).css("display","block");
                });
            }
        });
    </script>
</head>

<body >

<!-- 登录表头-->
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>
<c:if test="${empty sessionScope.KeBiao}">
        <script>
        alert("该班级不存在,请检查后重新查询");
        window.location.replace("http://localhost:8080/Items/title_Click?titName=%E5%B7%A5%E5%85%B7");
    </script>
</c:if>
<div style="width: 95%;margin: auto;margin-top: 30px;">
    <div style="width: 98%;margin: auto;margin-top: 10px;height: 1100px;">
        <div style="color: white;text-align: center;line-height: 100px;font-size: 50px;width: 100%;background-color: lightpink;height: 100px">
            <div class="backcolor" id="weekday1" style="background-color: white;float: left;width: 19.8%;color: lightpink">周一</div>
            <div class="backcolor" id="weekday2" style="float: left;width: 19.8%;color: white">周二</div>
            <div class="backcolor" id="weekday3" style="float: left;width: 19.8%;color: white">周三</div>
            <div class="backcolor" id="weekday4" style="float: left;width: 19.8%;color: white">周四</div>
            <div class="backcolor" id="weekday5" style="float: left;width: 19.8%;color: white">周五</div>
        </div>
        <div id="class1" class="showKebiao" >
        <c:forEach items="${sessionScope.KeBiao.One}" var="Text" varStatus="num">
            <div style="color: white;border-radius: 8px;margin-top: 20px;margin-left: 1.5%;float: left;width: 48%;height: 310px;background-color: white">
                <div style="text-align: center;font-size: 30px;width: 100%;height: 40px;background-color: lightpink">
                第${num.index+1}节
                </div>
                <div style="color: black;line-height: 50px;height: 80%;font-size: 30px;text-align: center;overflow: auto">
                        ${Text}
                </div>
            </div>
        </c:forEach>
        </div>
        <div id="class2"  class="showKebiao" style="display: none">
            <c:forEach items="${sessionScope.KeBiao.Two}" var="Text" varStatus="num">
                <div style="color: white;border-radius: 8px;margin-top: 20px;margin-left: 1.5%;float: left;width: 48%;height: 310px;background-color: white">
                    <div style="text-align: center;font-size: 30px;width: 100%;height: 40px;background-color: lightpink">
                        第${num.index+1}节
                    </div>
                    <div style="color: black;line-height: 50px;height: 80%;font-size: 30px;text-align: center;overflow: auto">
                            ${Text}
                    </div>
                </div>
            </c:forEach>
        </div>
        <div id="class3"  class="showKebiao" style="display: none">
            <c:forEach items="${sessionScope.KeBiao.Three}" var="Text" varStatus="num">
                <div style="color: white;border-radius: 8px;margin-top: 20px;margin-left: 1.5%;float: left;width: 48%;height: 310px;background-color: white">
                    <div style="text-align: center;font-size: 30px;width: 100%;height: 40px;background-color: lightpink">
                        第${num.index+1}节
                    </div>
                    <div style="color: black;line-height: 50px;height: 80%;font-size: 30px;text-align: center;overflow: auto">
                            ${Text}
                    </div>
                </div>
            </c:forEach>
        </div>
        <div id="class4"  class="showKebiao" style="display: none">
            <c:forEach items="${sessionScope.KeBiao.Four}" var="Text" varStatus="num">
                <div style="color: white;border-radius: 8px;margin-top: 20px;margin-left: 1.5%;float: left;width: 48%;height: 310px;background-color: white">
                    <div style="text-align: center;font-size: 30px;width: 100%;height: 40px;background-color: lightpink">
                        第${num.index+1}节
                    </div>
                    <div style="color: black;line-height: 50px;height: 80%;font-size: 30px;text-align: center;overflow: auto">
                            ${Text}
                    </div>
                </div>
            </c:forEach>
        </div>
        <div id="class5"  class="showKebiao" style="display: none">
            <c:forEach items="${sessionScope.KeBiao.Five}" var="Text" varStatus="num">
                <div style="color: white;border-radius: 8px;margin-top: 20px;margin-left: 1.5%;float: left;width: 48%;height: 310px;background-color: white">
                    <div style="text-align: center;font-size: 30px;width: 100%;height: 40px;background-color: lightpink">
                        第${num.index+1}节
                    </div>
                    <div style="color: black;line-height: 50px;height: 80%;font-size: 30px;text-align: center;overflow: auto">
                            ${Text}
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>
</div>
</div>
</body>
</html>
