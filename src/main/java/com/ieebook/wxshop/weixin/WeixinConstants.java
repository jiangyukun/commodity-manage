package com.ieebook.wxshop.weixin;

/**
 * jiangyukun on 2015-11-07 21:42.
 */
public class WeixinConstants {
    public static class Message {

        public static final String TEXT = "text";
        public static final String IMAGE = "image";
        public static final String VOICE = "voice";
        public static final String VIDEO = "video";
        public static final String SHORT_VIDEO = "shortvideo";
        public static final String POSITION = "position";
        public static final String LINK = "link";
    }

    public static class Event {
        public static final String SUBSCRIBE = "subscribe";
        public static final String UNSUBSCRIBE = "unsubscribe";
        public static final String LOCATION = "LOCATION";
        public static final String CLICK = "CLICK";
        public static final String VIEW = "VIEW";
    }

    public static class WebPageType {
        public static final String BASE = "snsapi_base";
        public static final String USER_INFO = "snsapi_userinfo";
    }
}
