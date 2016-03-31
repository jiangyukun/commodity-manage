package com.ieebook.wxshop.entity.place;

public class City {
    private long id;
    private String name;
    private String province_id;
    private String sn;
    private String agency_fees;

    public City() {

    }

    public City(long id, String name, String province_id, String sn, String agency_fees) {
        this.id = id;
        this.name = name;
        this.province_id = province_id;
        this.sn = sn;
        this.agency_fees = agency_fees;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProvince_id() {
        return province_id;
    }

    public void setProvince_id(String province_id) {
        this.province_id = province_id;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getAgency_fees() {
        return agency_fees;
    }

    public void setAgency_fees(String agency_fees) {
        this.agency_fees = agency_fees;
    }


}
