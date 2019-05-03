package com.webstore.service;

import com.github.pagehelper.PageInfo;
import com.webstore.domain.Item;

import java.util.List;

public interface ItemService {
    /**
     * 返回推荐商品
     * @return
     */
    List<Item> getRecommendItem();

    /**
     * 搜索商品
     * @param key
     * @return
     */
    public PageInfo<Item> findItemsByKeyword(String key, int currentPage, int pageSize);
}
