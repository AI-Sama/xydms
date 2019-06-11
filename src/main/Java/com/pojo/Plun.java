package com.pojo;


import java.util.Date;

public class Plun {
    private  Integer id;
    private  String pText;
    private  Date pTime;
    private  Integer pUserId;
    private  Integer pXm;//评论项目
    private  Integer pWzId;//评论文章ID
    private  String pUserName;
    private  Integer status;

    @Override
    public String toString() {
        return "Plun{" +
                "id=" + id +
                ", pText='" + pText + '\'' +
                ", pTime=" + pTime +
                ", pUserId=" + pUserId +
                ", pXm=" + pXm +
                ", pWzId=" + pWzId +
                ", pUserName='" + pUserName + '\'' +
                ", status=" + status +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getpText() {
        return pText;
    }

    public void setpText(String pText) {
        this.pText = pText;
    }

    public Date getpTime() {
        return pTime;
    }

    public void setpTime(Date pTime) {
        this.pTime = pTime;
    }

    public Integer getpUserId() {
        return pUserId;
    }

    public void setpUserId(Integer pUserId) {
        this.pUserId = pUserId;
    }

    public Integer getpXm() {
        return pXm;
    }

    public void setpXm(Integer pXm) {
        this.pXm = pXm;
    }

    public Integer getpWzId() {
        return pWzId;
    }

    public void setpWzId(Integer pWzId) {
        this.pWzId = pWzId;
    }

    public String getpUserName() {
        return pUserName;
    }

    public void setpUserName(String pUserName) {
        this.pUserName = pUserName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
