package com.ieebook.wxshop.core.util;

import com.fasterxml.jackson.dataformat.xml.XmlMapper;

/**
 * jiangyukun on 2015-11-07 22:27.
 */
public class XmlUtils {
    private static final XmlMapper xmlMapper = new XmlMapper();

    public static <T> T xml2Obj(String xml, Class<T> type) throws Exception {
        return xmlMapper.readValue(xml, type);
    }

    public static String obj2Xml(Object obj) throws Exception {
        return xmlMapper.writeValueAsString(obj);
    }

    /**
     * 去掉xmlns=""
     */
    public static String obj2XmlWithoutNS(Object obj) throws Exception {
        return xmlMapper.writeValueAsString(obj).replace(" xmlns=\"\"", "");
    }
}
