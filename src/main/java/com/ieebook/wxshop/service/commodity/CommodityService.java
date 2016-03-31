package com.ieebook.wxshop.service.commodity;

import com.ieebook.wxshop.entity.commodity.Commodity;
import com.ieebook.wxshop.service.BaseService;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * jiangyukun on 2015-11-08 19:49.
 */
@Repository
public class CommodityService extends BaseService {

    public List<Commodity> getCommodityListbyTypeId(int tid) {
        List<Commodity> commodityList = sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "Commodity.getCommodityListbyTypeId", tid);
        return CollectionUtils.isEmpty(commodityList) ? Collections.EMPTY_LIST : commodityList;
    }

    public Commodity getCommoditybyId(int id) {
        return sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "Commodity.getCommodityById", id);
    }

    public void createCommodity(Commodity commodity) {
        sqlSessionTemplate.insert(ServiceSpec.NAMESPACE + "Commodity.createCommodity", commodity);
    }

    public void updateCommoditybyTypeId(int typeId, int id) {
        Map<String, Integer> parame = new HashMap<String, Integer>();
        parame.put("tid", typeId);
        parame.put("id", id);
        sqlSessionTemplate.update(ServiceSpec.NAMESPACE + "Commodity.updateCommodityListbyTypeId", parame);
    }

    public void updateCommodity(Commodity commodity) {
        sqlSessionTemplate.update(ServiceSpec.NAMESPACE + "Commodity.updateCommodity", commodity);
    }

    public void deleteCommodity(int id) {
        sqlSessionTemplate.delete(ServiceSpec.NAMESPACE + "Commodity.deleteCommodity", id);
    }

    public List<Commodity> search(Integer merchantId, String searchName) {
        Map<String, Object> params = new HashMap<>(2);
        params.put("merchantId", merchantId);
        params.put("searchName", searchName);
        List<Commodity> commodityList = sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "Commodity.search", params);
        return commodityList;
    }
}
