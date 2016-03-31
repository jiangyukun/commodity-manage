package com.ieebook.wxshop.weixin.dto.receive.message;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlCData;
import com.ieebook.wxshop.weixin.WeixinConstants;
import com.ieebook.wxshop.weixin.dto.common.GenericXmlMessage;
import com.ieebook.wxshop.weixin.dto.receive.message.support.BaseXmlMessage;

/**
 * jiangyukun on 2015-11-07 19:22.
 */
public class TextXmlMessage extends BaseXmlMessage {
    private static final String TEXT_TYPE = WeixinConstants.Message.TEXT;
    @JsonProperty("Content")
    @JacksonXmlCData
    private String content;

    public TextXmlMessage() {
    }

    public TextXmlMessage(GenericXmlMessage genericXmlMessage) {
        this.setCreateTime(genericXmlMessage.getCreateTime());
        this.setMsgType(TEXT_TYPE);
        this.setFromUserName(genericXmlMessage.getToUserName());
        this.setToUserName(genericXmlMessage.getFromUserName());
        if (genericXmlMessage instanceof TextXmlMessage) {
            TextXmlMessage textMessage = (TextXmlMessage) genericXmlMessage;
            this.setContent(textMessage.getContent());
        } else {
            this.setContent(genericXmlMessage.getMsgType());
        }
        if (genericXmlMessage instanceof BaseXmlMessage) {
            BaseXmlMessage baseMessage = (BaseXmlMessage) genericXmlMessage;
            this.setMsgId(baseMessage.getMsgId());
        }
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
