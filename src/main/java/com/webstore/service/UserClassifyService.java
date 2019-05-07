package com.webstore.service;

import com.webstore.domain.UserClassify;
import java.util.List;
import java.util.Map;

public interface UserClassifyService {

    void saveUserClassify(UserClassify userClassify);

    void delAllUserC();

    List<UserClassify> getUserGroupBycId(Long cId);

    List<Map<String, Object>> getGroup();
}
