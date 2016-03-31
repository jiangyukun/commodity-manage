package com.ieebook.wxshop.core.annotation;

import org.springframework.context.annotation.Conditional;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * jiangyukun on 2015-11-05 11:53
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Conditional(DebugCondition.class)
public @interface Debug {
}
