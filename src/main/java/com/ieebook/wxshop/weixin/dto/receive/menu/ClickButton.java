package com.ieebook.wxshop.weixin.dto.receive.menu;

/**
 * jiangyukun on 2015-11-21 20:01.
 */
public class ClickButton extends Button {

    public ClickButton(String name, String key) {
        super(name, Button.BUTTON_TYPE_CLICK);
        this.setKey(key);
    }

    private String key;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}
