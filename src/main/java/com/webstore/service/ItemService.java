package com.webstore.service;

import com.github.pagehelper.PageInfo;
import com.webstore.domain.Item;

import javax.xml.ws.Response;
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
    PageInfo<Item> findItemsByKeyword(String key, int currentPage, int pageSize);

    /**
     * 根据商品id（item_id）获取商品信息
     * @param itemId
     * @return
     */
    Item findItemById(Long itemId);


}
