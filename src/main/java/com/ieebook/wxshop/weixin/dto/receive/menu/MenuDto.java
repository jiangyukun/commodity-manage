package com.ieebook.wxshop.weixin.dto.receive.menu;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;

/**
 * jiangyukun on 2015-11-06 22:53
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class MenuDto {
    private List<Button> button;

    public List<Button> getButton() {
        return button;
    }

    public void setButton(List<Button> button) {
        this.button = button;
    }
}
