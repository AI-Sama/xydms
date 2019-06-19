package com.pojo;

public class EduAccount {
    private  Integer id;//id
    private String bindUser;//绑定人
    private  String eduUserName;//教务管理系统账号
    private  String eduPassword;//教务管理系统密码

    @Override
    public String toString() {
        return "EduAccount{" +
                "id=" + id +
                ", bindUser='" + bindUser + '\'' +
                ", eduUserName='" + eduUserName + '\'' +
                ", eduPassword='" + eduPassword + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBindUser() {
        return bindUser;
    }

    public void setBindUser(String bindUser) {
        this.bindUser = bindUser;
    }

    public String getEduUserName() {
        return eduUserName;
    }

    public void setEduUserName(String eduUserName) {
        this.eduUserName = eduUserName;
    }

    public String getEduPassword() {
        return eduPassword;
    }

    public void setEduPassword(String eduPassword) {
        this.eduPassword = eduPassword;
    }
}
