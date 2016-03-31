package com.ieebook.wxshop.web.controller.weixin;

import com.ieebook.wxshop.dto.JsonResponse;
import com.ieebook.wxshop.weixin.WeixinAPI;
import com.ieebook.wxshop.weixin.dto.common.GenericJsonResult;
import com.ieebook.wxshop.weixin.dto.receive.menu.MenuDtoBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * jiangyukun on 2015-11-21 20:33.
 */
@RequestMapping("/weixin")
@RestController
public class MenuController {

    @Autowired
    private WeixinAPI weixinAPI;


    @RequestMapping("/refreshMenu")
    public JsonResponse<GenericJsonResult> refreshMenu() throws Exception {
        return new JsonResponse<>(weixinAPI.createMenu(MenuDtoBuilder.build(weixinAPI.getAppId())));
    }
}
