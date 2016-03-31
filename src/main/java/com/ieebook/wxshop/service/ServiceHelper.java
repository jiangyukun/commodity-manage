package com.ieebook.wxshop.service;

import com.ieebook.wxshop.entity.commodity.Commodity;
import com.ieebook.wxshop.entity.commodity.CommodityType;
import com.ieebook.wxshop.entity.other.CloudImage;
import com.ieebook.wxshop.service.commodity.CommodityTypeService;
import com.ieebook.wxshop.service.other.CloudImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

/**
 * jiangyukun on 2015-11-26 15:58
 */
@Component
public class ServiceHelper {
    @Autowired
    private CommodityTypeService commodityTypeService;
    @Autowired
    private CloudImageService cloudImageService;

    public String getCategoryName(Commodity commodity) {
        Assert.notNull(commodity);
        Assert.notNull(commodity.getTid());
        CommodityType commodityType = commodityTypeService.getCommodityType(commodity.getTid());
        return commodityType.getName();
    }

    public String getImageUrl(Commodity commodity, String type) {
        Assert.notNull(commodity);
        if (!StringUtils.hasLength(commodity.getImgId())) {
            return null;
        }
        String imgId = commodity.getImgId();
        CloudImage cloudImage = cloudImageService.getCloudImageById(imgId);
        if (cloudImage == null) {
            return null;
        }
        if (type.equals(CloudImage.ORIGINAL)) {
            return StringUtils.hasText(cloudImage.getOriginal()) ? cloudImage.getOriginal() : null;
        }
        return StringUtils.hasText(cloudImage.getThumbnail()) ? cloudImage.getThumbnail() : null;
    }
}
