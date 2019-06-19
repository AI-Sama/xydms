package com.mapper;
import com.pojo.Anima;
import com.pojo.Suggest;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SuggestMapper {
     void addSuggest(Suggest suggest);//添加建议
}
