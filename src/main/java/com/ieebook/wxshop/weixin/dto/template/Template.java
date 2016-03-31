package com.ieebook.wxshop.weixin.dto.template;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * jiangyukun on 2016/2/24.
 */
public class Template {
    @JsonProperty("touser")
    private String toUser;

    @JsonProperty("template_id")
    private String templateId;

    @JsonProperty("url")
    private String url;

    public String getToUser() {
        return toUser;
    }

    public void setToUser(String toUser) {
        this.toUser = toUser;
    }

    public String getTemplateId() {
        return templateId;
    }

    public void setTemplateId(String templateId) {
        this.templateId = templateId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    static class Data {

    }

    static class ValueColor {
        private String value;
        private String color;

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }

        public String getColor() {
            return color;
        }

        public void setColor(String color) {
            this.color = color;
        }
    }
}
