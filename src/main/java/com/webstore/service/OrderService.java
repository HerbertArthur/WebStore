package com.webstore.service;

import com.webstore.domain.Order;

import java.util.List;

public interface OrderService {

    /**
     * 查找用户的订单
     * @param userId
     * @return
     */
    List<Order> selectOrderByUser(Long userId);
}
