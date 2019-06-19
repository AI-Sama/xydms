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
</head>

<body >

<!-- 登录表头-->
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>
<c:if test="${empty sessionScope.kbs}">
    <script>
        alert("账号或密码错误");
        window.location.replace("/ToolsController/jumpTools");
    </script>
</c:if>
<div style="width: 95%;margin: auto;margin-top: 30px;">
    <div style="width: 98%;margin: auto;margin-top: 10px;height: 1100px;">
        <div style="color: white;text-align: center;line-height: 100px;font-size: 50px;background-color: lightblue;height: 100px">
            <div  id="weekday1" style="float: left;width: 19.8%;color: white">周一</div>
            <div  id="weekday2" style="float: left;width: 19.8%;color: white">周二</div>
            <div  id="weekday3" style="float: left;width: 19.8%;color: white">周三</div>
            <div  id="weekday4" style="float: left;width: 19.8%;color: white">周四</div>
            <div  id="weekday5" style="float: left;width: 19.8%;color: white">周五</div>
        </div>
        <div id="class1" class="showKebiao">
        <c:forEach  items="${sessionScope.kbs.class1}" var="c1" varStatus="num">
            <div style=";color: white;border-radius: 8px;margin-top: 20px;margin-left: 1.5%;float: left;width: 18%;height: 150px;background-color: white">
                <div style="text-align: center;font-size: 30px;width: 100%;height: 40px;background-color: lightblue">
                第一节
                </div>
                <div style="color: black;line-height: 50px;height: 80%;font-size: 26px;text-align: center;overflow: auto">
                      ${c1}
                </div>
            </div>
        </c:forEach>
        </div>
        <div id="class2" class="showKebiao">
            <c:forEach  items="${sessionScope.kbs.class2}" var="c1" varStatus="num">
                <div style="color: white;border-radius: 8px;margin-top: 20px;margin-left: 1.5%;float: left;width: 18%;height: 150px;background-color: white">
                    <div style="text-align: center;font-size: 30px;width: 100%;height: 40px;background-color: lightblue">
                        第二节
                    </div>
                    <div style="color: black;line-height: 50px;height: 80%;font-size: 26px;text-align: center;overflow: auto">
                            ${c1}
                    </div>
                </div>
            </c:forEach>
        </div>
        <div id="class3" class="showKebiao">
            <c:forEach  items="${sessionScope.kbs.class3}" var="c1" varStatus="num">
                <div style="color: white;border-radius: 8px;margin-top: 20px;margin-left: 1.5%;float: left;width: 18%;height: 150px;background-color: white">
                    <div style="text-align: center;font-size: 30px;width: 100%;height: 40px;background-color: lightblue">
                        第三节
                    </div>
                    <div style="color: black;line-height: 50px;height: 80%;font-size: 26px;text-align: center;overflow: auto">
                            ${c1}
                    </div>
                </div>
            </c:forEach>
        </div>
        <div id="class4" class="showKebiao">
            <c:forEach  items="${sessionScope.kbs.class4}" var="c1" varStatus="num">
                <div style="color: white;border-radius: 8px;margin-top: 20px;margin-left: 1.5%;float: left;width: 18%;height: 150px;background-color: white">
                    <div style="text-align: center;font-size: 30px;width: 100%;height: 40px;background-color: lightblue">
                        第四节
                    </div>
                    <div style="color: black;line-height: 50px;height: 80%;font-size: 26px;text-align: center;overflow: auto">
                            ${c1}
                    </div>
                </div>
            </c:forEach>
        </div>
        <div id="class5" class="showKebiao">
            <c:forEach  items="${sessionScope.kbs.class5}" var="c1" varStatus="num">
                <div style="color: white;border-radius: 8px;margin-top: 20px;margin-left: 1.5%;float: left;width: 18%;height: 150px;background-color: white">
                    <div style="text-align: center;font-size: 30px;width: 100%;height: 40px;background-color: lightblue">
                        第五节
                    </div>
                    <div style="color: black;line-height: 50px;height: 80%;font-size: 26px;text-align: center;overflow: auto">
                            ${c1}
                    </div>
                </div>
            </c:forEach>
        </div>
        <div id="class6" class="showKebiao">
            <c:forEach  items="${sessionScope.kbs.class6}" var="c1" varStatus="num">
                <div style="color: white;border-radius: 8px;margin-top: 20px;margin-left: 1.5%;float: left;width: 18%;height: 150px;background-color: white">
                    <div style="text-align: center;font-size: 30px;width: 100%;height: 40px;background-color: lightblue">
                        第六节
                    </div>
                    <div style="color: black;line-height: 50px;height: 80%;font-size: 26px;text-align: center;overflow: auto">
                            ${c1}
                    </div>
                </div>
            </c:forEach>
        </div>
</div>
</div>
</body>
</html>
