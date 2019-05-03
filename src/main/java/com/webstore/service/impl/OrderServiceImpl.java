package com.webstore.service.impl;

import com.webstore.dao.ItemMapper;
import com.webstore.dao.OrderMapper;
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

    public List<Order> selectOrderByUser(Long userId){
        OrderExample orderExample = new OrderExample();
        OrderExample.Criteria criteria = orderExample.createCriteria();
        criteria.andUserIdEqualTo(userId);
        List<Order> orderList = orderMapper.selectByExample(orderExample);
        for (Order order : orderList) {
            order.setItem(itemMapper.selectByPrimaryKey(order.getItemId()));
        }
        return orderList;
    }
}
