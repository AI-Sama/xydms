package com.pojo;

public class Suggest {
    private Integer id;//id
    private String userName;//建议人
    private String suggestText;//建议内容
    @Override
    public String toString() {
        return "Suggest{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", suggestText='" + suggestText + '\'' +
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

    public String getSuggestText() {
        return suggestText;
    }

    public void setSuggestText(String suggestText) {
        this.suggestText = suggestText;
    }
}
