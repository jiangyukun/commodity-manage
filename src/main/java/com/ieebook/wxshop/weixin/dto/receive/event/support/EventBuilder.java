package com.ieebook.wxshop.weixin.dto.receive.event.support;

import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.ieebook.wxshop.core.exception.WeixinMessageConvertException;
import com.ieebook.wxshop.weixin.WeixinConstants;
import com.ieebook.wxshop.weixin.dto.common.GenericXmlMessage;
import com.ieebook.wxshop.weixin.dto.receive.base.IMessageBuilder;
import com.ieebook.wxshop.weixin.dto.receive.event.MenuEvent;
import com.ieebook.wxshop.weixin.dto.receive.event.SubscribeEvent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * jiangyukun on 2015-11-07 23:25.
 */
public class EventBuilder implements IMessageBuilder {

    private static XmlMapper xmlMapper = new XmlMapper();
    private static final Logger logger = LoggerFactory.getLogger(EventBuilder.class);

    private IMessageBuilder messageBuilder;

    public EventBuilder() {
    }

    public EventBuilder(IMessageBuilder messageBuilder) {
        this.messageBuilder = messageBuilder;
    }

    public GenericXmlMessage build(String xmlString) throws WeixinMessageConvertException {
        try {
            BaseEvent baseEvent = xmlMapper.readValue(xmlString, BaseEvent.class);
            String type = baseEvent.getEvent();
            switch (type) {
                case WeixinConstants.Event.SUBSCRIBE:
                    return xmlMapper.readValue(xmlString, SubscribeEvent.class);
                case WeixinConstants.Event.UNSUBSCRIBE:
                    return xmlMapper.readValue(xmlString, SubscribeEvent.class);
                case WeixinConstants.Event.CLICK:
                    return xmlMapper.readValue(xmlString, MenuEvent.class);
                case WeixinConstants.Event.VIEW:
                    return xmlMapper.readValue(xmlString, MenuEvent.class);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new WeixinMessageConvertException(e.getMessage(), e);
        }
        if (this.messageBuilder == null) {
            throw new WeixinMessageConvertException("illegal message type!");
        }
        logger.debug("dispatcher to [" + this.messageBuilder.getClass().getSimpleName() + "] to handle weixin message");
        return this.messageBuilder.build(xmlString);
    }
}
