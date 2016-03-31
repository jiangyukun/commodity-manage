package com.ieebook.wxshop.core.util;

import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * jiangyukun on 2015-11-06 21:43
 */
public class PropUtils {

    public static String getKey(InputStream inputStream, String key, String defaultValue) throws IOException {
        Properties properties = new Properties();
        properties.load(inputStream);
        String value = properties.getProperty(key);
        return StringUtils.isEmpty(value) ? defaultValue : value;
    }

    public static String getKey(InputStream inputStream, String key) throws IOException {
        Properties properties = new Properties();
        properties.load(inputStream);
        return properties.getProperty(key);
    }
}
