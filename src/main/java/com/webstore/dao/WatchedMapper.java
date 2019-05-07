package com.webstore.dao;

import com.webstore.domain.FPGWatched;
import com.webstore.domain.Watched;
import com.webstore.domain.WatchedExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WatchedMapper {
    int countByExample(WatchedExample example);

    int deleteByExample(WatchedExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Watched record);

    int insertSelective(Watched record);

    List<Watched> selectByExample(WatchedExample example);

    Watched selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Watched record, @Param("example") WatchedExample example);

    int updateByExample(@Param("record") Watched record, @Param("example") WatchedExample example);

    int updateByPrimaryKeySelective(Watched record);

    int updateByPrimaryKey(Watched record);

    List<FPGWatched> selectDistinctWatched(Long userId);
}