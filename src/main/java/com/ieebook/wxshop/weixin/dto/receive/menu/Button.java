package com.ieebook.wxshop.weixin.dto.receive.menu;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

/**
 * jiangyukun on 2015-11-06 23:38
 */
public class Button {
    public static final String BUTTON_TYPE_CLICK = "click";
    public static final String BUTTON_TYPE_VIEW = "view";

    private String type;
    private String name;

    @JsonProperty("sub_button")
    private List<Button> subButtons;

    public Button() {
    }

    public Button(String name, String type) {
        this.name = name;
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Button> getSubButtons() {
        return subButtons;
    }

    public void setSubButtons(List<Button> subButtons) {
        this.subButtons = subButtons;
    }
}
