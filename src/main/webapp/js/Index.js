function sc(a, b) {
    var arr = $($(".shouc")[a]);
    var sctable = {
        addr: b
    };
    if ($(".shouc")[a].src.indexOf("heart_w.png") > 0) {
        $.ajax({ //Jq的ajax方法
            type: "POST",  //访问的方法
            url: "/Items/InsertSc", //访问的action路径
            dataType: "text", //返回值
            data: sctable,  //传输的数据
            success: function (result) { //如果成功则进入这个函数

                if (result.trim().length == 0) {
                    arr.attr("src", "/Img_icon/heart_r.png");
                } else {
                    alert(result);
                }
            }
        });

    } else {
        $.ajax({ //Jq的ajax方法
            type: "POST",  //访问的方法
            url: "/Items/DeleteSc", //访问的action路径
            data: sctable,  //传输的数据
        });
        arr.attr("src", "/Img_icon/heart_w.png");
    }
}

function qdDay() {
    try {
        showMessage('今天也是充满希望的一天呢~', 5000);
    } catch (e) {
    }
    $.ajax({ //Jq的ajax方法
        type: "POST",  //访问的方法
        dataType: "text", //返回值
        url: "/UserController/checkIn", //访问的action路径
        success: function (result) { //如果成功则进入这个函数
            alert(result);
        }
    });
}

function setuTime() {
    var boo = confirm("您确定要进入色图time吗?");
    if (boo) {
        $("#colortime").css("display", "block");
        setInterval(colorTime, 1);
    }
}

function colorTime() {
    var color = ["red", "yellow", "white", "black"];
    $("#colortime").css("background-color", color[Math.floor(Math.random() * 3)]);
    $("#colorText").css("color", color[Math.floor(Math.random() * 4)]);
}

function SignUp() {
    var user = /^[\u4E00-\u9FA5\uF900-\uFA2D_\w]+$/;//校验非字母数字汉字
    if ($("#name").val().length < 2 || $("#name").val().length > 6) {
        alert("昵称格式错误(2-6位之间)");
        return null;
    }
    if (!user.test($("#name").val())) {
        alert("用户名不能包含特殊字符");
        return null;
    }
    if ($("#password").val().length < 6 || $("#password").val().length > 10) {
        alert("密码格式错误(6-10位之间)");
        return null;
    }
    $.ajax({ //Jq的ajax方法
        type: "POST",  //访问的方法
        dataType: "text", //返回值
        url: "/UserController/addUser", //访问的action路径
        data: $("#zc_form").serialize(),  //传输的数据
        success: function (result) { //如果成功则进入这个函数
            alert(result);
            if (result == "注册成功") {
                $("#zc_box").css("display", "none");
            }else{
                document.getElementById("zc_form").reset();
            }
        }
    });
}

function SignIn() {
    $.ajax({ //Jq的ajax方法
        type: "POST",  //访问的方法
        dataType: "text", //返回值
        url: "/UserController/signIn", //访问的action路径
        data: $("#dl_form").serialize(),  //传输的数据
        success: function (result) { //如果成功则进入这个函数
            alert(result);
            if (result == "登录成功") {
                window.location.replace("/index.jsp");
            }else{
                $("#dlPassword").val("");
            }
        }
    });
}

function tc() {
    try {
        showMessage('登录后可查看更多东西哦~', 5000);
    } catch (e) {
    }
    $("#dl_box").css("display","block");
    $("#zc_box").css("display","none");
}
function tc_zc() {
    try {
        showMessage('还没有账号吗,快注册一个吧~', 5000);
    } catch (e) {
    }
    $("#dl_box").css("display","none");
    $("#zc_box").css("display","block");
}
function guanBidl() {
    $("#dl_box").css("display","none");
    document.getElementById("dl_form").reset();
}
function guanBizc() {
    $("#zc_box").css("display","none");
    document.getElementById("zc_form").reset();
}

//=====================
$(window).load(function () {
    $("#loadYem").css("display","none");
});
$(document).ready(function () {
    $("#loadimg").addClass("loadimg");
    for(let x=1;x<=7;x++){
        $("#week"+x).bind("click",function () {
            $(this).addClass("layui-this");
            for(let y=1;y<=7;y++){
                if(y==x){
                    continue;
                }
                $("#zhou"+y).css("display","none");
            }
            $("#zhou"+x).css("display","block");
        });
    }
    var date = new Date();
    var week = date.getDay();
    if(week==0){
        week=7;
    }
    $("#week"+week).addClass("layui-this");
    $("#zhou"+week).css("display","block");
});

function lookAnima() {
    var animaName=prompt("请输入番剧名称");
    if(animaName.trim().length>0){
        window.location.replace("/AnimaController/searchAnima?animaName="+animaName);
    }
}