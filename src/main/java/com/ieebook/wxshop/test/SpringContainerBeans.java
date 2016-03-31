package com.ieebook.wxshop.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class SpringContainerBeans implements BeanPostProcessor, ApplicationContextAware {
    private static final Logger logger = LoggerFactory.getLogger(SpringContainerBeans.class);

    //    private ApplicationContext applicationContext;
    private String level;

    @Override
    public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
        logger.debug(this.level + ": " + bean.getClass().getName());
        return bean;
    }

    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
        return bean;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
//        this.applicationContext = applicationContext;
        this.level = applicationContext.getParent() == null ? "Root" : "Web";
    }
}
