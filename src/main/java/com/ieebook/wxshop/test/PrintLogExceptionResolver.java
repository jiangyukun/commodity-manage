package com.ieebook.wxshop.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * jiangyukun on 2015-11-08 00:43.
 */
public class PrintLogExceptionResolver implements HandlerExceptionResolver {
    private static final Logger logger = LoggerFactory.getLogger(PrintLogExceptionResolver.class);

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        logger.error(ex.getMessage(), ex);
        return null;
    }
}
