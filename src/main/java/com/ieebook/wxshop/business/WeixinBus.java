package com.ieebook.wxshop.business;

import com.ieebook.wxshop.business.support.BaseBus;
import com.ieebook.wxshop.weixin.WeixinAPI;
import com.ieebook.wxshop.weixin.dto.jssdk.JsApiTicketDto;
import com.ieebook.wxshop.weixin.dto.jssdk.JsSdkConfigDto;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.TreeMap;
import java.util.UUID;

/**
 * jiangyukun on 2015-11-23 16:26
 */
@Service
public class WeixinBus extends BaseBus {

    @Autowired
    private WeixinAPI weixinAPI;

    public JsSdkConfigDto jsSdkConfig(String url) {
        String nonceStr = UUID.randomUUID().toString();
        String timestamp = String.valueOf(System.currentTimeMillis() / 1000);
        JsApiTicketDto dto = weixinAPI.getTicket();
        JsSdkConfigDto configDto = new JsSdkConfigDto();
        configDto.setAppId(weixinAPI.getAppId());
        configDto.setTimestamp(timestamp);
        configDto.setNonceStr(nonceStr);
        configDto.setSignature(getSignature(timestamp, nonceStr, url, dto.getTicket()));
        return configDto;
    }

    private String getSignature(String timestamp, String nonce, String url, String ticket) {
        Map<String, String> sortedKeyValue = new TreeMap<>();
        sortedKeyValue.put("timestamp", timestamp);
        sortedKeyValue.put("noncestr", nonce);
        sortedKeyValue.put("url", url);
        sortedKeyValue.put("jsapi_ticket", ticket);
        StringBuilder sb = new StringBuilder();
//        Logger log = logger;
        sortedKeyValue.forEach((key, value) -> {
//            logger.debug(key + " : " + value);
            sb.append("&").append(key).append("=").append(value);
        });
        String toSHA1Str = sb.toString().substring(1);
        logger.trace(toSHA1Str);
        return DigestUtils.sha1Hex(toSHA1Str);
    }
}
