package com.ieebook.wxshop.web.controller.customer;

import com.ieebook.wxshop.business.OrderBus;
import com.ieebook.wxshop.dto.JsonResponse;
import com.ieebook.wxshop.entity.order.Order;
import com.ieebook.wxshop.entity.user.User;
import com.ieebook.wxshop.service.order.OrderService;
import com.ieebook.wxshop.service.user.UserService;
import com.ieebook.wxshop.web.support.BaseController;
import com.ieebook.wxshop.weixin.dto.order.OrderInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * jiangyukun on 2015-11-19 23:18
 */
@Controller
@RequestMapping("/customer")
@SessionAttributes({"merchantId"})
public class CustomerController extends BaseController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrderBus orderBus;

    @RequestMapping("/order")
    public String order(@ModelAttribute("merchantId") int merchantId, ModelMap modelMap) {
        String strstate = this.getParam("state", "0");
        int state = Integer.valueOf(strstate);
        List<Order> orderList = orderService.getAllOrderByStateInMid(merchantId, state, 0);
        int countOrder = orderService.countOverOrder(merchantId);
        double getAmount = orderService.SumOverOrder(merchantId);
        int addstate = 0;//判断订单是否可以继续加载的标志（用于页面显示加载更多操作）
        if (orderList == null || orderList.size() < 20) {
            addstate = 1;
        }
        modelMap.put("state", state);
        modelMap.put("addstate", addstate);
        modelMap.put("limit", 0);
        modelMap.put("countOrder", countOrder);
        modelMap.put("getAmount", getAmount);
        modelMap.put("orderList", orderList);
        return "/customer/order";
    }

    @RequestMapping(value = "/addmore", method = RequestMethod.POST)
    @ResponseBody
    public JsonResponse<List<Order>> nextPage(@ModelAttribute("merchantId") int merchantId, int limit,int state) {
        List<Order> orderList = orderService.getAllOrderByStateInMid(merchantId, state, limit);
        JsonResponse<List<Order>> jsonresponse = new JsonResponse<List<Order>>();
        jsonresponse.setSuccess(orderList);
        return jsonresponse;
    }

    @RequestMapping("/info")
    public String info(ModelMap modelMap) {
        String id = this.getParam("id");
        Order order = orderService.getOrderById(id);
        User user = userService.getUserByUid(order.getUid());
        List<OrderInfo> orderInfoList = orderBus.getOrderInfoListByOid(id);
        modelMap.put("order", order);
        modelMap.put("nickname", user.getNickname());
        modelMap.put("orderInfoList", orderInfoList);
        return "/customer/info";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public JsonResponse<String> update(Order order) {
        orderService.updateOrderForState(order);
        JsonResponse<String> jsonresponse = new JsonResponse<String>();
        jsonresponse.setSuccess(null);
        return jsonresponse;
    }


}
