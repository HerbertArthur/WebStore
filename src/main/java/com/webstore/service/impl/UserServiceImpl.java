package com.webstore.service.impl;


import com.webstore.dao.UserMapper;
import com.webstore.domain.User;
import com.webstore.domain.UserExample;
import com.webstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public void userRegister(User user) {
        userMapper.insertSelective(user);
    }

    @Override
    public User userLogin(String userName, String password){
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUserNameEqualTo(userName);
        criteria.andPasswordEqualTo(password);
        List<User> users = userMapper.selectByExample(userExample);
        return users.size() == 0 ? null : users.get(0);
    }

    @Override
    public List<User> getAllUser() {
        UserExample userExample = new UserExample();
        return userMapper.selectByExample(userExample);
    }
}
