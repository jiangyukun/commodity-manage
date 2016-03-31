package com.ieebook.wxshop.entity.commodity;

import com.ieebook.wxshop.entity.BaseEntity;

public class CommodityTemp extends BaseEntity {
    private Integer mid;
    private Integer cid;
    private String uid;
    private Integer amount;

    public CommodityTemp() {
        super();
    }

    public CommodityTemp(Integer mid, Integer cid, String uid, Integer amount, Integer cby, String cdate, Integer uby, String udate) {
        super(cby, cdate, uby, udate);
        this.mid = mid;
        this.cid = cid;
        this.uid = uid;
        this.amount = amount;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }
}
