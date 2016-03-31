package com.ieebook.wxshop.service.commodity;

import com.ieebook.wxshop.entity.commodity.CommodityRecommend;
import com.ieebook.wxshop.service.BaseService;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Repository
public class CommodityRecommendService extends BaseService {
    public List<CommodityRecommend> getCommodityRecommendbyMId(int mid) {
        List<CommodityRecommend> commodityRecommendList = sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "CommodityRecommend.getCommodityRecommendbyMId", mid);

        return CollectionUtils.isEmpty(commodityRecommendList) ? null : commodityRecommendList;
    }

    public void updateCommodityRecommend(CommodityRecommend commodityRecommend) {

        sqlSessionTemplate.update(ServiceSpec.NAMESPACE + "CommodityRecommend.updateCommodityRecommend", commodityRecommend);

    }

    public void createCommodityRecommend(CommodityRecommend commodityRecommend) {

        sqlSessionTemplate.update(ServiceSpec.NAMESPACE + "CommodityRecommend.createCommodityRecommend", commodityRecommend);

    }


}
