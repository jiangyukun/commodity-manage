package com.ieebook.wxshop.web.controller.weixin;

import com.ieebook.wxshop.business.WeixinBus;
import com.ieebook.wxshop.dto.JsonResponse;
import com.ieebook.wxshop.weixin.dto.jssdk.JsSdkConfigDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * jiangyukun on 2015-11-23 15:59
 */
@Controller
@RequestMapping("/weixin")
public class JsSdkController {
    @Autowired
    private WeixinBus weixinBus;

    @RequestMapping("/jssdk")
    @ResponseBody
    public JsonResponse<JsSdkConfigDto> jsSdkConfig(String url) {
        Assert.hasText(url);
        if (url.contains("#")) {
            url = url.substring(0, url.indexOf("#"));
        }
        return new JsonResponse<>(weixinBus.jsSdkConfig(url));
    }
}
