function chaxun() {
    $("#form1").css("display","block");
    $("#form2").css("display","block");
}
function chaxunCJ() {
    $("#form3").css("display","block");
    $("#form2").css("display","block");
}
function chaxunKB() {
    $("#form4").css("display","block");
    $("#form2").css("display","block");
}

function tijiao() {
    var name = $("#user").val();
    var pw = $("#pass").val();
    if (name == null || pw == null) {
        alert("账号或密码填写错误");
        return false;
    }
    $("#form1").css("display","none");
    $("#form2").css("display","none");
    var data = {
        username: name,
        password: pw
    }
    $("#loadIng").css("display","block");
    $.ajax({ //Jq的ajax方法
        type: "POST",  //访问的方法
        dataType: "json", //返回值
        url: "/Items/selectShuTuo", //访问的action路径
        data: data,  //传输的数据
        success: function (result) { //如果成功则进入这个函数
            $("#loadIng").css("display","none");
            if(result==null){
                alert("查询失败,请检查一下您的账号密码是否正确");
            }
            alert(result[0] + "\r\n" + result[1] + "\r\n" + result[2] + "\r\n" + result[3] + "\r\n" + result[4] + "\r\n" + result[5] + "\r\n" + result[6]);
        },
        error: function () {
            $("#loadIng").css("display","none");
            alert("查询失败,请检查一下您的账号密码是否正确");
        }
    });
}

$(document).ready(function () {
    $("#loadimg").addClass("loadimg");
});
$(window).load(function () {
    $("#loadYem").css("display","none");
    $("#form2").bind("click",function () {
        $("#form1").css("display","none");
        $("#form2").css("display","none");
        $("#form3").css("display","none");
        $("#form4").css("display","none");
    });
    for (let index = 0; index < $(".gju").length; index++) {
        setTimeout(function () {
            var arr = $(".gju")[index];
            $(arr).addClass("loadgj");
        }, 300 * index);
    }
});


function InputCJ() {
    var cla = $("#username").val();
    var num = $("#password").val();
    if (cla.trim().length <= 0 || num.trim().length <= 0) {
        alert("账号或密码不能为空");
        return false;
    }
    $("#loadIng").css("display","block");
    window.location.replace("/ToolsController/findCJ?userName=" + cla + "&password=" + num);
}
function InputKB() {
    var cla = $("#username2").val();
    var num = $("#password2").val();
    if (cla.trim().length <= 0 || num.trim().length <= 0) {
        alert("账号或密码不能为空");
        return false;
    }
    $("#loadIng").css("display","block");
    window.location.replace("/ToolsController/findKB?userName=" + cla + "&password=" + num);
}



function InputClass() {
    var cla = prompt("请输入班级");
    if (cla == null) {
        return false;
    }
    var num = prompt("请输入要查询的周次(如第一周就填1)");
    if (num == null) {
        return false;
    }
    if (cla.trim().length <= 0 || num.trim().length <= 0) {
        alert("班级或周次不能为空");
        return false;
    }
    if (parseInt(num) > 25 || parseInt(num) <= 0) {
        alert("周次在1-25之间");
        return false;
    }
    $("#loadIng").css("display","block");
    window.location.replace("/Items/selectKeBiao?banji=" + cla + "&zhouci=" + num);
}