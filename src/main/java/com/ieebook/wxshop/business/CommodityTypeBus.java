package com.ieebook.wxshop.business;

import com.ieebook.wxshop.business.support.BaseBus;
import com.ieebook.wxshop.dto.category.CategoryItemDto;
import com.ieebook.wxshop.dto.category.CategorySelectDto;
import com.ieebook.wxshop.dto.commodity.CommodityDetailDto;
import com.ieebook.wxshop.dto.commodity.CommodityDto;
import com.ieebook.wxshop.dto.commodity.CommodityTypeDto;
import com.ieebook.wxshop.dto.converter.CommodityConvert;
import com.ieebook.wxshop.entity.commodity.Commodity;
import com.ieebook.wxshop.entity.commodity.CommodityType;
import com.ieebook.wxshop.entity.other.CloudImage;
import com.ieebook.wxshop.service.ServiceHelper;
import com.ieebook.wxshop.service.commodity.CommodityService;
import com.ieebook.wxshop.service.commodity.CommodityTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * jiangyukun on 2015-11-24 14:59
 */
@Service
public class CommodityTypeBus extends BaseBus {

    @Autowired
    private CommodityService commodityService;
    @Autowired
    private CommodityTypeService commodityTypeService;
    @Autowired
    private ServiceHelper serviceHelper;

    public List<CommodityTypeDto> getCommodityTypeInfo(int merchantId) {
        List<CommodityTypeDto> commodityTypeDtoList = new ArrayList<>();
        List<CommodityType> commodityTypeList = commodityTypeService.getCommodityListBymId(merchantId);
        commodityTypeList.forEach(commodityType -> {
            int typeId = commodityType.getId();
            List<Commodity> commodityList = commodityService.getCommodityListbyTypeId(typeId);
            CommodityTypeDto commodityTypeDto = CommodityConvert.convert(commodityType);

            List<CommodityDto> commodityDtoList = new ArrayList<>();
            commodityList.forEach(commodity -> {
                CommodityDetailDto commodityDetailDto = CommodityConvert.convert(commodity);
                commodityDetailDto.setImgUrl(serviceHelper.getImageUrl(commodity, CloudImage.THUMBNAIL));
                commodityDtoList.add(commodityDetailDto);
            });
            commodityTypeDto.setCommodityDto(commodityDtoList);
            commodityTypeDtoList.add(commodityTypeDto);
        });
        return commodityTypeDtoList;
    }

    public List<CommodityTypeDto> getCommodityType(int merchantId) {
        List<CommodityTypeDto> commodityTypeDtoList = new ArrayList<>();
        List<CommodityType> commodityTypeList = commodityTypeService.getCommodityListBymId(merchantId);
        commodityTypeList.forEach(commodityType -> {
            commodityTypeDtoList.add(CommodityConvert.convert(commodityType));
        });
        return commodityTypeDtoList;
    }

    public List<CategoryItemDto> getCategoryList(int merchantId) {
        return commodityTypeService.getCategoryList(merchantId);
    }

    public List<CategorySelectDto> getCategorySelectList(int merchantId) {
        return commodityTypeService.getCategorySelectList(merchantId);
    }

    /**
     * 更新商品类型 weight
     */
    public void updateCommodityType(Integer commodityTypeId, Integer weight) {
        CommodityType commodityType = commodityTypeService.getCommodityType(commodityTypeId);
        commodityType.setWeight(weight);
        commodityTypeService.updateCommodityType(commodityType);
    }

}
