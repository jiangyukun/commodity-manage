package com.ieebook.wxshop.core;

/**
 * jiangyukun on 2015-11-06 17:01
 */
public class AppConfig {

    /**
     * 当前开发阶段
     * 根据这个来动态的加载配置文件，和是否添加Bean到Spring容器内，来改变程序的行为
     */
    public static final Phase CURRENT_PHASE = Phase.DEV;


    public static String getPhase() {
        return CURRENT_PHASE.name().toLowerCase();
    }
}
