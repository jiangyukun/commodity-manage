package com.ieebook.wxshop.core;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;

import java.io.InputStream;
import java.util.Properties;

/**
 * jiangyukun on 2015-11-23 11:30
 */
public class SystemConfig {
    private static final Logger logger = LoggerFactory.getLogger(SystemConfig.class);
    public static InputStream inputStream;
    public static Properties properties = new Properties();

    static {
        try {
            inputStream = new ClassPathResource("/appconfig/system.properties").getInputStream();
            properties.load(inputStream);
        } catch (Exception e) {
            logger.error("system.properties load failure", e);
        }
    }

    public static String get(String key) {
        return properties.get(key).toString();
    }
}
