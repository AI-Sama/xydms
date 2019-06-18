package com.pojo;

import java.util.Date;

public class Resource {
    private Integer id;
    private String srcTitle;//资源标题
    private String srcText;//资源内容
    private String upUser;//上传人
    private Integer lookNum;//查看次数
    private Date  upTime;//上传时间
    private Integer srcState;//审核状态
    private String srcDownload;//下载链接
    private String srcImg01;//图一
    private String srcImg02;//图二
    private String srcImg03;//图三

    @Override
    public String toString() {
        return "Resource{" +
                "id=" + id +
                ", srcTitle='" + srcTitle + '\'' +
                ", srcText='" + srcText + '\'' +
                ", upUser='" + upUser + '\'' +
                ", lookNum=" + lookNum +
                ", upTime=" + upTime +
                ", srcState=" + srcState +
                ", srcDownload='" + srcDownload + '\'' +
                ", srcImg01='" + srcImg01 + '\'' +
                ", srcImg02='" + srcImg02 + '\'' +
                ", srcImg03='" + srcImg03 + '\'' +
                '}';
    }

    public String getSrcDownload() {
        return srcDownload;
    }

    public void setSrcDownload(String srcDownload) {
        this.srcDownload = srcDownload;
    }

    public Integer getSrcState() {
        return srcState;
    }

    public void setSrcState(Integer srcState) {
        this.srcState = srcState;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSrcTitle() {
        return srcTitle;
    }

    public void setSrcTitle(String srcTitle) {
        this.srcTitle = srcTitle;
    }

    public String getSrcText() {
        return srcText;
    }

    public void setSrcText(String srcText) {
        this.srcText = srcText;
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

    public Date getUpTime() {
        return upTime;
    }

    public void setUpTime(Date upTime) {
        this.upTime = upTime;
    }

    public String getSrcImg01() {
        return srcImg01;
    }

    public void setSrcImg01(String srcImg01) {
        this.srcImg01 = srcImg01;
    }

    public String getSrcImg02() {
        return srcImg02;
    }

    public void setSrcImg02(String srcImg02) {
        this.srcImg02 = srcImg02;
    }

    public String getSrcImg03() {
        return srcImg03;
    }

    public void setSrcImg03(String srcImg03) {
        this.srcImg03 = srcImg03;
    }
}