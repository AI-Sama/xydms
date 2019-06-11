package com.pojo;

public class Anima {
    private Integer id;//番剧id
    private String weekDay;//番剧更新日期
    private String animaName;//番剧名称
    private String animaAddr;//番剧地址

    @Override
    public String toString() {
        return "Anima{" +
                "id=" + id +
                ", weekDay='" + weekDay + '\'' +
                ", animaName='" + animaName + '\'' +
                ", animaAddr='" + animaAddr + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getWeekDay() {
        return weekDay;
    }
    public void setWeekDay(String weekDay) {
        this.weekDay = weekDay;
    }
    public String getAnimaName() {
        return animaName;
    }
    public void setAnimaName(String animaName) {
        this.animaName = animaName;
    }
    public String getAnimaAddr() {
        return animaAddr;
    }
    public void setAnimaAddr(String animaAddr) {
        this.animaAddr = animaAddr;
    }
}