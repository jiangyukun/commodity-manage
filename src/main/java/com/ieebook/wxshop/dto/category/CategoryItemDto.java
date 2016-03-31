package com.ieebook.wxshop.dto.category;

/**
 * jiangyukun on 2015-12-03 18:04
 */
public class CategoryItemDto {
    private Integer id;
    private String name;
    private Integer weight;
    private Integer commodityCount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public Integer getCommodityCount() {
        return commodityCount;
    }

    public void setCommodityCount(Integer commodityCount) {
        this.commodityCount = commodityCount;
    }
}
