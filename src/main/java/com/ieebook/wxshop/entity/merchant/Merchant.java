package com.ieebook.wxshop.entity.merchant;

import com.ieebook.wxshop.entity.BaseEntity;

public class Merchant extends BaseEntity {
    private Integer id;
    private String openid;
    private String account;
    private String password;

    public Merchant() {
        super();
    }

    public Merchant(String openid, String account, String password, Integer cby, String cdate, Integer uby, String udate) {
        super(cby, cdate, uby, udate);
        this.openid = openid;
        this.account = account;
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }
}
