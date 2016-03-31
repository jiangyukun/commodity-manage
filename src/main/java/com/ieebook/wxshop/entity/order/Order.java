package com.ieebook.wxshop.entity.order;

import com.ieebook.wxshop.entity.BaseEntity;

public class Order extends BaseEntity {
    private String id;
    private int uid;
    private int mid;
    private double tprice;
    private String addr;
    private String payQrcode;
    private String newAddr;
    private String contactPhone;
    private int payType;
    private int state;
    private String description;

    public Order(String id, int uid, int mid, double tprice, String addr,
                 String pay_qrcode, String new_addr, String contact_phone,
                 int pay_type, int state, String description, Integer cby, String cdate, Integer uby, String udate) {
        super(cby, cdate, uby, udate);
        this.setId(id);
        this.setUid(uid);
        this.setMid(mid);
        this.setTprice(tprice);
        this.setAddr(addr);
        this.setPayQrcode(pay_qrcode);
        this.setNewAddr(new_addr);
        this.setContactPhone(contact_phone);
        this.setPayType(pay_type);
        this.setState(state);
        this.setDescription(description);

    }

    public Order() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public double getTprice() {
        return tprice;
    }

    public void setTprice(double tprice) {
        this.tprice = tprice;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getPayQrcode() {
        return payQrcode;
    }

    public void setPayQrcode(String payQrcode) {
        this.payQrcode = payQrcode;
    }

    public String getNewAddr() {
        return newAddr;
    }

    public void setNewAddr(String newAddr) {
        this.newAddr = newAddr;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public int getPayType() {
        return payType;
    }

    public void setPayType(int payType) {
        this.payType = payType;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}
