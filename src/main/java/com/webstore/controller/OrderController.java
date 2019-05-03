package com.webstore.controller;

import com.github.pagehelper.PageInfo;
import com.webstore.domain.Item;
import com.webstore.domain.Order;
import com.webstore.service.ItemService;
import com.webstore.service.OrderService;
import com.webstore.utils.CommUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;
    private ItemService itemService;


    /**
     * 我的订单
     *
     * @param userId
     */
    @RequestMapping("/getUserOrders")
    public ModelAndView getUserOrders(Long userId, Integer currentPage, Integer pageSize) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("user-orders");
        if (null == currentPage || 0 == currentPage)
            currentPage = 1;
        pageSize = 12;
        PageInfo<Order> orderPageInfo = orderService.selectOrderByUser(userId, currentPage, pageSize);
        modelAndView.addObject("orderList", orderPageInfo.getList());
        modelAndView.addObject("page", currentPage);
        modelAndView.addObject("recordCount", orderPageInfo.getTotal());
        modelAndView.addObject("totalPages", orderPageInfo.getPages());

        return modelAndView;
    }
}
