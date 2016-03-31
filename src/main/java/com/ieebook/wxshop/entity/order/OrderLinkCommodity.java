package com.ieebook.wxshop.entity.order;

public class OrderLinkCommodity {
    private String oid;
    private int cid;
    private int amount;
    private String createdDate;
    private String updatedDate;

    public OrderLinkCommodity() {
    }

    public OrderLinkCommodity(String oid, int cid, int amount, String createDate, String updatedDate) {
        this.setOid(oid);
        this.setCid(cid);
        this.setAmount(amount);
        this.setCreatedDate(createDate);
        this.setUpdatedDate(updatedDate);
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }
}
