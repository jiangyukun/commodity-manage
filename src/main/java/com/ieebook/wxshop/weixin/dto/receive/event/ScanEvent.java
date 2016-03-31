package com.ieebook.wxshop.weixin.dto.receive.event;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlCData;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

/**
 * 用户扫描带场景值二维码时，可能推送以下两种事件：
 * 如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
 * 如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者。
 * jiangyukun on 2015-11-07 23:32.
 */
public class ScanEvent {
    @JacksonXmlProperty(localName = "EventKey")
    @JacksonXmlCData
    private String eventKey;

    @JacksonXmlProperty(localName = "Ticket")
    @JacksonXmlCData
    private String ticket;

    public String getEventKey() {
        return eventKey;
    }

    public void setEventKey(String eventKey) {
        this.eventKey = eventKey;
    }

    public String getTicket() {
        return ticket;
    }

    public void setTicket(String ticket) {
        this.ticket = ticket;
    }
}
