package com.ieebook.wxshop.weixin.dto.receive.message;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlCData;
import com.ieebook.wxshop.weixin.dto.receive.message.support.BaseXmlMessage;

/**
 * jiangyukun on 2015-11-07 19:30.
 */
public class LinkXmlMessage extends BaseXmlMessage {

    @JsonProperty("Title")
    @JacksonXmlCData
    private String title;

    @JsonProperty("Description")
    @JacksonXmlCData
    private String description;

    @JsonProperty("Url")
    @JacksonXmlCData
    private String url;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
