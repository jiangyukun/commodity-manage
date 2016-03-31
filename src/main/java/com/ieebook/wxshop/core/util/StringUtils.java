package com.ieebook.wxshop.core.util;

/**
 * jiangyukun on 2015-11-23 11:57
 */
public class StringUtils {
    public static String randomNumber(int length) {
        String numStr = "";
        for (int i = 0; i < length; i++) {
            numStr += randomOne();
        }
        return numStr;
    }

    private static String randomOne() {
        return String.valueOf((int) (Math.random() * 10));
    }
}
