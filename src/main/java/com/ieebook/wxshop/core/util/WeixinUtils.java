package com.ieebook.wxshop.core.util;

/**
 * jiangyukun on 2015-11-22 18:46.
 */
public class WeixinUtils {


    public static String getViewMenuUrl(String appId, String redirectUrl, String type) throws Exception {
        StringBuilder sb = new StringBuilder();
        sb.append("https://open.weixin.qq.com/connect/oauth2/authorize?appid=");
        sb.append(appId);
        sb.append("&redirect_uri=");
        sb.append(redirectUrl);
        sb.append("&response_type=code");
        sb.append("&scope=");
        sb.append(type);
        sb.append("&state=STATE#wechat_redirect");
        return sb.toString();
    }
}
