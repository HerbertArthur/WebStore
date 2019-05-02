package com.webstore.controller;

import com.webstore.domain.Item;
import com.webstore.service.ItemService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {

    @Autowired
    private ItemService itemService;

    @RequestMapping("/showSelectedItem")
    @ResponseBody
    public List<Item> showSelectedItem(){
        return itemService.getRecommendItem();
    }

    @RequestMapping("/searchItems")
    public List<Item> searchItems(String keyword){

        return null;
    }
}
