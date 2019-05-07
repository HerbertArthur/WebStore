import com.webstore.dao.UserMapper;
import com.webstore.dao.WatchedMapper;
import com.webstore.domain.*;
import com.webstore.service.FpgResultService;
import com.webstore.service.UserClassifyService;
import com.webstore.utils.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import sun.awt.geom.AreaOp;

import java.util.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml"})
public class testMain {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private WatchedMapper watchedMapper;

    @Autowired
    private UserClassifyService userClassifyService;

    @Autowired
    private FpgResultService fpgResultService;

    @Test
    public void fun1(){
//        fpgResultService.delAllFpgRByuId(1001l);
    }

    @Test
    public void classifyUser() {
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
                System.out.println(p.getUserName() + "--->" +"age:"+ p.getAge() + "," +"sex:"+ p.getSex() + ","
                        +"buyNum:"+ p.getBuyNum());
            }
        }
        return;
    }

    @Test
    public void testFp(){
        LinkedList<LinkedList<String>> records = new LinkedList<>();
        WatchedExample watchedExample = new WatchedExample();
        watchedExample.setOrderByClause("id ASC");
        WatchedExample.Criteria criteria = watchedExample.createCriteria();
        criteria.andIdIsNotNull();
        criteria.andItemIdIsNotNull();
        criteria.andUserIdIsNotNull();
        List<FPGWatched> fpgWatcheds = watchedMapper.selectDistinctWatched(1001l);
//        List<Watched> watchedList = watchedMapper.selectByExample(watchedExample);
        for (FPGWatched fpgWatched : fpgWatcheds) {
            LinkedList litm = new LinkedList<String>();
            String[] str=fpgWatched.getItemIds().split(";");
            for(int i=0;i<str.length;i++){
                litm.add(str[i].trim());
            }
            records.add(litm);
        }

        ShopFPGrowth fpg = new ShopFPGrowth(records);
        LinkedList<FPTreeNode> orderheader=fpg.buildHeaderLink(records);
        fpg.orderF1(orderheader);
        fpg.fpgrowth(records,null);
        fpg.getRelationRules(fpg.frequentCollectionMap);
        System.out.println(fpg.rules);
        Map<Map<String, String>, Double> rules = fpg.rules;
        for (Map<String, String> keyMap: rules.keySet()) {
            FpgResult fpgResult = new FpgResult();
            fpgResult.setUserId(1001l);
            String str = keyMap.toString().replaceAll("\\{", "")
                    .replaceAll("=", "").replaceAll("\\}", "");
            str = str.substring(0, str.length() - 1);
            fpgResult.setAssociateItems(str);
            fpgResult.setValue(rules.get(keyMap));
            fpgResultService.saveFpgResult(fpgResult);
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
//            userMapper.insert(user);
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





    @Test
    public void genWatchData(){
        int id = 1000;
        for (int i = 0; i< 10; ++i){
            double random = Math.random() * 10000 % 100;
            Watched watched = new Watched();
            watched.setUserId(1001l);
            watched.setItemId(8l);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(new Date());
            calendar.set(Calendar.DAY_OF_MONTH, calendar.get(Calendar.DAY_OF_MONTH)- 1 );
            watched.setCreated(calendar.getTime());
            watchedMapper.insert(watched);


//            watched = watchedMapper.selectByPrimaryKey(new Integer(i).longValue() + 1);
//            watched.setCreated(new Date());
//            watchedMapper.updateByPrimaryKey(watched);
        }
    }


}