package com.ieebook.wxshop.entity.position;

import com.ieebook.wxshop.entity.BaseEntity;

public class ServeDistrict extends BaseEntity {
    private int id;
    private int mid;
    private int pid;
    private int cid;
    private int tid;
    private String addr;
    private int state;
    private int type;

    public ServeDistrict() {
    }

    public ServeDistrict(int id, int mid, int pid, int cid, int tid, String addr, int state, int type, Integer cby, String cdate, Integer uby, String udate) {
        super(cby, cdate, uby, udate);
        this.id = id;
        this.mid = mid;
        this.pid = pid;
        this.cid = cid;
        this.tid = tid;
        this.addr = addr;
        this.state = state;
        this.type = type;
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

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }


}
