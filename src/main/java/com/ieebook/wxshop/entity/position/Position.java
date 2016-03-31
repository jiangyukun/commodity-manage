package com.ieebook.wxshop.entity.position;

import com.ieebook.wxshop.entity.BaseEntity;

public class Position extends BaseEntity {
    private int id;
    private int district_id;
    private String addr;
    private int state;
    private String service;
    private String qrcode;

    public Position() {

    }

    public Position(int id, int district_id, String addr, int state, String service, String qrcode, Integer cby, String cdate, Integer uby, String udate) {
        super(cby, cdate, uby, udate);
        this.id = id;
        this.district_id = district_id;
        this.addr = addr;
        this.state = state;
        this.service = service;
        this.qrcode = qrcode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDistrict_id() {
        return district_id;
    }

    public void setDistrict_id(int district_id) {
        this.district_id = district_id;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String getQrcode() {
        return qrcode;
    }

    public void setQrcode(String qrcode) {
        this.qrcode = qrcode;
    }

}
