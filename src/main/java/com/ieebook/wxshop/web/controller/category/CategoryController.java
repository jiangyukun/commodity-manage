package com.ieebook.wxshop.web.controller.category;

import com.ieebook.wxshop.business.CommodityBus;
import com.ieebook.wxshop.business.CommodityTypeBus;
import com.ieebook.wxshop.dto.JsonResponse;
import com.ieebook.wxshop.dto.category.CategoryItemDto;
import com.ieebook.wxshop.dto.category.CategorySelectDto;
import com.ieebook.wxshop.dto.commodity.CommodityDetailDto;
import com.ieebook.wxshop.dto.commodity.CommodityDto;
import com.ieebook.wxshop.dto.commodity.CommodityTypeDto;
import com.ieebook.wxshop.entity.commodity.Commodity;
import com.ieebook.wxshop.entity.commodity.CommodityType;
import com.ieebook.wxshop.service.commodity.CommodityService;
import com.ieebook.wxshop.service.commodity.CommodityTypeService;
import com.ieebook.wxshop.web.support.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 商户商品分类Controller
 * jiangyukun on 2015-11-09 19:37
 */
@Controller
@RequestMapping("/category")
@SessionAttributes({"merchantId"})
public class CategoryController extends BaseController {

    @Autowired
    private CommodityTypeService commodityTypeService;
    @Autowired
    private CommodityBus commodityBus;
    @Autowired
    private CommodityTypeBus commodityTypeBus;

    /**
     * 商户商品分类列表
     * 返回页面
     */
    @RequestMapping(value = "/categoryList", method = RequestMethod.GET)
    public String categoryList(@ModelAttribute("merchantId") int merchantId, ModelMap modelMap) {
        List<CommodityType> categoryList = commodityTypeService.getCommodityListBymId(merchantId);
        modelMap.put("merchantId", merchantId);
        modelMap.put("categoryList", categoryList);
        return "/category/categoryList";
    }

    /**
     * 获取分类的id、name、weight、商品数量
     */
    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    @ResponseBody
    public JsonResponse<List<CategoryItemDto>> list(@ModelAttribute("merchantId") int merchantId) {
        return new JsonResponse<>(commodityTypeBus.getCategoryList(merchantId));
    }

    /**
     * 获取分类的id和name
     */
    @RequestMapping(value = "/categorySelect", method = RequestMethod.GET)
    @ResponseBody
    public JsonResponse<List<CategorySelectDto>> getCategorySelect(@ModelAttribute("merchantId") int merchantId) {
        return new JsonResponse<>(commodityTypeBus.getCategorySelectList(merchantId));
    }

    /**
     * 添加分类
     */
    @RequestMapping(value = {"", "/"}, method = RequestMethod.POST)
    @ResponseBody
    public JsonResponse<String> saveCategoryItem(@ModelAttribute("merchantId") int merchantId, @RequestBody CategoryItemDto dto) {
        CommodityType commodityType = new CommodityType(merchantId, dto.getName());
        commodityTypeService.newCommodityType(commodityType);
        return new JsonResponse<>();
    }

    /**
     * 删除分类
     */
    @RequestMapping(value = "/{categoryId}", method = RequestMethod.DELETE)
    @ResponseBody
    public JsonResponse<Object> deleteCategoryItem(@PathVariable("categoryId") int categoryId, @ModelAttribute("merchantId") int merchantId) {
        try {
            commodityBus.deleteCommodityType(categoryId, merchantId);
        } catch (RuntimeException e) {
            return new JsonResponse<>().error(e.getMessage());
        }
        return new JsonResponse<>();
    }

    /**
     * 更新分类
     */
    @RequestMapping(value = "/{categoryId}", method = RequestMethod.PUT)
    @ResponseBody
    public JsonResponse<String> update(@RequestBody CategoryItemDto dto) {
        commodityTypeBus.updateCommodityType(dto.getId(), dto.getWeight());
        return new JsonResponse<>();
    }
}
