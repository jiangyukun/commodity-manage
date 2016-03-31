package com.ieebook.wxshop.weixin.dto.jssdk;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.ieebook.wxshop.weixin.dto.common.GenericJsonResult;

/**
 * jiangyukun on 2015-11-23 16:07
 */
public class JsApiTicketDto extends GenericJsonResult {
    private String ticket;
    @JsonProperty("expires_in")
    private String expiresIn;

    public String getTicket() {
        return ticket;
    }

    public void setTicket(String ticket) {
        this.ticket = ticket;
    }

    public String getExpiresIn() {
        return expiresIn;
    }

    public void setExpiresIn(String expiresIn) {
        this.expiresIn = expiresIn;
    }
}
