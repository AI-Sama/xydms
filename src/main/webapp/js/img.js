function bigImgsc(a, b) {
    var src=$(a).attr("src");
    var dataImg = {
        addr: b
    };
    if (src.indexOf("heart_r.png") > 0){
        $.ajax({ //Jq的ajax方法
            type: "POST",  //访问的方法
            url: "/Items/DeleteSc", //访问的action路径
            data: dataImg,  //传输的数据
        });
        $(".heart_css").attr("src", "/Img_icon/heart_w.png");
    } else {
        $.ajax({ //Jq的ajax方法
            type: "POST",  //访问的方法
            url: "/Items/InsertSc", //访问的action路径
            dataType: "text", //返回值
            data: dataImg,  //传输的数据
            success: function (result) { //如果成功则进入这个函数
                if (result.trim().length == 0) {
                    $(".heart_css").attr("src", "/Img_icon/heart_r.png");
                } else {
                    alert(result);
                }
            }
        });
    }
}
function deleteImg(addr) {
    var boole = confirm("您确定要删除这张图片吗?");
    var data={
        id:addr
    }
    if (boole) {
        $.ajax({ //Jq的ajax方法
            type: "POST",  //访问的方法
            url: "/WallpaperController/deleteImg", //访问的action路径
            data: data,  //传输的数据
            success: function (result) { //如果成功则进入这个函数
                alert(result);
                window.location.replace("/WallpaperController/jumpWallpaper");
            }
        });
    }
}