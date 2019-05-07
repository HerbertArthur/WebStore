package com.webstore.controller;

import com.webstore.domain.*;
import com.webstore.service.FpgResultService;
import com.webstore.service.UserClassifyService;
import com.webstore.service.UserService;
import com.webstore.service.WatchedService;
import com.webstore.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@RequestMapping("/cluster_asso")
public class ClusterAndAssoController {

    @Autowired
    private UserService userService;

    @Autowired
    private WatchedService watchedService;

    @Autowired
    private UserClassifyService userClassifyService;

    @Autowired
    private FpgResultService fpgResultService;

    /**
     * 用户聚类，并存储在数据库中
     */
    @ResponseBody
    @RequestMapping("/userClassify")
    public SystemicInfo userClassify(){
        SystemicInfo systemicInfo = new SystemicInfo();
        try {
            userClassifyService.delAllUserC();
            List<User> userList = userService.getAllUser();
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
            //第二个参数为聚类数
            Kmeans<KmeansUser> kmeans = new Kmeans<>(kmeansUserList,3);
            List<KmeansUser>[] results = kmeans.comput();
            for (int i = 1; i <= results.length; i++) {
                List<KmeansUser> list = results[i - 1];
                for (KmeansUser p : list) {
                    UserClassify userClassify = new UserClassify();
                    userClassify.setUserId(p.getUserId());
                    userClassify.setcId(new Integer(i).longValue());
                    userClassify.setcTitle("NO:" + String.format("%03d", i));
                    userClassify.setCreated(new Date());
                    userClassifyService.saveUserClassify(userClassify);
                }
            }
            systemicInfo.setStatus(200);
            systemicInfo.setMsg("聚类成功...");
        } catch (Exception e) {
            systemicInfo.setStatus(500);
            systemicInfo.setMsg("聚类遇到错误...");
            e.printStackTrace();

        }
        return systemicInfo;
    }

    /**
     * 根据聚类的分组，进行关联规则分析
     * @param cId 分组号
     * @return
     */
    @ResponseBody
    @RequestMapping("/associateItem")
    public SystemicInfo associateItem(Long cId){
        SystemicInfo systemicInfo = new SystemicInfo();
        try {
            List<UserClassify> userGroup = userClassifyService.getUserGroupBycId(cId);
            for (UserClassify userC : userGroup) {
                Long userId = userC.getUserId();
                //得到关联规则之间将旧的删除
                fpgResultService.delAllFpgRByuId(userId);
                //进行关联规则分析的数据
                LinkedList<LinkedList<String>> records = new LinkedList<>();
                //得到用户每天的浏览记录
                List<FPGWatched> dailyWatchedList = watchedService.getDailyWatchedByuId(userId);
                for (FPGWatched fpgWatched : dailyWatchedList) {
                    LinkedList litm = new LinkedList<String>();
                    String[] str=fpgWatched.getItemIds().split(";");
                    for(int i=0; i<str.length; i++){
                        litm.add(str[i].trim());
                    }
                    records.add(litm);
                }
                //分析记录
                ShopFPGrowth fpg = new ShopFPGrowth(records);
                LinkedList<FPTreeNode> orderheader=fpg.buildHeaderLink(records);
                fpg.orderF1(orderheader);
                fpg.fpgrowth(records,null);
                fpg.getRelationRules(fpg.frequentCollectionMap);
                //根据FPGrowth得到的用户浏览商品之间的关联规则
                Map<Map<String, String>, Double> rules = fpg.rules;
                for (Map<String, String> keyMap: rules.keySet()) {
                    FpgResult fpgResult = new FpgResult();
                    fpgResult.setUserId(userId);
                    String str = keyMap.toString().replaceAll("\\{", "")
                            .replaceAll("=", "").replaceAll("\\}", "");
                    str = str.substring(0, str.length() - 1);
                    fpgResult.setAssociateItems(str);
                    fpgResult.setValue(rules.get(keyMap));
                    //将关联规则写入数据库
                    fpgResultService.saveFpgResult(fpgResult);
                }
            }
            systemicInfo.setStatus(200);
            systemicInfo.setMsg("关联成功...");
        } catch (Exception e) {
            systemicInfo.setStatus(500);
            systemicInfo.setMsg("关联遇到错误...");
            e.printStackTrace();
        }
        return systemicInfo;
    }

    @ResponseBody
    @RequestMapping("/getUserGroup")
    public SystemicInfo getUserGroup(){
        SystemicInfo systemicInfo = new SystemicInfo();
        List<Map<String, Object>> group = userClassifyService.getGroup();
        systemicInfo.setResult(group);
        return systemicInfo;
    }


}
