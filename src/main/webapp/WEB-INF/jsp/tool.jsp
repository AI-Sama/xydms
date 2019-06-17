<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>工具</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/Index.js"></script>
    <script src="${pageContext.request.contextPath}/js/gju.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gju.css">
</head>

<body>
<div id="loadYem" style="background-color: #f4f6f8;position: fixed;top: 0;left: 0;width: 100%;height: 100%;z-index: 20000;">
    <div style="text-align: center;width: 200px;z-index: 20001;position: fixed;left: 50%;top: 35%;transform:translateX(-50%);">
        <img id="loadimg" src="/Img_icon/loading.png" >
        <span style="line-height: 50px;color: lightpink;font-size: 20px">Loading......</span>
    </div>
</div>
<div id="form2" style="display: none;position: fixed;width: 100%;height: 100%;z-index: 99;left: 0;top: 0;background-color: #5e5e5e;opacity: 0.2"></div>
<%--<div id="form1"--%>
     <%--style="font-family: '楷体';z-index: 100;color: gray;display: none;border-radius: 8px;position: fixed;width: 500px;height: 205px;left: 50%;transform: translateX(-50%);top:40%;background-color: white;">--%>
    <%--<input style="border-radius: 10px;margin-top: 10px;height: 60px;font-size: 30px;width:480px;margin-left: 10px"--%>
           <%--name="username" id="user" type="text" placeholder="&#12288请输入您的学工网账号"><br>--%>
    <%--<input style="border-radius: 10px;margin-top: 10px;height: 60px;font-size: 30px;width:480px;margin-left: 10px"--%>
           <%--name="password" id="pass" type="password" placeholder="&#12288请输入您的学工网密码"><br>--%>
    <%--<div style="width: 500px;height:60px;margin: auto;margin-top: 10px"><input onclick="tijiao()" type="button"--%>
                                                                               <%--style=" font-size: 25px;color: white;width: 500px;border: none;border-radius: 0 0 10px 10px;height: 50px;background-color: lightblue"--%>
                                                                               <%--value="提交">--%>
    <%--</div>--%>
<%--</div>--%>
<div id="form3"
     style="z-index: 100;color: gray;display: none;border-radius: 8px;position: fixed;width: 500px;height: 205px;left: 50%;transform: translateX(-50%);top:40%;background-color: white;">
    <input style="border-radius: 10px;margin-top: 10px;height: 60px;font-size: 30px;width:480px;margin-left: 10px"
           name="username" id="username" type="text" placeholder="&#12288请输入您的教务管理系统账号"><br>
    <input style="border-radius: 10px;margin-top: 10px;height: 60px;font-size: 30px;width:480px;margin-left: 10px"
           name="password" id="password" type="password" placeholder="&#12288请输入您的教务管理系统密码"><br>
    <div style="width: 500px;height:60px;margin: auto;margin-top: 10px"><input onclick="InputCJ()" type="button"
                                                                               style=" font-size: 25px;color: white;width: 500px;border: none;border-radius: 0 0 10px 10px;height: 50px;background-color: lightblue"
                                                                               value="提交">
    </div>
</div>

<div id="form4"
     style="z-index: 100;color: gray;display: none;border-radius: 8px;position: fixed;width: 500px;height: 205px;left: 50%;transform: translateX(-50%);top:40%;background-color: white;">
    <input style="border-radius: 10px;margin-top: 10px;height: 60px;font-size: 30px;width:480px;margin-left: 10px"
           name="username" id="username2" type="text" placeholder="&#12288请输入您的教务管理系统账号"><br>
    <input style="border-radius: 10px;margin-top: 10px;height: 60px;font-size: 30px;width:480px;margin-left: 10px"
           name="password" id="password2" type="password" placeholder="&#12288请输入您的教务管理系统密码"><br>
    <div style="width: 500px;height:60px;margin: auto;margin-top: 10px"><input onclick="InputKB()" type="button"
                                                                               style=" font-size: 25px;color: white;width: 500px;border: none;border-radius: 0 0 10px 10px;height: 50px;background-color: lightblue"
                                                                               value="提交">
    </div>
</div>
<!-- 登录表头-->
<div>
    <jsp:include page="Ym_title.jsp"></jsp:include>
</div>
<div style="width: 90%;height: auto;margin: auto;margin-top: 40px;">
        <%--<a href="javascript:void(0)">--%>
            <%--<div class="gju" onclick="chaxun()"--%>
                 <%--style="position: relative;margin-top: 1520px;margin-left: 1%;font-size: 30px;text-align: center;line-height: 100px;border-radius: 10px;float: left;width:48%;height: 100px;background-color: lightblue;color: white">--%>
                <%--素拓分查询--%>
            <%--</div>--%>
        <%--</a>--%>
        <a href="javascript:void(0)">
            <div class="gju" onclick="chaxunKB()"
                 style="position: relative;margin-top: 1520px;margin-left: 1%;font-size: 30px;text-align: center;line-height: 100px;border-radius: 10px;float: left;width:48%;height: 100px;background-color: lightblue;color: white">
                课表查询
            </div>
        </a>
        <a href="javascript:void(0)">
            <div class="gju" onclick="chaxunCJ()"
                 style="position: relative;margin-top: 1520px;margin-left: 1%;font-size: 30px;text-align: center;line-height: 100px;border-radius: 10px;float: left;width:48%;height: 100px;background-color: lightblue;color: white">
                成绩查询
            </div>
        </a>
</div>
</body>
</html>
