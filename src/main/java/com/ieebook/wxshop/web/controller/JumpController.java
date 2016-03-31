package com.ieebook.wxshop.web.controller;

import com.ieebook.wxshop.core.AppConfig;
import com.ieebook.wxshop.core.Phase;
import com.ieebook.wxshop.entity.merchant.Merchant;
import com.ieebook.wxshop.service.merchant.MerchantService;
import com.ieebook.wxshop.web.support.BaseController;
import com.ieebook.wxshop.weixin.WeixinAPI;
import com.ieebook.wxshop.weixin.dto.user.UserBaseInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * jiangyukun on 2015/11/22.
 */
@Controller
@RequestMapping("/jump")
@SessionAttributes({"openId", "merchantId"})
public class JumpController extends BaseController {
    @Autowired
    private WeixinAPI weixinAPI;

    @Autowired
    private MerchantService merchantService;

    @RequestMapping("/{url}")
    public String toUrl(String code, @PathVariable("url") String url, ModelMap modelMap) throws Exception {
        logger.info(code);
        String openId;
        if (AppConfig.CURRENT_PHASE == Phase.DEV) {
            openId = "dev";
        } else {
            UserBaseInfo userBaseInfo = weixinAPI.getOpenId(code);
            openId = userBaseInfo.getOpenId();
            if (!StringUtils.hasLength(openId)) {
                throw new Exception("can't get open_id");
            }
        }
        modelMap.put("openId", openId);
        Merchant merchant = merchantService.getMerchantByOperid(openId);
        if (merchant == null) {
            return "redirect:/account/register";
        }
        url = url.replace("--", "/");
        if (url.equals("/account/register")) {
            throw new Exception("您已经注册了!");
        }
        modelMap.put("merchantId", merchant.getId());
        return "redirect:/" + url;
    }
}
