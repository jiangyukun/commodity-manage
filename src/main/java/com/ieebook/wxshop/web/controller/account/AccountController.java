package com.ieebook.wxshop.web.controller.account;

import com.ieebook.wxshop.business.MerchantBus;
import com.ieebook.wxshop.core.SystemConfig;
import com.ieebook.wxshop.core.util.SmsUtils;
import com.ieebook.wxshop.core.util.StringUtils;
import com.ieebook.wxshop.dto.JsonResponse;
import com.ieebook.wxshop.dto.merchant.MerchantRegisterDto;
import com.ieebook.wxshop.entity.merchant.Merchant;
import com.ieebook.wxshop.service.merchant.MerchantService;
import com.ieebook.wxshop.web.support.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

/**
 * jiangyukun on 2015-11-09 11:32
 */
@Controller
@RequestMapping("/account")
@SessionAttributes({"openId", "merchantId", "code"})
public class AccountController extends BaseController {
    @Autowired
    private MerchantService merchantService;
    @Autowired
    private MerchantBus merchantBus;

    /**
     * 商户注册页面
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() throws Exception {
        return "/account/register";
    }

    @RequestMapping("/saveMerchantInfo")
    @ResponseBody
    public JsonResponse<Object> saveMerchantInfo(@ModelAttribute("openId") String openId, @ModelAttribute("code") String code,
                                                 @RequestBody MerchantRegisterDto merchantRegisterDto) {
        JsonResponse<Object> jsonResponse = new JsonResponse<>();
        if (!code.equals(merchantRegisterDto.getCode())) {
            return jsonResponse.error("验证码错误!");
        }
        Merchant merchant = merchantService.getMerchantByAccount(merchantRegisterDto.getMobile());
        if (merchant == null) {
            return jsonResponse.error("没有您的注册信息!");
        }
        if (!merchantRegisterDto.getPassword().equals(merchant.getPassword())) {
            return jsonResponse.error("密码错误!");
        }
        merchantService.updateOpenIdbyAccount(merchantRegisterDto.getMobile(), openId);
        return jsonResponse;
    }

    @RequestMapping("/sendCode")
    @ResponseBody
    public JsonResponse<Object> sendCode(String mobile, ModelMap modelMap) throws Exception {
        if (!merchantBus.existMobile(mobile)) {
            return new JsonResponse<>().error("没有您的手机号信息!");
        }
        try {
            String code = StringUtils.randomNumber(4);
            SmsUtils.sendSmsCheckCode(SystemConfig.get("sms.id"), SystemConfig.get("sms.key"), mobile, code);
            modelMap.put("code", code);
            return new JsonResponse<>();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return new JsonResponse<>().error();
        }
    }

    @RequestMapping("/checkCode")
    @ResponseBody
    public JsonResponse<Object> checkCode(@ModelAttribute("code") String code, String clientCode) {
        if (code.equals(clientCode)) {
            return new JsonResponse<>();
        }
        return new JsonResponse<>().error();
    }
}
