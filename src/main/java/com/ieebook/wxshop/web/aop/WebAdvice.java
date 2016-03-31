package com.ieebook.wxshop.web.aop;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.servlet.ModelAndView;

/**
 * jiangyukun on 2015/11/22.
 */
@ControllerAdvice(basePackages = {"com.ieebook.wxshop.web.controller"})
public class WebAdvice {

    @ExceptionHandler(Exception.class)
    public ModelAndView toErrorPage(NativeWebRequest request, Exception e) {
        e.printStackTrace();
        ModelAndView errorView = new ModelAndView();
        errorView.addObject("error", e.getMessage());
        errorView.setViewName("/error");
        return errorView;
    }
}
