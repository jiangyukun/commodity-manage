package com.ieebook.wxshop.entity.place;

public class Town {
    private int id;
    private String name;
    private int cityId;
    private int provinceId;
    private int sortId;

    public Town() {

    }

    public Town(int id, String name, int cityId, int provinceId, int sortId) {
        this.id = id;
        this.name = name;
        this.cityId = cityId;
        this.provinceId = provinceId;
        this.sortId = sortId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public int getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(int provinceId) {
        this.provinceId = provinceId;
    }

    public int getSortId() {
        return sortId;
    }

    public void setSortId(int sortId) {
        this.sortId = sortId;
    }
}
