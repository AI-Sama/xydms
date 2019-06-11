package com.mapper;
import com.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface  UserMapper{
    void addUser(User user);//添加账号
    User selectByUserName(@Param("userName") String userName); //根据用户名查找用户
    User selectByEmail(@Param("email") String email); //根据邮箱查找用户
    void countDL(@Param("userName") String userName, @Param("ip") String ip);//记录登录ip
    void checkIn(@Param("date") Date date,@Param("userName")String userName);//签到
    void userLvChange(@Param("userName") String userName);//等级提升
    List<User> findUsers();//查找全部人员
    void addManage(@Param("userId") Integer userId);//添加管理员
    void deleteManage( @Param("userId") Integer userId);//删除管理员
    void resetPassword(@Param("userId") Integer userId);//重置密码
}
