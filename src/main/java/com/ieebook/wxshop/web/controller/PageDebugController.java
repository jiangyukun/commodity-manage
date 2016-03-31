package com.ieebook.wxshop.web.controller;

import com.ieebook.wxshop.web.support.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * jiangyukun on 15-11-23.
 */
@Controller
@RequestMapping("/debug")
public class PageDebugController extends BaseController {
    @RequestMapping("/log")
    public void log(String content) {
        logger.info(content);
    }
}
