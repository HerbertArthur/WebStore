package com.webstore.service;

import com.github.pagehelper.PageInfo;
import com.webstore.domain.Order;

import java.util.List;

public interface OrderService {

    /**
     * 查找用户的订单
     * @param userId
     * @return
     */

    PageInfo<Order> selectOrderByUser(Long userId, int currentPage, int pageSize);
}
