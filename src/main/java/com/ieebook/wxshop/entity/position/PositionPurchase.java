package com.ieebook.wxshop.entity.position;

import com.ieebook.wxshop.entity.BaseEntity;

public class PositionPurchase extends BaseEntity {
    private int id;
    private int mid;
    private int quantity;
    private int state;
    private String description;

    public PositionPurchase() {
    }

    public PositionPurchase(int id, int mid, int quantity, int state, String description, Integer cby, String cdate, Integer uby, String udate) {
        super(cby, cdate, uby, udate);
        this.id = id;
        this.mid = mid;
        this.quantity = quantity;
        this.state = state;
        this.description = description;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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
