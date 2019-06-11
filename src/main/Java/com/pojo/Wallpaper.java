package com.pojo;

import java.util.Date;

public class Wallpaper {
    private Integer id;//图片id
    private String imgMsg;//图片出处
    private String imgAddr;//图片存放地址
    private String upUser; //图片上传人
    private Integer clickNum;//图片点击率
    private Date upTime;//图片上传时间
    private Integer imgState;//图片审核状态

    @Override
    public String toString() {
        return "Wallpaper{" +
                "id=" + id +
                ", imgMsg='" + imgMsg + '\'' +
                ", imgAddr='" + imgAddr + '\'' +
                ", upUser='" + upUser + '\'' +
                ", clickNum=" + clickNum +
                ", upTime=" + upTime +
                ", imgState=" + imgState +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImgMsg() {
        return imgMsg;
    }

    public void setImgMsg(String imgMsg) {
        this.imgMsg = imgMsg;
    }

    public String getImgAddr() {
        return imgAddr;
    }

    public void setImgAddr(String imgAddr) {
        this.imgAddr = imgAddr;
    }

    public String getUpUser() {
        return upUser;
    }

    public void setUpUser(String upUser) {
        this.upUser = upUser;
    }

    public Integer getClickNum() {
        return clickNum;
    }

    public void setClickNum(Integer clickNum) {
        this.clickNum = clickNum;
    }

    public Date getUpTime() {
        return upTime;
    }

    public void setUpTime(Date upTime) {
        this.upTime = upTime;
    }

    public Integer getImgState() {
        return imgState;
    }

    public void setImgState(Integer imgState) {
        this.imgState = imgState;
    }
}