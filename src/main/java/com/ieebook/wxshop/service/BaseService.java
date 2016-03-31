package com.ieebook.wxshop.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * jiangyukun on 2015-11-08 20:20.
 */
public class BaseService {
    @Autowired
    protected SqlSessionTemplate sqlSessionTemplate;

    public class ServiceSpec {
        public static final String NAMESPACE = "com.ieebook.wxshop.service.";
    }
}
