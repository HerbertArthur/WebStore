package com.webstore.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.webstore.dao.ItemMapper;
import com.webstore.dao.WatchedMapper;
import com.webstore.domain.FPGWatched;
import com.webstore.domain.Watched;
import com.webstore.domain.WatchedExample;
import com.webstore.service.WatchedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WatchedServiceImpl implements WatchedService {

    @Autowired
    private WatchedMapper watchedMapper;

    @Autowired
    private ItemMapper itemMapper;

    public PageInfo<Watched> selectHistoryByUser(Long userId, int currentPage, int pageSize) {
        WatchedExample watchedExample = new WatchedExample();
        WatchedExample.Criteria criteria = watchedExample.createCriteria();
        criteria.andUserIdEqualTo(userId);
        PageHelper.startPage(currentPage, pageSize);
        PageInfo<Watched> watchedPageInfo = new PageInfo<>(watchedMapper.selectByExample(watchedExample));
        for (Watched watched : watchedPageInfo.getList()) {
            watched.setItem(itemMapper.selectByPrimaryKey(watched.getItemId()));
        }

        return watchedPageInfo;
    }

    @Override
    public List<FPGWatched> getDailyWatchedByuId(Long uId) {
        return watchedMapper.selectDistinctWatched(uId);
    }
}
