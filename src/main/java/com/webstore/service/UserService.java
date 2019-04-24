package com.webstore.service;


import com.webstore.domain.User;

public interface UserService {

    void userRegister(User user);

    /**
     * 用户登录
     * @param userName
     * @param password
     * @return
     */
    User userLogin(String userName, String password);

}
