package com.pojo;

import java.util.Date;

public class User {
    private Integer id;//自动增长id
    private Integer lv;//用户权限
    private String email;//邮箱
    private String userName;//昵称
    private String password;//密码
    private Date signDay;//签到日期
    private Integer countDay;//签到天数
    private Integer userLv;//用户等级
    private String  userImg;//用户头像
   private  Boolean eduAccount;//是否绑定教务管理系统账号

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", lv=" + lv +
                ", email='" + email + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", signDay=" + signDay +
                ", countDay=" + countDay +
                ", userLv=" + userLv +
                ", userImg='" + userImg + '\'' +
                ", eduAccount=" + eduAccount +
                '}';
    }

    public Boolean getEduAccount() {
        return eduAccount;
    }

    public void setEduAccount(Boolean eduAccount) {
        this.eduAccount = eduAccount;
    }

    public Date getSignDay() {
        return signDay;
    }

    public void setSignDay(Date signDay) {
        this.signDay = signDay;
    }

    public Integer getUserLv() {
        return userLv;
    }

    public void setUserLv(Integer userLv) {
        this.userLv = userLv;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public Integer getLv() {
        return lv;
    }
    public void setLv(Integer lv) {
        this.lv = lv;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }


    public Integer getCountDay() {
        return countDay;
    }

    public void setCountDay(Integer countDay) {
        this.countDay = countDay;
    }

}