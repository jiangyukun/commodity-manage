package com.ieebook.wxshop.core.annotation;

import com.ieebook.wxshop.core.AppConfig;
import com.ieebook.wxshop.core.Phase;
import org.springframework.context.annotation.Condition;
import org.springframework.context.annotation.ConditionContext;
import org.springframework.core.type.AnnotatedTypeMetadata;

/**
 * jiangyukun on 2015-11-05 14:50
 */
public class ReleaseCondition implements Condition {
    @Override
    public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
        return AppConfig.CURRENT_PHASE == Phase.RELEASE;
    }
}
