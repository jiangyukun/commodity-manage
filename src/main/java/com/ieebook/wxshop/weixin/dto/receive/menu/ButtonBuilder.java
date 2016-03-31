package com.ieebook.wxshop.weixin.dto.receive.menu;

/**
 * jiangyukun on 2015-11-06 23:42
 */
public class ButtonBuilder {

    public static Button builder(String type, String name, String keyOrUrl) {
        switch (type) {
            case Button.BUTTON_TYPE_CLICK:
                return new ClickButton(name, keyOrUrl);
            case Button.BUTTON_TYPE_VIEW:
                return new ViewButton(name, keyOrUrl);
            default:
                throw new IllegalArgumentException("error button type");
        }
    }
}
