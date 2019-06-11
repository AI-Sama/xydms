package com.pojo;

public class Robot {
    private Integer reqType;
    private  InputText perception;
    private  UserInfo userInfo;

    @Override
    public String toString() {
        return "Robot{" +
                "reqType=" + reqType +
                ", perception=" + perception +
                ", userInfo=" + userInfo +
                '}';
    }

    public Integer getReqType() {
        return reqType;
    }

    public void setReqType(Integer reqType) {
        this.reqType = reqType;
    }

    public InputText getPerception() {
        return perception;
    }

    public void setPerception(InputText perception) {
        this.perception = perception;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }
}
