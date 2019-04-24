package com.jt.dao;

import com.jt.entity.Watched;
import com.jt.entity.WatchedExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WatchedMapper {
    int countByExample(WatchedExample example);

    int deleteByExample(WatchedExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Watched record);

    int insertSelective(Watched record);

    List<Watched> selectByExample(WatchedExample example);

    Watched selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Watched record, @Param("example") WatchedExample example);

    int updateByExample(@Param("record") Watched record, @Param("example") WatchedExample example);

    int updateByPrimaryKeySelective(Watched record);

    int updateByPrimaryKey(Watched record);
}