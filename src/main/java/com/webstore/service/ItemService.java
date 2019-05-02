package com.webstore.service;

import com.webstore.domain.Item;

import java.util.List;

public interface ItemService {
    /**
     * 返回推荐商品
     * @return
     */
    List<Item> getRecommendItem();
}
