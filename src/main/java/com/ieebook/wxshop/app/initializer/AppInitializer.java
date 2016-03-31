package com.ieebook.wxshop.app.initializer;

import com.ieebook.wxshop.core.AppConfig;
import org.apache.logging.log4j.core.LoggerContext;
import org.springframework.core.annotation.Order;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.WebApplicationInitializer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import java.io.IOException;

/**
 * jiangyukun on 2015-11-06 15:50
 */
@Order(1)
public class AppInitializer implements WebApplicationInitializer {
    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {

        String fileName = "log4j2-" + AppConfig.CURRENT_PHASE.name().toLowerCase() + ".xml";
        ClassPathResource resource = new ClassPathResource(fileName);
        LoggerContext context = LoggerContext.getContext(false);
        try {
            context.setConfigLocation(resource.getURI());
        } catch (IOException e) {
            throw new ServletException(e.getMessage(), e);
        }
        context.reconfigure();
    }
}
