package com.ieebook.wxshop.app.initializer;

import org.springframework.web.WebApplicationInitializer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

/**
 * jiangyukun on 2016/3/17.
 */
public class PrimaryInitializer implements WebApplicationInitializer {
    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        System.out.println(111);
    }
}
