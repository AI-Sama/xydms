package com.mapper;

import com.pojo.Anima;
import com.pojo.Announce;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnnounceMapper {
    void insertAnn(Announce announce);//插入一条公告
    List<Announce> findAnnounceByPage(@Param("num") Integer num);//根据页数查找公告
    Announce findAnnById(Integer id);//查找一条公告
    void deleteAnn(Integer id);//删除一条公告
    void changeAnnTop(@Param("id")Integer id,@Param("top") Integer top);//更改置顶状态
    void clickAnn(Integer id);//增加点击数
}
