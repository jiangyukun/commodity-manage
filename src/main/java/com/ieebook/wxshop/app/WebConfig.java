package com.ieebook.wxshop.app;

import com.ieebook.wxshop.core.annotation.Debug;
import com.ieebook.wxshop.test.PrintLogExceptionResolver;
import com.ieebook.wxshop.test.SpringContainerBeans;
import org.springframework.context.annotation.*;
import org.springframework.http.converter.ByteArrayHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.http.converter.xml.MappingJackson2XmlHttpMessageConverter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.io.IOException;
import java.util.List;

/**
 * jiangyukun on 2015-11-05 11:26
 */
@Configuration
@ComponentScan(basePackages = {"com.ieebook.wxshop"},
        includeFilters = {@ComponentScan.Filter(type = FilterType.REGEX, pattern = "com.ieebook.wxshop.web.*")},
        excludeFilters = {@ComponentScan.Filter(type = FilterType.REGEX, pattern = "com.ieebook.wxshop.app.*")})
@EnableWebMvc
@EnableAspectJAutoProxy
public class WebConfig extends WebMvcConfigurerAdapter {
    @Bean
    @Debug
    public SpringContainerBeans springContainerBeans() {
        return new SpringContainerBeans();
    }

    @Bean
    public PrintLogExceptionResolver printLogExceptionResolver() {
        return new PrintLogExceptionResolver();
    }

    @Bean
    public InternalResourceViewResolver internalResourceViewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/view/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Bean
    public CommonsMultipartResolver multipartResolver() throws IOException {
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
        commonsMultipartResolver.setDefaultEncoding("utf-8");
//        commonsMultipartResolver.setUploadTempDir(new ClassPathResource("/tmp"));
        return commonsMultipartResolver;
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(new ByteArrayHttpMessageConverter());
        converters.add(new StringHttpMessageConverter());
        converters.add(new MappingJackson2XmlHttpMessageConverter());
        converters.add(new MappingJackson2HttpMessageConverter());
    }
}
