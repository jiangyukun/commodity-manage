package com.ieebook.wxshop.weixin.dto.order;

import com.ieebook.wxshop.entity.commodity.Commodity;

public class OrderInfo {
    private Commodity commodity;
    private int amount;

    public OrderInfo() {

    }

    public OrderInfo(Commodity commodity, int amount) {
        this.commodity = commodity;
        this.amount = amount;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
