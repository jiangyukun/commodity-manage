package com.ieebook.wxshop.web.support;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * jiangyukun on 2015-11-05 16:48
 */
public class BaseController {
    protected final Logger logger = LoggerFactory.getLogger(getClass());
    /*********************获取Request与Response*******************/
    /**
     * 当前的请求对象
     *
     * @return
     */
    protected HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
    }

    /**
     * 根据参数名称获取参数值，如果没有找到则以默认值返回
     *
     * @param name
     * @param defaultValue
     * @return
     */
    protected String getParam(String name, String defaultValue) {
        HttpServletRequest request = this.getRequest();
        String strValue = request.getParameter(name);
        return strValue == null ? defaultValue : strValue;
    }

    /**
     * 获取指定的配置
     *
     * @param name
     * @return
     */
    protected String getParam(String name) {
        return getParam(name, "");
    }
}
