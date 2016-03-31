package com.ieebook.wxshop.core.util;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * jiangyukun on 2015-11-23 10:57
 */
public class SmsUtilsTest {

    @Test
    public void testSendSms() throws Exception {
        SmsUtils.sendSms("ieebook", "168106ee4cb2b9e881ee", "18768105877", "");
    }
}