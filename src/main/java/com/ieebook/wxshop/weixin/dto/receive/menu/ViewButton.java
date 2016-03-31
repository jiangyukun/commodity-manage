package com.ieebook.wxshop.weixin.dto.receive.menu;

/**
 * jiangyukun on 2015-11-21 20:04.
 */
public class ViewButton extends Button {
    private String url;

    public ViewButton(String name, String url) {
        super(name, Button.BUTTON_TYPE_VIEW);
        setUrl(url);
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
