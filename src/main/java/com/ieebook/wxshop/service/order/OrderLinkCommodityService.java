package com.ieebook.wxshop.service.order;

import com.ieebook.wxshop.entity.order.OrderLinkCommodity;
import com.ieebook.wxshop.service.BaseService;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderLinkCommodityService extends BaseService {
    public List<OrderLinkCommodity> getAllByOid(String oid) {
        return sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "Order_link_commondity.getAllByOid", oid);
    }
}
