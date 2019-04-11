package com.webstore.service.impl;


import com.webstore.dao.UserMapper;
import com.webstore.domain.User;
import com.webstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public void addOneUser(User user) {
        userMapper.addUser(user);
    }
}
