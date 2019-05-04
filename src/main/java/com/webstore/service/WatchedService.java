package com.webstore.service;

import com.github.pagehelper.PageInfo;
import com.webstore.domain.Watched;

public interface WatchedService {

    /**
     * 查找用户浏览历史
     * @param userId
     * @param currentPage
     * @param pageSize
     * @return
     */
    PageInfo<Watched> selectHistoryByUser(Long userId, int currentPage, int pageSize);
}
