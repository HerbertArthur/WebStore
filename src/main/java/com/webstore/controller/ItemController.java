package com.webstore.controller;

import com.github.pagehelper.PageInfo;
import com.webstore.domain.Item;
import com.webstore.service.ItemService;
import com.webstore.utils.CommUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
    public ModelAndView searchItems(String keyword, Integer currentPage, Integer pageSize){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("search");
        if (!CommUtils.strIsNull(keyword)){
            if (null == currentPage || 0 == currentPage){
                currentPage = 1;
            }
            pageSize = 12;
            PageInfo<Item> itemsPage = itemService.findItemsByKeyword(keyword, currentPage, pageSize);
            modelAndView.addObject("query", keyword);
            modelAndView.addObject("itemList", itemsPage.getList());
            modelAndView.addObject("totalPages", itemsPage.getPages());
            modelAndView.addObject("page", currentPage);
            modelAndView.addObject("recordCount", itemsPage.getTotal());
        } else {
            modelAndView.addObject("query", "");
            modelAndView.addObject("totalPages", 0);
            modelAndView.addObject("page", 1);
            modelAndView.addObject("recordCount", 0);
        }
        return modelAndView;
    }
}
