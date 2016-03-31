package com.ieebook.wxshop.core.util;

import com.ieebook.wxshop.weixin.dto.receive.message.support.BaseXmlMessage;

import org.junit.Assert;
import org.junit.Test;

/**
 * jiangyukun on 2015-11-07 22:34.
 */
public class XmlUtilsTest {

    @Test
    public void testObj2XmlWithoutNS() throws Exception {
        BaseXmlMessage message = new BaseXmlMessage();
        String xml = XmlUtils.obj2XmlWithoutNS(message);
        Assert.assertFalse(xml.contains(" xmlns\"\""));
    }
}
