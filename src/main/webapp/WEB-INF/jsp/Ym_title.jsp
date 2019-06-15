<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/js/Index.js"></script>
<script src="${pageContext.request.contextPath}/js/YmTitle.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index_mobile_two.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/denglu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/YmTitle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Live2dRem-master/live2d/css/live2d.css"/>
<script src="${pageContext.request.contextPath}/js/indexSakula.js"></script>
<!--登录弹窗-->
<div id="backImg"></div>
<div id="dl_box">
    <form method="post" id="dl_form">
        <div class="head">
            <a href="javascript:void(0)">
                <div class="denLu">
                    登录
                </div>
            </a>
            <a href="javascript:void(0)">
                <div class="zhuce" onclick="tc_zc()">
                    注册
                </div>
            </a>
            <a href="javascript:void(0)">
                <div class="guanBi" onclick="guanBidl()">
                    ×
                </div>
            </a>
        </div>
        <hr size="0.3" style="border-color: lightblue;">
        <div class="body">
            <input value="${sessionScope.userName}" class="youXiang" type="text" name="str1"
                   placeholder="&#12288✉&nbsp;您的用户名或邮箱">
            <input value="${sessionScope.password}" class="youXiang" type="password" name="password"
                   placeholder="&#12288🗝&nbsp;您的密码">
            <div style="opacity: 0.7;width: 620px;height: 60px;border-radius: 10px; font-size: 30px; margin-left: 20px;
            margin-top: 15px;">
                <c:if test="${not empty sessionScope.userName}">
                    <input checked name="rememberPass"
                           style="margin-top: -5px;vertical-align:middle;width: 35px;height: 35px" type="checkbox">
                </c:if>
                <c:if test="${empty sessionScope.userName}">
                    <input name="rememberPass" style="margin-top: -5px;vertical-align:middle;width: 35px;height: 35px"
                           type="checkbox">
                </c:if>
                &nbsp;记住密码
            </div>
        </div>
        <input class="submit" type="button" value="登录" onclick="SignIn()">
    </form>
</div>
<!--登录弹窗-->

<!-- 注册弹窗-->
<div id="zc_box">
    <form method="post" id="zc_form">
        <div class="head_zc">
            <a href="javascript:void(0)">
                <div class="denLu_zc" onclick="tc()">
                    登录
                </div>
            </a>
            <a href="javascript:void(0)">
                <div class="zhuce_zc">
                    注册
                </div>
            </a>
            <a href="javascript:void(0)">
                <div class="guanBi_zc" onclick="guanBizc()">
                    ×
                </div>
            </a>
        </div>
        <hr size="0.3" style="border-color: lightblue;">
        <div class="body_zc">
            <input class="youXiang_zc" type="text" id="name" name="userName" placeholder="&#12288☺&nbsp;您的昵称">
            <input class="youXiang_zc" type="text" id="email" name="email" placeholder="&#12288✉&nbsp;您的邮箱">
            <input class="youXiang_zc" type="password" id="password" name="password" placeholder="&#12288🗝&nbsp;您的密码">
        </div>
        <input class="submit_zc" type="button" value="注册" onclick="SignUp()">
    </form>
</div>
<!-- 注册弹窗-->

<%--头部--%>
<div class="head_mobile">
    <c:if test="${ not empty sessionScope.user}">
        <img onclick="menuTanchu()" style="width:60px; margin-top:20px;margin-left:2%;float: left;"
             src="/Img_icon/menu.png">
    </c:if>
    <c:if test="${empty sessionScope.user}">
        <img onclick="alert('请先登录');tc()" style="width:60px; margin-top:20px;margin-left:20px;float: left;"
             src="/Img_icon/menu.png">
    </c:if>
    <img style="position:absolute;height: 70px;margin-top: 15px;left: 50%;transform: translateX(-50%)"
         src="/Img_icon/xy2.png">
    <c:if test="${empty sessionScope.user}">
        <span onclick="tc()"
              style="font-size:40px;color: white; background-color: lightblue; float: right;line-height: 100px;width: 140px;height: 100px">登录</span>
    </c:if>
    <c:if test="${not empty sessionScope.user}">
        <span style="margin-right: 3%;text-align: right;font-size:35px;color: lightblue; float: right;line-height: 100px;width: auto;height: 100px">Lv.${sessionScope.user.userLv}&thinsp;${sessionScope.user.userName}</span>
        <%--<div style="border: 3px lightblue solid;overflow: hidden;border-radius: 50%;background-color: red;float: right;width: 70px;height: 70px;margin-top: 15px;margin-right: 20px">--%>
        <%--<img style="width: 100%" height="100%" src="/Img_icon/bgSakura.jpg">--%>
        <%--</div>--%>
    </c:if>
</div>
<%--头部--%>

<!--标题-->
<div style="position: relative;z-index: 10;width: 96%;height: 120px;margin: auto;margin-top: 20px;border-radius: 8px; background-color: lightblue">
    <a href="/IndexController/jumpIndex">
        <div class="title_mobile">首页</div>
    </a>
    <div class="title_mobile" onclick="alert('该功能正在开发中')">活动</div>
    <div id="showBizhi" class="title_mobile" onmouseout="selectBz_hide()" onclick="selectBz_show()">壁纸</div>
    <a href="/ToolsController/jumpTools">
        <div id="gjMess" class="title_mobile">工具</div>
    </a>
</div>
<div id="select_bz"
     style="position: relative;z-index: 5;color: white;position: absolute;left: 50%;top: 139px;width: 23%;height: 100px;background-color: lightblue">
    <a href="/WallpaperController/jumpWallpaper?type=0">
        <div style="color: white;text-align: center;font-size: 30px;width: 100%;height: 99px;line-height: 99px">
            热门壁纸
        </div>
    </a>
</div>
<div id="select_bz_two"
     style="position: relative;z-index: 5;border-radius: 0 0 10px 10px;color: white;position: absolute;left: 50%;top: 139px;width: 23%;height: 100px;background-color: lightblue">
    <a href="/WallpaperController/jumpWallpaper?type=1">
        <div style="color: white;text-align: center;font-size: 30px;width: 100%;height: 99px;line-height: 99px">
            最新壁纸
        </div>
    </a>
</div>
<!--标题-->


<!--个人中心-->
<div onclick="menuYinchang()" id="menu_mobie_right"
     style="z-index: 100;width: 40%;background-color: gray;opacity: 0.2;height: 100%;position: fixed;top: 0px;right: -40%">
</div>
<div id="menu_mobile"
     style="overflow: auto;z-index: 100;position: fixed;top:0px;left:-60%;width: 60%;height: 100%;background-color: white">
    <div style="font-size: 50px;background-color: lightblue; text-align: center; width: 100%;height: 150px;line-height:150px;color: white">
        个人中心
    </div>
    <c:if test="${sessionScope.user.lv >=1}">
        <details >
            <summary style="width: 100%;height: 60px;margin: auto; margin-top:10px;background-color:lightblue">
                    <span style="color: white;font-size: 30px;line-height: 60px">管理员</span>
            </summary>
            <ul>
                <li>
                    <a href="/WallpaperController/jumpJudgeImg">
                        <div style="background-color: lightpink;width: 100%;height: 80px;margin: auto;"><img style="width: 30px;margin-left: 20px" src="/Img_icon/plsh.png"><span
                                style="color: white;font-size: 30px;margin-left: 20px; line-height: 80px">壁纸审核</span></div>
                    </a>
                </li>
                <li>
                    <a href="/ResourceController/jumpJudgeSrc">
                        <div style="background-color: lightpink;width: 100%;height: 80px;margin: auto;"><img style="width: 30px;margin-left: 20px" src="/Img_icon/plsh.png"><span
                                style="color: white;font-size: 30px;margin-left: 20px; line-height: 80px">资源审核</span></div>
                    </a>
                </li>
                <%--<li>--%>
                    <%--<a href="/Items/PlunStatus">--%>
                        <%--<div style="background-color: lightpink;width: 100%;height: 80px;margin: auto;"><img style="width: 30px;margin-left: 20px" src="/Img_icon/plsh.png"><span--%>
                                <%--style="color: white;font-size: 30px;margin-left: 20px; line-height: 80px">评论审核</span></div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <li>
                    <a href="/AnnounceController/jumpAnnounce">
                        <div style="background-color: lightpink;width: 100%;height: 80px;margin: auto;"><img style="width: 30px;margin-left: 20px"

                                                                                                             src="/Img_icon/gongao.png"><span
                                style="color: white;font-size: 30px;margin-left: 20px; line-height: 80px">公告发布</span></div>
                    </a>
                </li>
            </ul>
        </details>


    </c:if>
    <c:if test="${sessionScope.user.lv>=2}">
        <details >
            <summary style="width: 100%;height: 60px;margin: auto; margin-top:10px;background-color:lightblue">
                <span style="color: white;font-size: 30px;line-height: 60px">超级管理员</span>
            </summary>
            <ul>
                <li>
                    <a href="/AnimaController/jumpAnimaManage">
                        <div style="background-color: lightpink;width: 100%;height: 80px;margin: auto;"><img style="width: 30px;margin-left: 20px"
                                                                                 src="/Img_icon/setutime.png"><span
                                style="color: white;font-size: 30px;margin-left: 20px; line-height: 80px">番剧更新</span></div>
                    </a>
                </li>
                <li>
                    <a href="/UserController/jumpPersonManage">
                        <div style="background-color: lightpink;width: 100%;height: 80px;margin: auto;"><img style="width: 30px;margin-left: 20px"
                                                                                 src="/Img_icon/quanxiangenggai.png"><span
                                style="color: white;font-size: 30px;margin-left: 20px; line-height: 80px">人员管理</span></div>
                    </a>
                </li>
            </ul>
        </details>
    </c:if>
    <div onclick="qdDay()" style="width: 85%;height: 100px;margin: auto;"><img style="width: 40px"
                                                                               src="/Img_icon/qd.png"><span
            style="font-size: 50px;margin-left: 20px; line-height: 100px">签到</span></div>
    <a href="/UserController/jumpPerson">
    <div style="width: 85%;height: 100px;margin: auto;"><img style="width: 40px" src="/Img_icon/sc.png"><span
    style="font-size: 50px;margin-left: 20px; line-height: 100px">个人信息</span></div>
    </a>
    <%--<a href="/Items/MyScImg">--%>
        <%--<div style="width: 85%;height: 100px;margin: auto;"><img style="width: 40px" src="/Img_icon/sc.png"><span--%>
                <%--style="font-size: 50px;margin-left: 20px; line-height: 100px">我的收藏</span></div>--%>
    <%--</a>--%>
    <a href="/ResourceController/loadSrc">
        <div style="width: 85%;height: 100px;margin: auto;"><img style="width: 40px"
                                                                 src="/Img_icon/shetuanziyuan.png"><span
                style="font-size: 50px;margin-left: 20px; line-height: 100px">社团资源</span></div>
    </a>
    <a href="/WallpaperController/jumpUpWallpaper">
        <div style="width: 85%;height: 100px;margin: auto;"><img style="width: 40px"
                                                                 src="/Img_icon/bizshangc.png"><span
                style="font-size: 50px;margin-left: 20px; line-height: 100px">壁纸上传</span></div>
    </a>

    <a href="/ResourceController/jumpUpSrc">
        <div style="width: 85%;height: 100px;margin: auto;"><img style="width: 40px"
                                                                 src="/Img_icon/ziyuanfabu.png"><span
                style="font-size: 50px;margin-left: 20px; line-height: 100px">资源上传</span></div>
    </a>


    <a href="/UserController/signOut">
        <div style="width: 85%;height: 100px;margin: auto;"><img style="width: 40px" src="/Img_icon/tuichu.png">
            <span
                    style="font-size: 50px;margin-left: 20px; line-height: 100px">退出登录</span></div>
    </a>
</div>


<%--看板娘--%>
<div id="landlord" style="right:10px;bottom:0px;">
    <div class="message" style="opacity:0"></div>
    <canvas id="live2d" width="500" height="560" class="live2d"></canvas>
    <div class="live_talk_input_body">
        <div class="live_talk_input_name_body">
            <input name="name" type="text" class="live_talk_name white_input" id="AIuserName" autocomplete="off"
                   placeholder="你的名字"/>
        </div>
        <div class="live_talk_input_text_body">
            <input name="talk" type="text" class="live_talk_talk white_input" id="AIuserText" autocomplete="off"
                   placeholder="要和我聊什么呀？"/>
            <button type="button" class="live_talk_send_btn" id="talk_send">发送</button>
        </div>
    </div>
    <input name="live_talk" id="live_talk" value="1" type="hidden"/>
    <div class="live_ico_box">
        <div class="live_ico_item type_info" id="showInfoBtn"></div>
        <div class="live_ico_item type_talk" id="showTalkBtn"></div>
        <div class="live_ico_item type_music" id="musicButton"></div>
        <div class="live_ico_item type_youdu" id="youduButton"></div>
        <div class="live_ico_item type_quit" id="hideButton"></div>
        <input name="live_statu_val" id="live_statu_val" value="0" type="hidden"/>
        <audio src="" style="display:none;" id="live2d_bgm" data-bgm="0" preload="none"></audio>
        <input name="live2dBGM" value="https://t1.aixinxi.net/o_1c52p4qbp15idv6bl55h381moha.mp3" type="hidden">
        <input name="live2dBGM" value="https://t1.aixinxi.net/o_1c52p8frrlmf1aled1e14m56una.mp3" type="hidden">
        <input id="duType" value="douqilai,l2d_caihong" type="hidden">
    </div>
</div>
<div id="open_live2d">召唤蕾姆</div>
<div id="loadIng" style="display: none">
    <div style="background-color: #5e5e5e;opacity: 0.1;position: fixed;z-index: 20000;top: 0;left: 0;width: 100%;height: 100%;"></div>
    <div style="text-align: center;width: 200px;z-index: 20001;position: fixed;left: 50%;top: 35%;transform:translateX(-50%);">
        <img style="opacity: 1;" id="loadimg" src="/Img_icon/loading.png">
        <span style="opacity: 1;line-height: 50px;color: lightblue;font-size: 20px">Loading......</span>
    </div>
</div>

<script type="text/javascript" src="https://apps.bdimg.com/libs/jquery/1.7.1/jquery.min.js"></script>
<script>
    var message_Path = '/Live2dRem-master/live2d/';//资源目录，如果目录不对请更改
    var talkAPI = "http://openapi.tuling123.com/openapi/api/v2";//如果有类似图灵机器人的聊天接口请填写接口路径
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Live2dRem-master/live2d/js/live2d.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Live2dRem-master/live2d/js/message.js"></script>
<%--看板娘--%>










