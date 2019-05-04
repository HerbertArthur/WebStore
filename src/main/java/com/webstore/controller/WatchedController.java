package com.webstore.controller;

import com.github.pagehelper.PageInfo;
import com.webstore.domain.Watched;
import com.webstore.service.WatchedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
@RequestMapping("/history")
public class WatchedController {

    @Autowired
    private WatchedService watchedService;

    /**
     * 我的足迹
     * @parm userId
     * @parm currentPage
     * @parm pageSize
     */
    @RequestMapping("/historyItems")
    public ModelAndView getHistoryItems(Long userId, Integer currentPage, Integer pageSize) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("history");
        if(null == currentPage || 0 == currentPage)
            currentPage = 1;
        pageSize = 15;
        PageInfo<Watched> watchedPageInfo = watchedService.selectHistoryByUser(userId, currentPage, pageSize);
        modelAndView.addObject("orderList", watchedPageInfo.getList());
        modelAndView.addObject("page", currentPage);
        modelAndView.addObject("recordCount", watchedPageInfo.getTotal());
        modelAndView.addObject("totalPages", watchedPageInfo.getPages());

        return modelAndView;
    }

    @RequestMapping("/addHistory")
    public void addItemToHostory(Long userId, Long itemId) {
        Watched watched = new Watched();
        watched.setItemId(itemId);
        watched.setUserId(userId);
        watched.setCreated(new Date());
    }
}
