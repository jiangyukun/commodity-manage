package com.ieebook.wxshop.weixin.dto.receive.message;

import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.ieebook.wxshop.weixin.dto.receive.message.support.BaseXmlMessage;
import org.junit.Test;

/**
 * jiangyukun on 2015-11-07 19:41.
 */
public class BaseMessageTest {
    @Test
    public void testXml() throws Exception{
        XmlMapper xmlMapper = new XmlMapper();
        BaseXmlMessage message = new BaseXmlMessage();
//        xmlMapper.setAnnotationIntrospector(null);

        String result  = xmlMapper.writeValueAsString(message);
        System.out.println(result);
    }

}