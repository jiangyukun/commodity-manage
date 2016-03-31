package com.ieebook.wxshop.weixin.dto.receive.event.support;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlCData;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.ieebook.wxshop.weixin.dto.common.GenericXmlMessage;

/**
 * jiangyukun on 2015-11-07 23:26.
 */
public class BaseEvent extends GenericXmlMessage {

    @JacksonXmlProperty(localName = "Event")
    @JacksonXmlCData
    private String event;

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }

}
