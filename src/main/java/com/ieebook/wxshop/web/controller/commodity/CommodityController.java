package com.ieebook.wxshop.web.controller.commodity;

import com.ieebook.wxshop.business.CommodityBus;
import com.ieebook.wxshop.business.CommodityTypeBus;
import com.ieebook.wxshop.dto.JsonResponse;
import com.ieebook.wxshop.dto.commodity.CommodityDto;
import com.ieebook.wxshop.dto.commodity.CommodityTypeDto;
import com.ieebook.wxshop.web.support.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * jiangyukun on 2015/11/15.
 */
@Controller
@RequestMapping("/commodity")
@SessionAttributes({"merchantId"})
public class CommodityController extends BaseController {
    @Autowired
    private CommodityTypeBus commodityTypeBus;
    @Autowired
    private CommodityBus commodityBus;

    @RequestMapping("/manage")
    public String manage() {
        return "/commodity/commodityManage";
    }

    @RequestMapping(value = "/addCommodity", method = RequestMethod.GET)
    public String addCommodity() {
        return "/commodity/addCommodity";
    }

    /**
     * 获取商品信息
     */
    @RequestMapping(value = "/{commodityId}", method = RequestMethod.GET)
    @ResponseBody
    public JsonResponse<CommodityDto> get(@PathVariable("commodityId") int commodityId) {
        return new JsonResponse<>(commodityBus.getCommodityDetail(commodityId));
    }

    /**
     * 删除商品
     */
    @RequestMapping(value = "/{commodityId}", method = RequestMethod.DELETE)
    @ResponseBody
    public JsonResponse<String> delete(@PathVariable("commodityId") int commodityId) {
        commodityBus.delete(commodityId);
        return new JsonResponse<>();
    }

    @RequestMapping(value = "/{commodityId}", method = RequestMethod.PUT)
    @ResponseBody
    public JsonResponse<String> update(@PathVariable("commodityId") int commodityId, @RequestBody CommodityDto commodityDto) {
        commodityBus.updateCommodity(commodityDto);
        return new JsonResponse<>();
    }

    @RequestMapping(value = "/getCommodityCategoryInfo", method = RequestMethod.GET)
    @ResponseBody
    public JsonResponse<List<CommodityTypeDto>> getCommodityCategoryInfo(@ModelAttribute("merchantId") int merchantId, boolean includeCommodity) {
        if (includeCommodity) { // 分类中包括商品
            return new JsonResponse<>(commodityTypeBus.getCommodityTypeInfo(merchantId));
        }
        // 分类Id和分类名称
        return new JsonResponse<>(commodityTypeBus.getCommodityType(merchantId));
    }

    /**
     * 保存商品
     */
    @RequestMapping(value = {"", "/"}, method = RequestMethod.POST)
    @ResponseBody
    public JsonResponse<Object> saveCommodity(@RequestBody CommodityDto commodityDto, @ModelAttribute("merchantId") int merchantId) {
        commodityBus.createCommodity(commodityDto, merchantId);
        return new JsonResponse<>();
    }

    @RequestMapping("/search")
    @ResponseBody
    public JsonResponse<List<CommodityDto>> search(@ModelAttribute("merchantId") int merchantId, String searchName) {
        List<CommodityDto> commodityDtoList = commodityBus.search(merchantId, searchName);
        return new JsonResponse<>(commodityDtoList);
    }
}
