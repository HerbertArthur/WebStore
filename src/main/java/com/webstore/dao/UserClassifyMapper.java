package com.webstore.dao;

import com.webstore.domain.UserClassify;
import com.webstore.domain.UserClassifyExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface UserClassifyMapper {
    int countByExample(UserClassifyExample example);

    int deleteByExample(UserClassifyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(UserClassify record);

    int insertSelective(UserClassify record);

    List<UserClassify> selectByExample(UserClassifyExample example);

    UserClassify selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UserClassify record, @Param("example") UserClassifyExample example);

    int updateByExample(@Param("record") UserClassify record, @Param("example") UserClassifyExample example);

    int updateByPrimaryKeySelective(UserClassify record);

    int updateByPrimaryKey(UserClassify record);

    List<Map<String, Object>> selectGroup();
}


