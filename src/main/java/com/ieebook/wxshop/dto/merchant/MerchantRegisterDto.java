package com.ieebook.wxshop.dto.merchant;

/**
 * jiangyukun on 15-11-22.
 */
public class MerchantRegisterDto {
    private String mobile;
    private String password;
    private String code; // 验证码

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
