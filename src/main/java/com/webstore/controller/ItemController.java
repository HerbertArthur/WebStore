package com.webstore.controller;

import com.github.pagehelper.PageInfo;
import com.webstore.domain.FpgResult;
import com.webstore.domain.Item;
import com.webstore.service.FpgResultService;
import com.webstore.service.ItemService;
import com.webstore.utils.CommUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {

    @Autowired
    private ItemService itemService;

    @Autowired
    private FpgResultService fpgResultService;

    /**
     * 首页“口碑甄选”推荐的商品,根据聚类和关联得到
     * @return
     */
    @RequestMapping("/showSelectedItem")
    @ResponseBody
    public List<Item> showSelectedItem(Long userId, Integer size){
        size = 8;
        Long uId = 1001l;
        if (null != userId){
            uId = userId;
        }
        List<FpgResult> fpgRByuIdList = fpgResultService.getFpgRByuId(uId);
        ArrayList<Long> itemIdList = new ArrayList<>();
        for (FpgResult fpgResult : fpgRByuIdList) {
            String associateItems = fpgResult.getAssociateItems();
            String[] items = associateItems.split(";");
            for (int i = 0; i < items.length; ++i){
                long id = Long.parseLong(items[i]);
                if (!itemIdList.contains(id)){
                    itemIdList.add(id);
                }
            }
            if (itemIdList.size() > size){
                break;
            }
        }
        ArrayList<Item> itemList = new ArrayList<>();
        for (Long itemId : itemIdList) {
            Item item = itemService.getItemById(itemId);
            if (null != item){
                itemList.add(itemService.getItemById(itemId));
            }
        }
        return itemList;
    }

    /**
     * 商品搜索功能
     * @param keyword
     * @param currentPage
     * @param pageSize
     * @return
     */
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
            modelAndView.addObject("page", 0);
            modelAndView.addObject("recordCount", 0);
        }
        return modelAndView;
    }


    @RequestMapping("test")
    public void test(){
        Item item = itemService.getItemById(69l);
        System.out.println(item.getPrice());

    }
}
