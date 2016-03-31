package com.ieebook.wxshop.business;

import com.ieebook.wxshop.dto.commodity.CommodityDetailDto;
import com.ieebook.wxshop.dto.commodity.CommodityDto;
import com.ieebook.wxshop.entity.commodity.Commodity;
import com.ieebook.wxshop.entity.commodity.CommoditySequnce;
import com.ieebook.wxshop.entity.commodity.CommodityType;
import com.ieebook.wxshop.entity.other.CloudImage;
import com.ieebook.wxshop.service.ServiceHelper;
import com.ieebook.wxshop.service.commodity.CommodityRecommendService;
import com.ieebook.wxshop.service.commodity.CommoditySequnceService;
import com.ieebook.wxshop.service.commodity.CommodityService;
import com.ieebook.wxshop.service.commodity.CommodityTypeService;
import com.ieebook.wxshop.service.other.CloudImageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * jiangyukun on 2015-11-08 19:54.
 */
@Service
public class CommodityBus {

    @Autowired
    private CommodityService commodityService;
    @Autowired
    private CommodityTypeService commodityTypeService;
    @Autowired
    private CloudImageService cloudImageService;
    @Autowired
    private ServiceHelper serviceHelper;
    @Autowired
    private CommodityRecommendService commodityRecommendService;
    @Autowired
    private CommoditySequnceService commoditySequnceService;

    /**
     * 商品详情
     *
     * @param commodityId
     * @return
     */
    public CommodityDto getCommodityDetail(int commodityId) {
        Commodity commodity = commodityService.getCommoditybyId(commodityId);
        return getCommodityDetailDto(commodity, CloudImage.ORIGINAL);
    }

    private CommodityDto getCommodityDetailDto(Commodity commodity, String imageType) {
        CommodityDetailDto dto = new CommodityDetailDto();
        dto.setId(commodity.getId());
        dto.setName(commodity.getName());
        dto.setCategoryId(commodity.getTid());
        dto.setCategoryName(serviceHelper.getCategoryName(commodity));
        dto.setImgId(commodity.getImgId());
        dto.setImgUrl(serviceHelper.getImageUrl(commodity, imageType));
        dto.setSpecification(commodity.getSpecification());
        dto.setPrice(commodity.getPrice());
        dto.setRecommend(commodity.getIsRecommend());
        dto.setState(commodity.getState());
        return dto;
    }

    /**
     * 删除商品类型，并将其分类下的商品自动归类到默认分类
     *
     * @param commodityTypeId
     * @param mid
     * @return
     */
    public boolean deleteCommodityType(int commodityTypeId, int mid) {
        CommodityType commodityType = commodityTypeService.getDefaultCommodityByMId(mid);
        if (commodityType == null) {
            throw new IllegalArgumentException("没有默认分类!");
        }
        if (commodityType.getId() == commodityTypeId) {
            throw new IllegalArgumentException("无法删除默认分类!");
        }
        List<Commodity> list = commodityService.getCommodityListbyTypeId(commodityTypeId);

        if (list != null) {
            for (Commodity item : list) {
                commodityService.updateCommoditybyTypeId(commodityType.getId(), item.getId());
            }
        }
        commodityTypeService.deleteCommodityType(commodityTypeId);
        return true;
    }

    public void createCommodity(CommodityDto commodityDto, int mid) {
        Commodity commodity = new Commodity();
        commodity.setName(commodityDto.getName());
        commodity.setTid(commodityDto.getCategoryId());
        commodity.setImgId(commodityDto.getImgId());
        commodity.setSpecification(commodityDto.getSpecification());
        commodity.setPrice(commodityDto.getPrice());
        commodity.setIsRecommend(commodityDto.getRecommend());
        CommoditySequnce commoditySequnce = commoditySequnceService.getCommodityCodeByMid(mid);
        int current;
        if (commoditySequnce != null && commoditySequnce.getCid() != 0) {
            current = commoditySequnce.getCid() + 1;
            commoditySequnce.setCid(current);
            commoditySequnceService.updateCommodityCode(commoditySequnce);
        } else {
            current = CommoditySequnceService.initCode;
            CommoditySequnce newcommoditySequnce = new CommoditySequnce(mid, current);
            commoditySequnceService.creatCommodityCode(newcommoditySequnce);

        }
        commodity.setCode(current);
        commodityService.createCommodity(commodity);
    }

    public void delete(int commodityId) {
        commodityService.deleteCommodity(commodityId);
    }

    public void updateCommodity(CommodityDto dto) {
        Commodity commodity = commodityService.getCommoditybyId(dto.getId());
        commodity.setId(dto.getId());
        commodity.setName(dto.getName());
        commodity.setTid(dto.getCategoryId());
        commodity.setImgId(dto.getImgId());
        commodity.setPrice(dto.getPrice());
        commodity.setSpecification(dto.getSpecification());
        commodity.setIsRecommend(dto.getRecommend());
        commodity.setState(dto.getState());
        commodityService.updateCommodity(commodity);
    }

    public void updateState(int commodityId) {
        Commodity commodity = commodityService.getCommoditybyId(commodityId);
        commodity.setState(Commodity.STATE_INVALID);
        commodityService.updateCommodity(commodity);
    }

    public List<CommodityDto> search(Integer merchantId, String searchName) {
        List<Commodity> commodityList = commodityService.search(merchantId, searchName);
        List<CommodityDto> commodityDtoList = new ArrayList<>(commodityList.size());
        commodityList.forEach(commodity -> {
            commodityDtoList.add(getCommodityDetailDto(commodity, CloudImage.THUMBNAIL));
        });
        return commodityDtoList;
    }
}
