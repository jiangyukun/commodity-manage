package com.ieebook.wxshop.weixin.dto.receive.event;

import com.ieebook.wxshop.weixin.dto.common.GenericXmlMessage;
import com.ieebook.wxshop.weixin.dto.receive.event.support.BaseEvent;
import com.ieebook.wxshop.weixin.dto.receive.message.TextXmlMessage;

/**
 * jiangyukun on 2015-11-07 23:23.
 */
public class SubscribeEvent extends BaseEvent {

    public GenericXmlMessage sendMessage() {
        TextXmlMessage textMessage = new TextXmlMessage(this);
        textMessage.setContent("you are welcomed!");
        return textMessage;
    }
}
