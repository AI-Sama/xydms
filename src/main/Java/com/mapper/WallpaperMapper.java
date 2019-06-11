package com.mapper;

import com.pojo.Wallpaper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WallpaperMapper {
    List<Wallpaper> selectHotImgList(@Param("nowPageCount")Integer nowPageCount);//按点击率查找图片
    List<Wallpaper> selectNewImgList(@Param("nowPageCount")Integer nowPageCount);//按上传时间查找图片
    Integer selectWallpaperCount();//查找全部图片个数
    void clickImg(@Param("addr") String addr);//更新图片点击数
    String findLastImg();//查找最后一张图片名称
    void upImg(Wallpaper wallpaper);//上传图片
}
