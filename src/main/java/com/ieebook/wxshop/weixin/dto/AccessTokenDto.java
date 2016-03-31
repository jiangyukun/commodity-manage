package com.ieebook.wxshop.weixin.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.ieebook.wxshop.weixin.dto.common.GenericJsonResult;

/**
 * jiangyukun on 2015-11-06 20:30
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class AccessTokenDto extends GenericJsonResult {
    @JsonProperty("access_token")
    private String accessToken;

    @JsonProperty("expires_in")
    private String expiresIn;

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public String getExpiresIn() {
        return expiresIn;
    }

    public void setExpiresIn(String expiresIn) {
        this.expiresIn = expiresIn;
    }


    @Override
    public String toString() {
        return "accessToken:" + accessToken + "\nexpiresIn: " + expiresIn +
                "\nerrCode " + errCode + "\nerrMsg: " + errMsg;
    }
}
