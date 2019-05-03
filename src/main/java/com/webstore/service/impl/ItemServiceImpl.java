package com.webstore.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.webstore.dao.ItemMapper;
import com.webstore.domain.Item;
import com.webstore.domain.ItemExample;
import com.webstore.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private ItemMapper itemMapper;

    public List<Item> getRecommendItem(){
        ItemExample itemExample = new ItemExample();
        ItemExample.Criteria  criteria = itemExample.createCriteria();
        criteria.andIconPathIsNotNull();
        //分页插件
        PageHelper.startPage(1, 10);
        PageInfo<Item> itemPageInfo = new PageInfo<>(itemMapper.selectByExample(itemExample));
        return itemPageInfo.getList();
    }

    public PageInfo<Item> findItemsByKeyword(String key, int currentPage, int pageSize){
        ItemExample itemExample = new ItemExample();
        ItemExample.Criteria criteria1 = itemExample.createCriteria();
        criteria1.andItemNameLike("%"+key+"%");
        ItemExample.Criteria criteria2 = itemExample.createCriteria();
        criteria2.andItemCategoryLike("%"+key+"%");
        //条件2必须手动添加
        itemExample.or(criteria2);
        PageHelper.startPage(currentPage, pageSize);
        PageInfo<Item> itemPageInfo = new PageInfo<>(itemMapper.selectByExample(itemExample));
        return itemPageInfo;
    }



}
