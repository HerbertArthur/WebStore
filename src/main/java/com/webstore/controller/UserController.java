package com.webstore.controller;


import com.webstore.domain.User;
import com.webstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;


@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;


    @RequestMapping("/userRegister")
    public ModelAndView userRegister(User user){
        User user1 = new User();
        user1.setUserName("马");
        user1.setPassword("123456");
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String formatDate = simpleDateFormat.format(date);
        user1.setBirthday(date);
        ModelAndView modelAndView = new ModelAndView();
        try {
            userService.addOneUser(user1);
            modelAndView.addObject(null);
            modelAndView.setViewName("");
            return modelAndView;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
}
