package com.mapper;
import com.pojo.EduAccount;
import com.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface EduAccountMapper {
    void addEduAccount(EduAccount eduAccount);//添加一个绑定账号
    void deleteEduAccount(@Param("bindUser") String bindUser);//删除一个绑定账号
    EduAccount findEduAccount(@Param("bindUser") String bindUser);//查找一个绑定账号
}
