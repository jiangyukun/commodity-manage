package com.ieebook.wxshop.weixin.dto.reply;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlCData;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.ieebook.wxshop.weixin.dto.common.GenericXmlMessage;

/**
 * jiangyukun on 2015-11-08 13:16.
 */
public class TextMessage extends GenericXmlMessage {
    @JacksonXmlProperty(localName = "Content")
    @JacksonXmlCData
    private String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
