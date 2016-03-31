package com.ieebook.wxshop.service.place;

import com.ieebook.wxshop.entity.place.City;
import com.ieebook.wxshop.entity.place.Province;
import com.ieebook.wxshop.entity.place.Town;
import com.ieebook.wxshop.service.BaseService;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PlaceService extends BaseService {
    public List<Province> getAllprovince() {
        return sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "Placename.getAllprovince");
    }

    public List<City> getAllCityByProvince(String provinceId) {
        return sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "Placename.getAllCityByProvince", provinceId);
    }

    public List<Town> getAllTownByCityId(int cityId) {
        return sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "Placename.getAllTownByCityId", cityId);
    }

    public List<City> getAllCity() {
        return sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "Placename.getAllCity");
    }

    public List<Town> getAllTown() {
        return sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "Placename.getAllTown");
    }

    public Province getProvinceById(int id) {
        return sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "Placename.getProvinceById", id);
    }

    public City getCityById(int id) {
        return sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "Placename.getCityById", id);
    }

    public Town getTownById(int id) {
        return sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "Placename.getTownById", id);
    }
}
