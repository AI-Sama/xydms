package com.mapper;

import com.pojo.Anima;
import com.pojo.Resource;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ResourceMapper {
    String selectLastSrcImg();//查找最后一张图片名称
    void insertSrc(Resource resource);//插入一条资源
    List<Resource> selectAllSrc(@Param("num") Integer num);//查找指定页数的资源
    Integer selectAllSrcPage();//查找全部资源数量
}
