package com.ieebook.wxshop.service.commodity;

import org.springframework.stereotype.Repository;

import com.ieebook.wxshop.entity.commodity.CommoditySequnce;
import com.ieebook.wxshop.service.BaseService;

@Repository
public class CommoditySequnceService extends BaseService{
	
	public static final int initCode = 100001;
	
	
	public CommoditySequnce getCommodityCodeByMid(int mid){
		return sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "CommoditySequnce.getCommodityCodeByMid", mid);
	}
	public void updateCommodityCode(CommoditySequnce commoditySequnce){
		sqlSessionTemplate.update(ServiceSpec.NAMESPACE + "CommoditySequnce.updateCommodityCode", commoditySequnce);
	}
	public void creatCommodityCode(CommoditySequnce commoditySequnce){
		sqlSessionTemplate.insert(ServiceSpec.NAMESPACE + "CommoditySequnce.creatCommodityCode", commoditySequnce);
	}
	
}
