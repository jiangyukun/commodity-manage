package com.ieebook.wxshop.core.exception;

/**
 * jiangyukun on 2015-11-05 13:31
 */
public class WeixinException extends RuntimeException {
    public WeixinException(String message) {
        super(message);
    }

    public WeixinException(Throwable throwable) {
        super(throwable);
    }

    public WeixinException(String message, Throwable throwable) {
        super(message, throwable);
    }
}
