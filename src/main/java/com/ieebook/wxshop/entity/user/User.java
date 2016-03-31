package com.ieebook.wxshop.entity.user;


public class User {
    private int id;
    private String openid;
    private String unionid;
    private int sex;
    private String city;
    private String phone;
    private String province;
    private String nickname;
    private String headimgurl;
    private String created_date;
    private String updated_date;

    public User() {

    }

    public User(String openid, String unionid, int sex, String city, String phone, String province, String nickname, String headimgurl, String created_date, String updated_date) {
        this.openid = openid;
        this.unionid = unionid;
        this.sex = sex;
        this.city = city;
        this.phone = phone;
        this.province = province;
        this.nickname = nickname;
        this.headimgurl = headimgurl;
        this.created_date = created_date;
        this.updated_date = updated_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getUnionid() {
        return unionid;
    }

    public void setUnionid(String unionid) {
        this.unionid = unionid;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getHeadimgurl() {
        return headimgurl;
    }

    public void setHeadimgurl(String headimgurl) {
        this.headimgurl = headimgurl;
    }

    public String getCreated_date() {
        return created_date;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    public String getUpdated_date() {
        return updated_date;
    }

    public void setUpdated_date(String updated_date) {
        this.updated_date = updated_date;
    }
}
