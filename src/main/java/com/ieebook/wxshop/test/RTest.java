package com.ieebook.wxshop.test;

import java.lang.reflect.Field;

/**
 * jiangyukun on 2015-12-08 10:31
 */
public class RTest {
    private String a = "xx";

    public static void main(String[] args) throws Exception {
        RTest test = new RTest();
        Field a = RTest.class.getDeclaredField("a");
        String str = (String) (a.get(test));
        System.out.println(str);
    }
}
