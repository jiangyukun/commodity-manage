package com.ieebook.wxshop.core.exception;

/**
 * jiangyukun on 2015-11-05 13:31
 */
public class JsonException extends Exception {
    public JsonException(String message) {
        super(message);
    }

    public JsonException(Throwable t) {
        super(t);
    }

    public JsonException(String message, Throwable t) {
        super(message, t);
    }
}
