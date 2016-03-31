package com.ieebook.wxshop.test.filter;

import com.ieebook.wxshop.core.AppConfig;
import com.ieebook.wxshop.core.Phase;
import com.ieebook.wxshop.test.TestConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * jiangyukun on 2015/11/24
 */
@WebFilter(urlPatterns = {"/*"})
public class DevFilter implements Filter {
    private static final Logger logger = LoggerFactory.getLogger(DevFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        if (AppConfig.CURRENT_PHASE == Phase.DEV) {
            logger.info("start filter: DevFilter");
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (AppConfig.CURRENT_PHASE == Phase.DEV) {
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            httpRequest.getSession().setAttribute("openId", "dev");
            httpRequest.getSession().setAttribute("merchantId", TestConfig.testMerchantId);
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
