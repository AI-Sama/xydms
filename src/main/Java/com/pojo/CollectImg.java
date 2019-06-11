package com.pojo;

public class CollectImg {
    private Integer id;//id
    private String userName;//收藏人
    private String addr;//收藏图片

    @Override
    public String toString() {
        return "CollectImg{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", addr='" + addr + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }
}
