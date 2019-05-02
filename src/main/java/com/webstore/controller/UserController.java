package com.webstore.controller;


import com.webstore.domain.SystemicInfo;
import com.webstore.domain.User;
import com.webstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping("/userLogin")
    public SystemicInfo userLogin(String username, String password, HttpServletRequest request){
        User user = userService.userLogin(username, password);
        SystemicInfo systemicInfo = new SystemicInfo();
        if (user != null) {
            request.getSession().setAttribute("user", user);
            systemicInfo.setMsg("登录成功...");
            systemicInfo.setStatus(200);
            systemicInfo.setRedirectUrl("");
        } else {
            systemicInfo.setMsg("用户名或密码错误...");
            systemicInfo.setStatus(500);
            systemicInfo.setRedirectUrl("/login.jsp");
        }
        return systemicInfo;
    }

    @ResponseBody
    @RequestMapping("/userRegister")
    public SystemicInfo userRegister(String username, String password, String phone){
        SystemicInfo systemicInfo = new SystemicInfo();
        User user = new User();
        user.setUserName(username);
        user.setPassword(password);
        user.setPhone(phone);
        try{
            userService.userRegister(user);
            systemicInfo.setStatus(200);
        } catch (Exception e){
            systemicInfo.setStatus(500);
        }
        return systemicInfo;
    }
}
