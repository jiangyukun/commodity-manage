package com.ieebook.wxshop.business;

import com.ieebook.wxshop.dto.merchant.MerchantDetailDto;
import com.ieebook.wxshop.entity.commodity.CommodityRecommend;
import com.ieebook.wxshop.entity.commodity.CommodityType;
import com.ieebook.wxshop.entity.merchant.Merchant;
import com.ieebook.wxshop.service.commodity.CommodityRecommendService;
import com.ieebook.wxshop.service.commodity.CommodityTypeService;
import com.ieebook.wxshop.service.merchant.MerchantInfoService;
import com.ieebook.wxshop.service.merchant.MerchantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service
public class MerchantBus {
    @Autowired
    private MerchantInfoService merchantInfoService;
    @Autowired
    private MerchantService merchantService;
    @Autowired
    private CommodityTypeService commodityTypeService;
    @Autowired
    private CommodityRecommendService commodityRecommendService;

    /**
     * 新增商户之后，新增20个商品推荐栏，1个默认分类
     *
     * @param merchant
     */
    public void createNewMerchant(Merchant merchant) {
        merchantService.insertMerchant(merchant);
        CommodityType commodityType = new CommodityType(merchant.getId(), 0, 1, 0, "未分类", "", merchant.getId(), "", merchant.getId(), "", 0);
        commodityTypeService.newCommodityType(commodityType);
        CommodityRecommend commodityRecommend = new CommodityRecommend(merchant.getId(), 0, merchant.getId(), "", merchant.getId(), "");
        for (int i = 1; i <= 20; i++) {
            commodityRecommendService.createCommodityRecommend(commodityRecommend);
        }
    }

    public MerchantDetailDto getMerchant(int merchantId) {
        Merchant merchant = merchantService.getMerchant(merchantId);
        Assert.notNull(merchant, "error merchantId");
        return new MerchantDetailDto("a", "a", "a", "2015-10-10", "2015-10-10", "已绑定");
    }

    public boolean existMobile(String mobile) {
        Merchant merchant = merchantService.getByMobile(mobile);
        return merchant != null;
    }
}
