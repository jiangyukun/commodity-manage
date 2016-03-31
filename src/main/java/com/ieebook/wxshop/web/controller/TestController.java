package com.ieebook.wxshop.web.controller;

import com.ieebook.wxshop.business.CommodityBus;
import com.ieebook.wxshop.core.exception.WeixinException;
import com.ieebook.wxshop.dto.JsonResponse;
import com.ieebook.wxshop.entity.place.City;
import com.ieebook.wxshop.entity.place.Province;
import com.ieebook.wxshop.entity.place.Town;
import com.ieebook.wxshop.service.commodity.CommodityTypeService;
import com.ieebook.wxshop.service.place.PlaceService;
import com.ieebook.wxshop.test.TestConfig;
import com.ieebook.wxshop.web.support.BaseController;
import com.ieebook.wxshop.weixin.WeixinAPI;
import com.ieebook.wxshop.weixin.dto.AccessTokenDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

/**
 * jiangyukun on 2015-11-05 15:02
 */
@Controller
@RequestMapping("/test")
@SessionAttributes({"merchantId"})
public class TestController extends BaseController {
    @Autowired
    private WeixinAPI wxApi;

    @Autowired
    private CommodityBus commodityBus;
    @Autowired
    private CommodityTypeService commodityTypeService;
    @Autowired
    private PlaceService placeService;

    @RequestMapping({"/", ""})
    public String test() throws WeixinException {
        logger.info("test");

        AccessTokenDto dto = wxApi.getAccessToken();
        return "test";
    }

    @RequestMapping("/mybatis")
    public String mybatis(ModelMap modelMap) {
        List<Province> list = placeService.getAllprovince();
        modelMap.put("provinceList", list);
        return "/position/positionManage";
    }

    @RequestMapping(value = "/mybatis/city", method = RequestMethod.POST)
    @ResponseBody
    public JsonResponse<List<City>> city(String provinceid) {
        List<City> list = placeService.getAllCityByProvince(provinceid);
        JsonResponse<List<City>> jsonresponse = new JsonResponse<List<City>>();
        jsonresponse.setCode(1);
        jsonresponse.setData(list);
        jsonresponse.setMessage("success");
        return jsonresponse;
    }

    @RequestMapping(value = "/mybatis/town", method = RequestMethod.POST)
    @ResponseBody
    public JsonResponse<List<Town>> town(int cityid) {
        List<Town> list = placeService.getAllTownByCityId(cityid);
        JsonResponse<List<Town>> jsonresponse = new JsonResponse<List<Town>>();
        jsonresponse.setCode(1);
        jsonresponse.setData(list);
        jsonresponse.setMessage("success");
        return jsonresponse;
    }

    @RequestMapping("/setMerchantId")
    @ResponseBody
    public JsonResponse<String> setMerchantId(ModelMap modelMap) {
        String merchantId = TestConfig.testMerchantId;
        modelMap.put("merchantId", merchantId);
        return new JsonResponse<>("设置成功, merchantId: " + merchantId);
    }
    @RequestMapping("/calculator")
    public String calculator(ModelMap modelMap) {
        return "/calculator/calculator";
    }
}
