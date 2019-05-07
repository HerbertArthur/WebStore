package com.webstore.service.impl;

import com.webstore.dao.UserClassifyMapper;
import com.webstore.domain.UserClassify;
import com.webstore.domain.UserClassifyExample;
import com.webstore.service.UserClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserClassifyServiceImpl implements UserClassifyService {

    @Autowired
    private UserClassifyMapper userClassifyMapper;

    public void saveUserClassify(UserClassify userClassify){
        userClassifyMapper.insert(userClassify);
    }

    public void delAllUserC(){
        UserClassifyExample userClassifyExample = new UserClassifyExample();
        UserClassifyExample.Criteria criteria = userClassifyExample.createCriteria();
        criteria.andIdIsNotNull();
        userClassifyMapper.deleteByExample(userClassifyExample);
    }

    public List<UserClassify> getUserGroupBycId(Long cId){
        UserClassifyExample userClassifyExample = new UserClassifyExample();
        UserClassifyExample.Criteria criteria = userClassifyExample.createCriteria();
        criteria.andCIdEqualTo(cId);
        return userClassifyMapper.selectByExample(userClassifyExample);
    }

    public List<Map<String, Object>> getGroup(){
        return userClassifyMapper.selectGroup();
    }


}
