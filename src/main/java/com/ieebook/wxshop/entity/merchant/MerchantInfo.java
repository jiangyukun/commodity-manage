package com.ieebook.wxshop.entity.merchant;

import com.ieebook.wxshop.entity.BaseEntity;

public class MerchantInfo extends BaseEntity {
    private Integer mid;
    private String appid;
    private String phone;
    private String name;
    private String address;
    private String imgId;
    private int payType;

    public MerchantInfo() {
        super();
    }

    public MerchantInfo(Integer mid, String appid, String phone, String name, String address, String img, Integer cby, String cdate, Integer uby, String udate, int payType) {
        super(cby, cdate, uby, udate);
        this.mid = mid;
        this.appid = appid;
        this.phone = phone;
        this.name = name;
        this.address = address;
        this.imgId = img;
        this.payType = payType;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImgId() {
        return imgId;
    }

    public void setImgId(String imgId) {
        this.imgId = imgId;
    }

    public int getPayType() {
        return payType;
    }

    public void setPayType(int payType) {
        this.payType = payType;
    }
}
