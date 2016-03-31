package com.ieebook.wxshop.core.util;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * jiangyukun on 2015-11-23 12:01
 */
public class StringUtilsTest {

    @Test
    public void testRandomNumber() throws Exception {
        String t = StringUtils.randomNumber(4);
        System.out.println(t);
    }
}