package com.ieebook.wxshop.weixin.dto.position;

import com.ieebook.wxshop.entity.position.ServeDistrict;


public class PositionPage {
    private int id;
    private int mid;
    private int pid;
    private int cid;
    private int tid;
    private String addr;
    private int state;
    private String province;
    private String city;
    private String town;

    public PositionPage() {

    }

    public PositionPage(ServeDistrict serve_district, String province, String city, String town) {
        this.id = serve_district.getId();
        this.pid = serve_district.getPid();
        this.cid = serve_district.getCid();
        this.tid = serve_district.getTid();
        this.addr = serve_district.getAddr();
        this.state = serve_district.getState();
        this.province = province;
        this.city = city;
        this.town = town;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
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
}
