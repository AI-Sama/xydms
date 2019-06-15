package com.mapper;
import com.pojo.Anima;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnimaMapper {
     List<Anima> findAnima();//查找所有番剧
     void addAnima(Anima anima);//插入一条番剧
     void deleteAnima(@Param("id") Integer id);//删除一条番剧
     void deleteAnimaByName(@Param("animaName") String animaName);//删除一条番剧
     void dropAnima();//删除全部番剧
}
