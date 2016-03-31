package com.ieebook.wxshop.dto.commodity;

import java.util.List;

/**
 * jiangyukun on 2015-11-24 15:02
 */
public class CommodityTypeDto {
    private Integer id;
    private String name;

    private boolean includeCommodity;
    private List<CommodityDto> commodityDto;

    public CommodityTypeDto() {
    }

    public CommodityTypeDto(Integer id, String name) {
        this.setId(id);
        this.setName(name);
    }

    public CommodityTypeDto(Integer id, String name, List<CommodityDto> commodityDtoList) {
        this.setId(id);
        this.setName(name);
        this.setIncludeCommodity(true);
        this.setCommodityDto(commodityDtoList);
    }

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

    public boolean isIncludeCommodity() {
        return includeCommodity;
    }

    public void setIncludeCommodity(boolean includeCommodity) {
        this.includeCommodity = includeCommodity;
    }

    public List<CommodityDto> getCommodityDto() {
        return commodityDto;
    }

    public void setCommodityDto(List<CommodityDto> commodityDto) {
        this.setIncludeCommodity(true);
        this.commodityDto = commodityDto;
    }
}
