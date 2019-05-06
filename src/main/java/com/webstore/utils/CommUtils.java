package com.webstore.utils;

import java.util.Calendar;
import java.util.Date;

public class CommUtils {

    /**
     * 判断字符串是否为空
     * @param str
     * @return
     */
    public static boolean strIsNull(String str){
        if (null == str || "".equals(str)){
            return true;
        } else {
            return false;
        }
    }

    /**
     * 根据生日返回年龄(周岁)
     * @param birth
     * @return
     */
    public static int getAgeByBirth(Date birth){
        int age = 0;
        Calendar nowCal = Calendar.getInstance();
        nowCal.setTime(new Date());
        Calendar birthCal = Calendar.getInstance();
        birthCal.setTime(birth);
        //生日在当前时间之后，返回0
        if (birthCal.after(nowCal)){
            return age;
        } else {
            age = nowCal.get(Calendar.YEAR) - birthCal.get(Calendar.YEAR);
            if (nowCal.get(Calendar.DAY_OF_YEAR) > birthCal.get(Calendar.DAY_OF_YEAR)){
                age += 1;
            }
            return age;
        }
    }

    /**
     * 测试用主函数
     * @param args
     */
    public static void main(String []args){
        Calendar calendar = Calendar.getInstance();
        calendar.set(1996, 5, 23);
        Date time = calendar.getTime();
        System.out.println(">>>>>age:"+CommUtils.getAgeByBirth(time));
    }
}
