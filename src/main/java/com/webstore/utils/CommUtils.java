package com.webstore.utils;

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
}
