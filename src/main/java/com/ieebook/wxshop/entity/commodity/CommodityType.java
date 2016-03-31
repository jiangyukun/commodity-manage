package com.ieebook.wxshop.entity.commodity;

import com.ieebook.wxshop.entity.BaseEntity;

public class CommodityType extends BaseEntity {
    private Integer id;
    private Integer mid;
    private Integer pid;
    private Integer is_default;
    private Integer state;
    private Integer weight;
    private String name;
    private String description;

    public CommodityType() {
    }

    public CommodityType(Integer merchantId, String name) {
        this(merchantId, 0, 0, 0, name, "", merchantId, "", merchantId, "", 1);
    }

    public CommodityType(Integer mid, Integer pid, Integer state, Integer weight, String name, String description, Integer cby, String cdate, Integer uby, String udate, Integer is_default) {
        super(cby, cdate, uby, udate);
        this.mid = mid;
        this.pid = pid;
        this.state = state;
        this.weight = weight;
        this.name = name;
        this.description = description;
        this.is_default = is_default;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public Integer getIs_default() {
        return is_default;
    }

    public void setIs_default(Integer is_default) {
        this.is_default = is_default;
    }
}
