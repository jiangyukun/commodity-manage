package com.ieebook.wxshop.weixin.dto.common;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlCData;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

/**
 * jiangyukun on 2015-11-07 23:21.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@JacksonXmlRootElement(localName = "xml")
public class GenericXmlMessage {
    @JacksonXmlProperty(localName = "ToUserName")
    @JacksonXmlCData
    private String toUserName;

    @JacksonXmlProperty(localName = "FromUserName")
    @JacksonXmlCData
    private String fromUserName;

    @JacksonXmlProperty(localName = "CreateTime")
    private String createTime;

    @JacksonXmlProperty(localName = "MsgType")
    @JacksonXmlCData
    private String msgType;

    public String getToUserName() {
        return toUserName;
    }

    public void setToUserName(String toUserName) {
        this.toUserName = toUserName;
    }

    public String getFromUserName() {
        return fromUserName;
    }

    public void setFromUserName(String fromUserName) {
        this.fromUserName = fromUserName;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getMsgType() {
        return msgType;
    }

    public void setMsgType(String msgType) {
        this.msgType = msgType;
    }

}
