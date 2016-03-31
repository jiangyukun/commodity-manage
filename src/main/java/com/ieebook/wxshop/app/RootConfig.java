package com.ieebook.wxshop.app;

import com.ieebook.wxshop.core.AppConfig;
import com.ieebook.wxshop.core.annotation.Debug;
import com.ieebook.wxshop.core.util.PropUtils;
import com.ieebook.wxshop.test.SpringContainerBeans;
import com.ieebook.wxshop.weixin.WeiAPIFactory;
import com.ieebook.wxshop.weixin.WeixinAPI;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;

import javax.sql.DataSource;
import java.io.IOException;

/**
 * jiangyukun on 2015-11-05 11:25
 */
@Configuration
@ComponentScan(basePackages = "com.ieebook.wxshop",
        excludeFilters = {
                @ComponentScan.Filter(type = FilterType.REGEX, pattern = "com.ieebook.wxshop.app.*"),
                @ComponentScan.Filter(type = FilterType.REGEX, pattern = "com.ieebook.wxshop.web.*")
        })
@Import(MyBatisConfig.class)
@PropertySource("classpath:/appconfig/db.properties")
public class RootConfig {
    private static final Logger logger = LoggerFactory.getLogger(RootConfig.class);

    @Bean
    @Debug
    public SpringContainerBeans springContainerBeans() {
        return new SpringContainerBeans();
    }

    @Bean(name = "wxApi")
    public WeixinAPI weixinAPI() throws IOException {
        ClassPathResource weixinConfigResource = new ClassPathResource("/weixin/weixin-" + AppConfig.getPhase() + ".properties");
        String appId = PropUtils.getKey(weixinConfigResource.getInputStream(), "AppID", "---");
        String appSecret = PropUtils.getKey(weixinConfigResource.getInputStream(), "AppSecret", "---");
        return WeiAPIFactory.getWeixinAPI(appId, appSecret);
    }

    @Bean
    public DataSource dataSource(@Value("${driverClass}") String driverClass,
                                 @Value("${jdbcUrl}") String jdbcUrl,
                                 @Value("${user}") String user,
                                 @Value("${password}") String password,
                                 @Value("${minPoolSize}") int minPoolSize,
                                 @Value("${maxPoolSize}") int maxPoolSize,
                                 @Value("${initialPoolSize}") int initialPoolSize) throws Exception {
        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        dataSource.setUser(user);
        dataSource.setPassword(password);
        dataSource.setDriverClass(driverClass);
        dataSource.setJdbcUrl(jdbcUrl);
        dataSource.setMaxPoolSize(maxPoolSize);
        dataSource.setMinPoolSize(minPoolSize);
        dataSource.setInitialPoolSize(initialPoolSize);
        dataSource.setMaxIdleTime(120);
        dataSource.setAcquireIncrement(1);
        return dataSource;
    }

    @Bean
    public static PropertySourcesPlaceholderConfigurer propertyConfigInDev() {
        return new PropertySourcesPlaceholderConfigurer();
    }
}
