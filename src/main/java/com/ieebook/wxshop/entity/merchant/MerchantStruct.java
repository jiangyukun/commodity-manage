package com.ieebook.wxshop.entity.merchant;

import com.ieebook.wxshop.entity.BaseEntity;

public class MerchantStruct extends BaseEntity {
    private int id;
    private int mid;
    private int parent;
    private String name;
    private String descrition;

    public MerchantStruct() {
        super();
    }

    public MerchantStruct(int id, int mid, int parent, String name, String descrition, Integer cby, String cdate, Integer uby, String udate) {
        super(cby, cdate, uby, udate);
        this.id = id;
        this.parent = parent;
        this.name = name;
        this.descrition = descrition;
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

    public int getParent() {
        return parent;
    }

    public void setParent(int parent) {
        this.parent = parent;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescrition() {
        return descrition;
    }

    public void setDescrition(String descrition) {
        this.descrition = descrition;
    }
}
