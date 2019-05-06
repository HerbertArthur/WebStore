package com.webstore.utils;


public class KmeansUser {
    private Long userId;

    private String userName;

    @KmeansField
    private Double sex;

    @KmeansField
    private Double age;

    @KmeansField
    private Double buyNum;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Double getSex() {
        return sex;
    }

    public void setSex(Double sex) {
        this.sex = sex;
    }

    public Double getAge() {
        return age;
    }

    public void setAge(Double age) {
        this.age = age;
    }

    public Double getBuyNum() {
        return buyNum;
    }

    public void setBuyNum(Double buyNum) {
        this.buyNum = buyNum;
    }
}
