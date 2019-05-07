package com.webstore.dao;

import com.webstore.domain.FpgResult;
import com.webstore.domain.FpgResultExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FpgResultMapper {
    int countByExample(FpgResultExample example);

    int deleteByExample(FpgResultExample example);

    int deleteByPrimaryKey(Long id);

    int insert(FpgResult record);

    int insertSelective(FpgResult record);

    List<FpgResult> selectByExample(FpgResultExample example);

    FpgResult selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") FpgResult record, @Param("example") FpgResultExample example);

    int updateByExample(@Param("record") FpgResult record, @Param("example") FpgResultExample example);

    int updateByPrimaryKeySelective(FpgResult record);

    int updateByPrimaryKey(FpgResult record);
}