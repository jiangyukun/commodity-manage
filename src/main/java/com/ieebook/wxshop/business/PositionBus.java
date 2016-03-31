package com.ieebook.wxshop.business;

import com.ieebook.wxshop.entity.place.City;
import com.ieebook.wxshop.entity.place.Province;
import com.ieebook.wxshop.entity.place.Town;
import com.ieebook.wxshop.entity.position.ServeDistrict;
import com.ieebook.wxshop.service.place.PlaceService;
import com.ieebook.wxshop.service.position.ServeDistrictService;
import com.ieebook.wxshop.weixin.dto.position.PositionPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PositionBus {

    @Autowired
    private PlaceService placeService;
    @Autowired
    private ServeDistrictService serve_districtService;

    public List<PositionPage> getPositionPage(int merchantId) {
        List<ServeDistrict> serve_districtList = serve_districtService.getAllServe_districtByMid(merchantId);
        List<PositionPage> positionPageList = new ArrayList<PositionPage>();
        for (ServeDistrict index : serve_districtList) {
            Province province = placeService.getProvinceById(index.getPid());
            City city = placeService.getCityById(index.getCid());
            Town town = placeService.getTownById(index.getTid());
            PositionPage positionPage = new PositionPage(index, province == null ? null : province.getName(), city == null ? null : city.getName(), town == null ? null : town.getName());
            positionPageList.add(positionPage);
        }
        return positionPageList;
    }
}
