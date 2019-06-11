window.onload=function () {
    setTimeout(function () {
        $("#jianjie").addClass("showjianjie");
    },100);
    setTimeout(function () {
        $("#neirong").addClass("showjianjie");
    },300);
    setTimeout(function () {
    for (let index = 0; index < $(".gongao").length; index++) {
        setTimeout(function () {
            var arr = $(".gongao")[index];
            $(arr).addClass("showjianjie");
        }, 150 * index);
    }
    },500);
    setTimeout(function () {
        $("#loadmore").addClass("showjianjie");
    }, 150 * $(".gongao").length+500);
};
$(document).ready(function () {
    //定义变量获取屏幕视口宽度
    var windowWidth = $(window).width();
    if (windowWidth > 1200) {
        $("body").css("width", "50%");
        $("body").css("margin", "auto");
        $("#select_bz").css("width", "11.5%");
        $("#select_bz_two").css("width", "11.5%");
        $("#menu_mobile").css("width", "25%");
        $("#menu_mobile").css("left", "-25%");
        $("#menu_mobie_right").css("width", "75%");
        $("#menu_mobie_right").css("right", "-75%");
        $("#landlord").css("pointer-events", "auto");
        $("#neirong").css("width","94%");
        $(".gongao2").css("width","94%");
    }
});


function menuTanchu() {
    $("#menu_mobile").removeClass("hideMenu");
    $("#menu_mobie_right").removeClass("showMenu");
    $("#menu_mobile").addClass("showMenu");
    $("#menu_mobie_right").addClass("hideMenu");
}

function menuYinchang() {
    $("#menu_mobile").removeClass("showMenu");
    $("#menu_mobie_right").removeClass("hideMenu");
    $("#menu_mobile").addClass("hideMenu");
    $("#menu_mobie_right").addClass("showMenu");
}

function selectBz_show() {
    if ($("#select_bz").hasClass("showSelectBizhi")) {
        $("#select_bz").removeClass("showSelectBizhi");
        $("#select_bz_two").removeClass("showSelectBizhi_two");
        $("#select_bz").addClass("hideSelectBizhi");
        $("#select_bz_two").addClass("hideSelectBizhi_two");
    } else {
        $("#select_bz").removeClass("hideSelectBizhi");
        $("#select_bz_two").removeClass("hideSelectBizhi_two");
        $("#select_bz").addClass("showSelectBizhi");
        $("#select_bz_two").addClass("showSelectBizhi_two");
    }
}

function selectBz_hide() {
    //定义变量获取屏幕视口宽度
    var windowWidth = $(window).width();
    if (windowWidth < 1200) {
        $("#select_bz").removeClass("showSelectBizhi");
        $("#select_bz_two").removeClass("showSelectBizhi_two");
        $("#select_bz").addClass("hideSelectBizhi");
        $("#select_bz_two").addClass("hideSelectBizhi_two");
    }
}