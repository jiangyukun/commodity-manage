package com.ieebook.wxshop.weixin.dto.receive.event;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlCData;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.ieebook.wxshop.weixin.dto.receive.event.support.BaseEvent;

/**
 * jiangyukun on 2015-11-07 23:36.
 */
public class MenuEvent extends BaseEvent {
    @JacksonXmlProperty(localName = "EventKey")
    @JacksonXmlCData
    private String eventKey;

    public String getEventKey() {
        return eventKey;
    }

    public void setEventKey(String eventKey) {
        this.eventKey = eventKey;
    }
}
