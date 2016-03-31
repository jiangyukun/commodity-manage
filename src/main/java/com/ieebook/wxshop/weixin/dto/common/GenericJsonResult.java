package com.ieebook.wxshop.weixin.dto.common;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * jiangyukun on 2015-11-06 23:03
 */
public class GenericJsonResult {

    @JsonProperty("errcode")
    protected String errCode;

    @JsonProperty("errmsg")
    protected String errMsg;

    public String getErrCode() {
        return errCode;
    }

    public void setErrCode(String errCode) {
        this.errCode = errCode;
    }

    public String getErrMsg() {
        return errMsg;
    }

    public void setErrMsg(String errMsg) {
        this.errMsg = errMsg;
    }
}
