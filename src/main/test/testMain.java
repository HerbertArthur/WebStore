package com.webstore.utils;

import com.webstore.dao.UserMapper;
import com.webstore.domain.User;
import com.webstore.domain.UserExample;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml"})
public class testMain {

    @Autowired
    private UserMapper userMapper;

    @Test
    public void main() {
        UserExample userExample = new UserExample();
        List<User> userList = userMapper.selectByExample(userExample);
        List<KmeansUser> kmeansUserList = new ArrayList<>();
        for (User user : userList) {
            KmeansUser kmeansUser = new KmeansUser();
            kmeansUser.setUserId(user.getUserId());
            kmeansUser.setUserName(user.getUserName());
            CommUtils.getAgeByBirth(user.getBirth());
            kmeansUser.setAge(CommUtils.getAgeByBirth(user.getBirth()) * 1.0);
            kmeansUser.setSex(user.getSex() * 1.0);
            kmeansUser.setBuyNum(user.getBuyNum() * 1.0);
            kmeansUserList.add(kmeansUser);
        }

        Kmeans<KmeansUser> kmeans = new Kmeans<>(kmeansUserList,3);
        List<KmeansUser>[] results = kmeans.comput();
        for (int i = 0; i < results.length; i++) {
            System.out.println("===========类别" + (i + 1) + "================");
            List<KmeansUser> list = results[i];
            for (KmeansUser p : list) {
                System.out.println(p.getUserName() + "--->"
                        + p.getAge() + "," + p.getSex() + ","
                        + p.getBuyNum());
            }
        }
    }

    @Test
    public void genData(){
        int id = 1004;
        for (int i = 0; i< 100; ++i){
            User user = new User();
            user.setUserId(new Integer(id + i).longValue());
            user.setUserName("lihua-"+i);
            double random = Math.random() * 10000 % 100;
            user.setBuyNum(new Double(random).longValue());
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(new Date());
            calendar.set(Calendar.YEAR, calendar.get(Calendar.YEAR) - new Double(random).intValue());
            user.setBirth(calendar.getTime());
            user.setSex(new Double(Math.random()+ 0.5).intValue());

            System.out.println(user);
        }
    }

    @Test
    public void delData(){
        int id = 1010;
        for (int i=0; i<100; ++i){
            long userId = new Integer(id + i).longValue();
            User user = userMapper.selectByPrimaryKey(userId);
            user.setSex(new Double(Math.random() + 0.5).intValue());
            userMapper.deleteByPrimaryKey(user.getUserId());

        }
    }



}