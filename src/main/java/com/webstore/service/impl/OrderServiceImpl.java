package com.webstore.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.webstore.dao.ItemMapper;
import com.webstore.dao.OrderMapper;
import com.webstore.domain.Item;
import com.webstore.domain.ItemExample;
import com.webstore.domain.Order;
import com.webstore.domain.OrderExample;
import com.webstore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private ItemMapper itemMapper;

    public PageInfo<Order> selectOrderByUser(Long userId, int currentPage, int pageSize){
        OrderExample orderExample = new OrderExample();
        OrderExample.Criteria criteria = orderExample.createCriteria();
        criteria.andUserIdEqualTo(userId);
        PageHelper.startPage(currentPage, pageSize);
        PageInfo<Order> orderPageInfo = new PageInfo<>(orderMapper.selectByExample(orderExample));
        for (Order order : orderPageInfo.getList()) {
            order.setItem(itemMapper.selectByPrimaryKey(order.getItemId()));
        }
        return orderPageInfo;
    }


}
