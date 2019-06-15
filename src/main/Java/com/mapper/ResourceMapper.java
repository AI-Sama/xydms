package com.mapper;

import com.pojo.Anima;
import com.pojo.Resource;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ResourceMapper {
    String selectLastSrcImg();//查找最后一张图片名称
    void insertSrc(Resource resource);//插入一条资源
    List<Resource> selectAllSrc(@Param("num") Integer num);//查找指定页数的已审核资源
    Integer selectAllSrcPage();//查找全部资源数量
    List<Resource> selectJudgeSrc();//查找待审核的资源
    void setJudgeState(@Param("id") Integer id,@Param("num") Integer num);//审核项目
    void setAllState();//全部通过
    Resource selectSrc(@Param("id")Integer id);//查找单个资源
    void clickSrc(@Param("id")Integer id);//增加点击率
    void deleteSrc(@Param("id")Integer id);//删除资源
}
