package com.ieebook.wxshop.business;

import com.ieebook.wxshop.entity.commodity.Commodity;
import com.ieebook.wxshop.entity.order.OrderLinkCommodity;
import com.ieebook.wxshop.service.commodity.CommodityService;
import com.ieebook.wxshop.service.order.OrderLinkCommodityService;
import com.ieebook.wxshop.service.order.OrderService;
import com.ieebook.wxshop.weixin.dto.order.OrderInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderBus {

    @Autowired
    private OrderLinkCommodityService orderLinkCommodityService;
    @Autowired
    private CommodityService commodityService;
    @Autowired
    private OrderService orderService;

    /**
     * 根据订单号获取订单下所有商品的相关信息
     *
     * @param oid
     * @return
     */
    public List<OrderInfo> getOrderInfoListByOid(String oid) {
        List<OrderInfo> orderInfoList = new ArrayList<>();
        List<OrderLinkCommodity> list = orderLinkCommodityService.getAllByOid(oid);
        for (OrderLinkCommodity index : list) {
            Commodity commodity = commodityService.getCommoditybyId(index.getCid());
            OrderInfo orderInfo = new OrderInfo(commodity, index.getAmount());
            orderInfoList.add(orderInfo);
        }
        return orderInfoList;
    }

}
