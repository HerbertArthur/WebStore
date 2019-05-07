package com.webstore.service.impl;


import com.webstore.dao.FpgResultMapper;
import com.webstore.domain.FpgResult;
import com.webstore.domain.FpgResultExample;
import com.webstore.service.FpgResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FpgResultServiceImpl implements FpgResultService {

    @Autowired
    private FpgResultMapper fpgResultMapper;

    public void saveFpgResult(FpgResult fpgResult){
        fpgResultMapper.insert(fpgResult);
    }


    public void delAllFpgRByuId(Long uId){
        FpgResultExample fpgResultExample = new FpgResultExample();
        FpgResultExample.Criteria criteria = fpgResultExample.createCriteria();
        criteria.andUserIdEqualTo(uId);
        fpgResultMapper.deleteByExample(fpgResultExample);
    }

    public List<FpgResult> getFpgRByuId(Long uId){
        FpgResultExample fpgResultExample = new FpgResultExample();
        fpgResultExample.setOrderByClause("value DESC");
        FpgResultExample.Criteria criteria = fpgResultExample.createCriteria();
        criteria.andUserIdEqualTo(uId);
        return fpgResultMapper.selectByExample(fpgResultExample);
    }


}
