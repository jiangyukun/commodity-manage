package com.ieebook.wxshop.service.commodity;

import com.ieebook.wxshop.dto.category.CategoryItemDto;
import com.ieebook.wxshop.dto.category.CategorySelectDto;
import com.ieebook.wxshop.dto.commodity.CommodityDto;
import com.ieebook.wxshop.entity.commodity.CommodityType;
import com.ieebook.wxshop.service.BaseService;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.List;

@Repository
public class CommodityTypeService extends BaseService {

    public List<CommodityType> getCommodityListBymId(int mId) {
        List<CommodityType> list = sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "CommodityType.queryCommodityType", mId);
        return CollectionUtils.isEmpty(list) ? Collections.EMPTY_LIST : list;
    }

    public CommodityType getDefaultCommodityByMId(int mid) {
        List<CommodityType> list = sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "CommodityType.getDefaultCommodityByMId", mid);
        return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }

    public void newCommodityType(CommodityType commodityType) {
        if (commodityType == null) return;
        sqlSessionTemplate.insert(ServiceSpec.NAMESPACE + "CommodityType.createCommodityType", commodityType);
    }

    public void updateCommodityType(CommodityType commodityType) {
        if (commodityType == null) return;
        sqlSessionTemplate.update(ServiceSpec.NAMESPACE + "CommodityType.updateCommodityType", commodityType);
    }

    public void deleteCommodityType(int id) {
        sqlSessionTemplate.delete(ServiceSpec.NAMESPACE + "CommodityType.deleteCommodityType", id);
    }

    public CommodityType getCommodityType(int commodityTypeId) {
        return sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "CommodityType.getCommodityType", commodityTypeId);
    }

    public List<CategoryItemDto> getCategoryList(int merchantId) {
        List<CategoryItemDto> list = sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "CommodityType.getCategoryList", merchantId);
        return CollectionUtils.isEmpty(list) ? Collections.EMPTY_LIST : list;
    }

    public List<CategorySelectDto> getCategorySelectList(int merchantId) {
        List<CategorySelectDto> list = sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "CommodityType.getCategorySelectList", merchantId);
        return CollectionUtils.isEmpty(list) ? Collections.EMPTY_LIST : list;
    }

    /*public void updateAll(CommodityDto dto) {
        Assert.notNull(dto);
        sqlSessionTemplate.update(ServiceSpec.NAMESPACE + "CommodityType.updateAll", dto);
    }*/
}
