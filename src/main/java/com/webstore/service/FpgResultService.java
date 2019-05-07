package com.webstore.service;

import com.webstore.domain.FpgResult;

import java.util.List;

public interface FpgResultService {

    void saveFpgResult(FpgResult fpgResult);

    void delAllFpgRByuId(Long uId);

    List<FpgResult> getFpgRByuId(Long uId);

}
