package com.service;

import com.mapper.UserMapper;
import com.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public String addUser(User user) throws Exception {//注册账号
        User user1=userMapper.selectByUserName(user.getUserName());
        User user2=userMapper.selectByEmail(user.getEmail());
        if(user1!=null){
            return "该用户名已被注册";
        }
        if(user2!=null){
            return "该邮箱已被注册";
        }
        if (user.getUserName().trim().length() < 2||user.getUserName().trim().length() >6) {
            return  "用户名在2-6位之间";
        }
        if (user.getPassword().trim().length() < 6||user.getPassword().trim().length() >10) {
            return  "密码在6-10位之间";
        }
        userMapper.addUser(user);
        return "注册成功";
    }
    public User signIn(String str1, String password) throws Exception {//登录
        User user1=userMapper.selectByUserName(str1);
        if(user1==null){
         user1=userMapper.selectByEmail(str1);
        }
        if(user1==null||(!user1.getPassword().equals(password))){
            return null;
        }else{
            user1.setPassword("");
            return user1;
        }
    }
    public void countDL(String userName,String ip){//记录登录ip
             userMapper.countDL(userName,ip);
    }

    public String checkIn(String userName) {//签到
        User user = userMapper.selectByUserName(userName);
        SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
        Date nowDate = new Date();
        if(user.getSignDay()==null){
            userMapper.checkIn(nowDate, userName);
            userLvChange(userName);
            return "签到成功(签到天数:" +( user.getCountDay()+1) + "天)";
        }
        String qdDate = sm.format(user.getSignDay());
        if (qdDate.equals(sm.format(nowDate))) {
            return "已签到(签到天数:" + user.getCountDay() + "天)";
        } else {
            userMapper.checkIn(nowDate, userName);
            userLvChange(userName);
        }
        return "签到成功(签到天数:" +( user.getCountDay()+1) + "天)";
    }
   public void userLvChange(String userName){//等级提升
       User user = userMapper.selectByUserName(userName);
       Integer userLV=user.getUserLv();
       Integer countDay=user.getCountDay();
       if(countDay>=((userLV*(userLV+1))/2)){
           userMapper.userLvChange(userName);
       }
   }
   public List<User> findUsers(){//查找所有用户
        List<User> users=userMapper.findUsers();
       for (User user:users
       ) {
           user.setPassword("");
       }
        return users;
   }
   public void addManage(Integer userId){//添加管理员
        userMapper.addManage(userId);
   }
    public void deleteManage(Integer userId){//删除管理员
        userMapper.deleteManage(userId);
    }
    public void resetPassword(Integer userId){//重置密码
        userMapper.resetPassword(userId);
    }
    public User selectByUserId(Integer userId){//根据id查找用户
       return userMapper.selectByUserId(userId);
    }
    public void changePassword(Integer userId,String password){//修改密码
        userMapper.setPassword(password,userId);
    }
}
