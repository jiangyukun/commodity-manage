package com.ieebook.wxshop.service.merchant;

import com.ieebook.wxshop.entity.merchant.MerchantInfo;
import com.ieebook.wxshop.service.BaseService;
import org.springframework.stereotype.Repository;

@Repository
public class MerchantInfoService extends BaseService {

    public MerchantInfo getMerchantInfoByMid(int mid) {
        return sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "MerchantInfo.getMerchantInfoByMid", mid);
    }


}
