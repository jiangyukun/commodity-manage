package com.ieebook.wxshop.weixin.dto.receive.message.support;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.ieebook.wxshop.weixin.dto.common.GenericXmlMessage;

/**
 * jiangyukun on 2015-11-07 19:15.
 */
public class BaseXmlMessage extends GenericXmlMessage {

    @JacksonXmlProperty(localName = "MsgId")
    private String msgId;

    public String getMsgId() {
        return msgId;
    }

    public void setMsgId(String msgId) {
        this.msgId = msgId;
    }

}
