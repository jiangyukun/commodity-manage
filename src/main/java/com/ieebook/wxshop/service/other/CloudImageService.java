package com.ieebook.wxshop.service.other;

import com.ieebook.wxshop.entity.other.CloudImage;
import com.ieebook.wxshop.service.BaseService;
import org.springframework.stereotype.Repository;

/**
 * jiangyukun on 2015-11-26 15:47
 */
@Repository
public class CloudImageService extends BaseService {
    public CloudImage getCloudImageById(String imgId) {
        return sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "other.getCloudImageById", imgId);
    }

    public void saveCloudImage(CloudImage cloudImage) {
        sqlSessionTemplate.insert(ServiceSpec.NAMESPACE + "other.saveCloudImage", cloudImage);
    }
}
