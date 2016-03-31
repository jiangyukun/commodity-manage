package com.ieebook.wxshop.dto.converter;

import com.ieebook.wxshop.dto.commodity.CommodityDetailDto;
import com.ieebook.wxshop.dto.commodity.CommodityTypeDto;
import com.ieebook.wxshop.entity.commodity.Commodity;
import com.ieebook.wxshop.entity.commodity.CommodityType;

/**
 * jiangyukun on 2015-11-24 15:58
 */
public class CommodityConvert {
    public static CommodityTypeDto convert(CommodityType commodityType) {
        CommodityTypeDto commodityTypeDto = new CommodityTypeDto(commodityType.getId(), commodityType.getName());
        return commodityTypeDto;
    }

    public static CommodityDetailDto convert(Commodity commodity) {

        return new CommodityDetailDto(commodity.getId(), commodity.getName(), commodity.getImgId(),
                commodity.getPrice(), commodity.getSpecification(), commodity.getIsRecommend(), commodity.getState());

    }
}
