package com.ieebook.wxshop.weixin.dto.receive.message.support;

import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.ieebook.wxshop.core.exception.WeixinMessageConvertException;
import com.ieebook.wxshop.weixin.WeixinConstants;
import com.ieebook.wxshop.weixin.dto.common.GenericXmlMessage;
import com.ieebook.wxshop.weixin.dto.receive.base.IMessageBuilder;
import com.ieebook.wxshop.weixin.dto.receive.message.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * jiangyukun on 2015-11-07 21:31
 */
public class MessageBuilder implements IMessageBuilder {
    private static XmlMapper xmlMapper = new XmlMapper();
    private static final Logger logger = LoggerFactory.getLogger(MessageBuilder.class);

    private IMessageBuilder messageBuilder;

    public MessageBuilder() {
    }

    public MessageBuilder(IMessageBuilder messageBuilder) {
        this.messageBuilder = messageBuilder;
    }

    public GenericXmlMessage build(String xmlString) throws WeixinMessageConvertException {
        logger.trace(xmlString);
        try {
            BaseXmlMessage baseMessage = xmlMapper.readValue(xmlString, BaseXmlMessage.class);
            System.out.println(xmlString);
            String type = baseMessage.getMsgType();
            if (type.equals(WeixinConstants.Message.TEXT)) {
                return xmlMapper.readValue(xmlString, TextXmlMessage.class);
            }
            if (type.equals(WeixinConstants.Message.IMAGE)) {
                return xmlMapper.readValue(xmlString, ImageXmlMessage.class);
            }
            if (type.equals(WeixinConstants.Message.VOICE)) {
                return xmlMapper.readValue(xmlString, VoiceXmlMessage.class);
            }
            if (type.equals(WeixinConstants.Message.VIDEO)) {
                return xmlMapper.readValue(xmlString, VideoXmlMessage.class);
            }
            if (type.equals(WeixinConstants.Message.SHORT_VIDEO)) {
                return xmlMapper.readValue(xmlString, ShortVideoXmlMessage.class);
            }
            if (type.equals(WeixinConstants.Message.POSITION)) {
                return xmlMapper.readValue(xmlString, PositionXmlMessage.class);
            }
            if (type.equals(WeixinConstants.Message.LINK)) {
                return xmlMapper.readValue(xmlString, LinkXmlMessage.class);
            }
        } catch (Exception e) {
            throw new WeixinMessageConvertException(e.getMessage(), e);
        }
        if (this.messageBuilder == null) {
            throw new WeixinMessageConvertException("illegal message type!");
        }
        logger.debug("dispatcher to [" + this.messageBuilder.getClass().getSimpleName() + "] to handle weixin message");
        return this.messageBuilder.build(xmlString);
    }
}
