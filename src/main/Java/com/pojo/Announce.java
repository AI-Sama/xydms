package com.pojo;

import java.util.Date;

public class Announce {
    private Integer id;
    private String annName;//公告名称
    private String annText;//公告内容
    private Date upTime;//上传时间
    private String upUser;//上传人
    private Integer lookNum;//查看数量
    private Boolean top;//是否置顶
    private String imgSrc;//公告主图

    @Override
    public String toString() {
        return "Announce{" +
                "id=" + id +
                ", annName='" + annName + '\'' +
                ", annText='" + annText + '\'' +
                ", upTime=" + upTime +
                ", upUser='" + upUser + '\'' +
                ", lookNum=" + lookNum +
                ", top=" + top +
                ", imgSrc='" + imgSrc + '\'' +
                '}';
    }

    public Boolean getTop() {
        return top;
    }

    public void setTop(Boolean top) {
        this.top = top;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAnnName() {
        return annName;
    }

    public void setAnnName(String annName) {
        this.annName = annName;
    }

    public String getAnnText() {
        return annText;
    }

    public void setAnnText(String annText) {
        this.annText = annText;
    }

    public Date getUpTime() {
        return upTime;
    }

    public void setUpTime(Date upTime) {
        this.upTime = upTime;
    }

    public String getUpUser() {
        return upUser;
    }

    public void setUpUser(String upUser) {
        this.upUser = upUser;
    }

    public Integer getLookNum() {
        return lookNum;
    }

    public void setLookNum(Integer lookNum) {
        this.lookNum = lookNum;
    }


    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }
}