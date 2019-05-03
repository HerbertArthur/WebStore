package com.webstore.controller;

import com.webstore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;


    /**
     * 我的订单
     * @param userId
     */
    @RequestMapping("/getUserOrders")
    public ModelAndView getUserOrders(Long userId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("order-cart");
        modelAndView.addObject("orderList", orderService.selectOrderByUser(userId));
        return modelAndView;
    }
}
