package com.ieebook.wxshop.weixin.dto.receive.menu;

import com.ieebook.wxshop.core.util.WeixinUtils;
import com.ieebook.wxshop.weixin.WeixinConstants;

import java.net.URLEncoder;
import java.util.Arrays;

/**
 * jiangyukun on 2015-11-06 23:29
 */
public class MenuDtoBuilder {
    public static MenuDto build(String appId) throws Exception {
        String baseUrl = "http://projectx.ieebook.cn/wxshop/jump";
        String commodityManageUrl = URLEncoder.encode(baseUrl + "/commodity--manage", "utf-8");
        String orderManageUrl = URLEncoder.encode(baseUrl + "/customer--order", "utf-8");
        String merchantCenterUrl = URLEncoder.encode(baseUrl + "/account--register", "utf-8");
        String regionManageUrl = URLEncoder.encode(baseUrl + "/position--manage", "utf-8");
        String merchantDetailUrl = URLEncoder.encode(baseUrl + "/merchant--detailInfo", "utf-8");

        Button button1 = ButtonBuilder.builder(Button.BUTTON_TYPE_VIEW, "商品管理", getUrl(appId, commodityManageUrl));
        Button button2 = ButtonBuilder.builder(Button.BUTTON_TYPE_VIEW, "订单管理", getUrl(appId, orderManageUrl));
        Button button3 = ButtonBuilder.builder(Button.BUTTON_TYPE_VIEW, "商家中心", getUrl(appId, merchantCenterUrl));

        Button button3_1 = ButtonBuilder.builder(Button.BUTTON_TYPE_VIEW, "区域管理", getUrl(appId, regionManageUrl));
        Button button3_2 = ButtonBuilder.builder(Button.BUTTON_TYPE_VIEW, "商家详情", getUrl(appId, merchantDetailUrl));
        button3.setSubButtons(Arrays.asList(button3_1, button3_2));

        MenuDto menuDto = new MenuDto();
        menuDto.setButton(Arrays.asList(button1, button2, button3));
        return menuDto;
    }

    private static String getUrl(String appId, String url) throws Exception {
        return WeixinUtils.getViewMenuUrl(appId, url, WeixinConstants.WebPageType.BASE);

    }
}
