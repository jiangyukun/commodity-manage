package com.ieebook.wxshop.entity.place;

public class Province {
    private long id;
    private String name;
    private String sn;

    public Province() {

    }

    public Province(long id, String name, String sn) {
        this.id = id;
        this.name = name;
        this.sn = sn;
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

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

}
