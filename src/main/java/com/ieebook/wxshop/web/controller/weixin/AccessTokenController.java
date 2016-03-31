package com.ieebook.wxshop.web.controller.weixin;

import com.ieebook.wxshop.dto.JsonResponse;
import com.ieebook.wxshop.weixin.WeixinAPI;
import com.ieebook.wxshop.weixin.dto.AccessTokenDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * jiangyukun on 2015-11-21 16:52.
 */
@RequestMapping("/weixin")
@RestController
public class AccessTokenController {

    @Autowired
    private WeixinAPI weixinAPI;

    @RequestMapping("getAccessToken")
    public JsonResponse<AccessTokenDto> getAccessToken() {
        return new JsonResponse<>(weixinAPI.getAccessToken());
    }
}
