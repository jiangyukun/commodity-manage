package com.ieebook.wxshop.weixin;

/**
 * jiangyukun on 2015-11-06 19:54
 */
public class WeiAPIFactory {
    public static WeixinAPI getWeixinAPI(String appId, String appSecret) {
        return new WeixinAPI(appId, appSecret);
    }
}
