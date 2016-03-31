package com.ieebook.wxshop.web.controller.merchant;

import com.ieebook.wxshop.business.MerchantBus;
import com.ieebook.wxshop.dto.JsonResponse;
import com.ieebook.wxshop.entity.merchant.Merchant;
import com.ieebook.wxshop.entity.merchant.MerchantInfo;
import com.ieebook.wxshop.service.merchant.MerchantInfoService;
import com.ieebook.wxshop.service.merchant.MerchantService;
import com.ieebook.wxshop.web.support.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

/**
 * jiangyukun on 2015/11/11.
 */
@Controller
@RequestMapping("/merchant")
@SessionAttributes("merchantId")
public class MerchantController extends BaseController {
    @Autowired
    private MerchantBus merchantBus;
    @Autowired
    private MerchantInfoService merchantInfoService;
    @Autowired
    private MerchantService merchantService;

    /**
     * 商户详细信息
     */
    @RequestMapping(value = "/detailInfo", method = RequestMethod.GET)
    public String categoryList(@ModelAttribute("merchantId") int merchantId, ModelMap modelMap) {
        MerchantInfo merchantInfo = merchantInfoService.getMerchantInfoByMid(merchantId);
        modelMap.put("merchantInfo", merchantInfo);
        return "/merchant/detailInfo";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResponse<Object> delete(@ModelAttribute("merchantId") int merchantId) {
        Merchant merchant = merchantService.getMerchant(merchantId);
        merchantService.updateOpenIdbyAccount(merchant.getAccount(), "");
        return new JsonResponse<>();
    }
}
