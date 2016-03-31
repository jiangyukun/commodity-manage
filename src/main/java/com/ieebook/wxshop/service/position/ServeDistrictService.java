package com.ieebook.wxshop.service.position;

import com.ieebook.wxshop.entity.position.ServeDistrict;
import com.ieebook.wxshop.service.BaseService;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ServeDistrictService extends BaseService {
    public void createServe_district(ServeDistrict serve_district) {
        sqlSessionTemplate.insert(ServiceSpec.NAMESPACE + "ServeDistrict.createServe_district", serve_district);
    }

    public void updateServe_district(ServeDistrict serve_district) {
        sqlSessionTemplate.update(ServiceSpec.NAMESPACE + "ServeDistrict.updateServe_district", serve_district);
    }

    public void deleteServe_district(int id) {
        sqlSessionTemplate.delete(ServiceSpec.NAMESPACE + "ServeDistrict.deleteServe_district", id);
    }

    public List<ServeDistrict> getAllServe_districtByMid(int mid) {
        return sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "ServeDistrict.getAllServe_districtByMid", mid);
    }

    public ServeDistrict getServe_districtById(int id) {
        return sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "ServeDistrict.getServe_districtById", id);
    }
}
