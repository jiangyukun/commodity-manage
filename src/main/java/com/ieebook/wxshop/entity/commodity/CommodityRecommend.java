package com.ieebook.wxshop.entity.commodity;

import com.ieebook.wxshop.entity.BaseEntity;

public class CommodityRecommend extends BaseEntity {
    private int id;
    private int mid;
    private int cid;

    public CommodityRecommend() {

    }

    public CommodityRecommend(int mid, int cid, Integer cby, String cdate, Integer uby, String udate) {
        super(cby, cdate, uby, udate);
        this.mid = mid;
        this.cid = cid;
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

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
}
