package com.ieebook.wxshop.service.merchant;

import com.ieebook.wxshop.entity.merchant.Merchant;
import com.ieebook.wxshop.service.BaseService;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MerchantService extends BaseService {
    public Merchant getMerchantByOperid(String openid) {
        List<Merchant> merchantList = sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "Merchant.getMerchantByOpenId", openid);
        return CollectionUtils.isEmpty(merchantList) ? null : merchantList.get(0);
    }

    public void insertMerchant(Merchant merchant) {
        sqlSessionTemplate.insert(ServiceSpec.NAMESPACE + "Merchant.createMerchant", merchant);
    }

    public Merchant getMerchant(int merchantId) {
        List<Merchant> merchantList = sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "Merchant.getMerchant", merchantId);
        return CollectionUtils.isEmpty(merchantList) ? null : merchantList.get(0);
    }

    public Merchant getMerchantByAccount(String account) {
        List<Merchant> merchantList = sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "Merchant.getMerchantByAccount", account);
        return CollectionUtils.isEmpty(merchantList) ? null : merchantList.get(0);
    }

    public void updateOpenIdbyAccount(String account, String openid) {
        Map<String, String> params = new HashMap<String, String>();
        params.put("openid", openid);
        params.put("account", account);
        sqlSessionTemplate.update(ServiceSpec.NAMESPACE + "Merchant.updateOpenIdbyAccount", params);
    }

    public Merchant getByMobile(String mobile) {
        return sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "Merchant.getByMobile", mobile);
    }

}