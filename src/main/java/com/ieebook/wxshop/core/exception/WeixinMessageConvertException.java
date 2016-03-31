package com.ieebook.wxshop.core.exception;

/**
 * jiangyukun on 2015-11-07 23:49.
 */
public class WeixinMessageConvertException extends WeixinException {

    public WeixinMessageConvertException(String message) {
        super(message);
    }

    public WeixinMessageConvertException(String message, Throwable throwable) {
        super(message, throwable);
    }
}
