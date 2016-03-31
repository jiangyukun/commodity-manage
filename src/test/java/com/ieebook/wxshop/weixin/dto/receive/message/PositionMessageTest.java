package com.ieebook.wxshop.weixin.dto.receive.message;

import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import org.junit.Test;

/**
 * jiangyukun on 2015-11-07 21:22.
 */
public class PositionMessageTest {

    @Test
    public void testPositionMessage() throws Exception {
        XmlMapper xmlMapper = new XmlMapper();
        PositionXmlMessage message = new PositionXmlMessage();

        String result = xmlMapper.writeValueAsString(message);
        System.out.println(result);
        System.out.println(message);
    }

}