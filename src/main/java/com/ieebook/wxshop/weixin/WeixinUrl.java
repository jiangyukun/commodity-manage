package com.ieebook.wxshop.weixin;

import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * jiangyukun on 2015-11-06 19:16
 */
public class WeixinUrl {
    private static Properties wxUrls = new Properties();

    static {
        ClassPathResource resource = new ClassPathResource("/weixin/weixin-url.properties");
        try {
            wxUrls.load(resource.getInputStream());

        } catch (IOException e) {
            //
        }
    }

    private Map<String, String> urlMap = new HashMap<>();

    WeixinUrl(String appId, String appSecret) {
        wxUrls.keySet().forEach(key -> {
            String k = (String) key;
            String url = wxUrls.getProperty(k);
            url = url.replace("${appId}", appId);
            url = url.replace("${appSecret}", appSecret);
            urlMap.put(k, url);
        });
    }

    public String getUrl(String key, String... param) {
        String url = urlMap.get(key);
        if (param != null) {
            for (int i = 0; i < param.length; i++) {
                url = url.replace("${" + i + "}", param[i]);
            }
        }
        return url;
    }
}
