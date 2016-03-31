package com.ieebook.wxshop.service.order;

import com.ieebook.wxshop.entity.order.Order;
import com.ieebook.wxshop.service.BaseService;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class OrderService extends BaseService {
    public List<Order> getAllOrderByMid(int mid, int limit) {
        Map<String, Integer> parame = new HashMap<String, Integer>();
        parame.put("mid", mid);
        parame.put("limit", limit);
        List<Order> list = sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "Order.getAllOrderByMid", parame);

        return CollectionUtils.isEmpty(list) ? null : list;
    }

    public List<Order> getAllOrderByStateInMid(int mid, int state, int limit) {
        Map<String, Integer> parame = new HashMap<String, Integer>();
        parame.put("mid", mid);
        parame.put("state", state);
        parame.put("limit", limit);
        List<Order> list = sqlSessionTemplate.selectList(ServiceSpec.NAMESPACE + "Order.getAllOrderByStateInMid", parame);

        return CollectionUtils.isEmpty(list) ? null : list;
    }

    public Order getOrderById(String id) {
        return sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "Order.getOrderById", id);
    }

    public void updateOrderForState(Order order) {
        sqlSessionTemplate.update(ServiceSpec.NAMESPACE + "Order.updateOrderForState", order);
    }

    public int countOverOrder(int mid) {
        return sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "Order.countOverOrder", mid);
    }

    public double SumOverOrder(int mid) {
        String sum = sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "Order.sumOverOrder", mid);
        if (sum == null) return 0;
        else return Double.valueOf(sum);
    }

}
