package com.ieebook.wxshop.weixin.dto.reply;

import com.ieebook.wxshop.core.util.WeixinUtils;
import com.ieebook.wxshop.entity.merchant.Merchant;
import com.ieebook.wxshop.service.merchant.MerchantService;
import com.ieebook.wxshop.weixin.WeixinAPI;
import com.ieebook.wxshop.weixin.WeixinConstants;
import com.ieebook.wxshop.weixin.dto.common.GenericXmlMessage;
import com.ieebook.wxshop.weixin.dto.receive.event.SubscribeEvent;
import com.ieebook.wxshop.weixin.dto.receive.event.support.BaseEvent;
import com.ieebook.wxshop.weixin.dto.receive.message.TextXmlMessage;
import com.ieebook.wxshop.weixin.dto.receive.message.support.BaseXmlMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.net.URLEncoder;

/**
 * jiangyukun on 2015-11-08 13:21.
 */
@Component
public class ReplyMessageBuilder {
    private static final Logger logger = LoggerFactory.getLogger(ReplyMessageBuilder.class);

    @Autowired
    private MerchantService merchantService;
    @Autowired
    private WeixinAPI weixinAPI;

    public TextMessage buildTextMessage(GenericXmlMessage receiveXmlMessage) throws Exception {
        TextMessage textMessage = new TextMessage();
        textMessage.setFromUserName(receiveXmlMessage.getToUserName());
        textMessage.setToUserName(receiveXmlMessage.getFromUserName());
        textMessage.setMsgType(WeixinConstants.Message.TEXT);
        textMessage.setCreateTime(receiveXmlMessage.getCreateTime());
        if (receiveXmlMessage instanceof TextXmlMessage) {
            logger.debug(receiveXmlMessage.getFromUserName());
            logger.debug(receiveXmlMessage.getToUserName());
            textMessage.setContent((((TextXmlMessage) receiveXmlMessage).getContent()));
        } else if (receiveXmlMessage instanceof BaseXmlMessage) {
            textMessage.setContent(receiveXmlMessage.getMsgType());
        } else if (receiveXmlMessage instanceof SubscribeEvent) {
            if (((SubscribeEvent) receiveXmlMessage).getEvent().equals(WeixinConstants.Event.SUBSCRIBE)) {
                Merchant merchant = merchantService.getMerchantByOperid(receiveXmlMessage.getFromUserName());
                if (merchant != null) {
                    textMessage.setContent("感谢您关注每加商户服务平台");
                    return textMessage;
                }
                String url = URLEncoder.encode("http://projectx.ieebook.cn/wxshop/jump/account--register", "utf-8");
                String registerUrl = WeixinUtils.getViewMenuUrl(weixinAPI.getAppId(), url, WeixinConstants.WebPageType.BASE);
                textMessage.setContent("感谢您关注每加商户服务平台，请<a href=\"" + registerUrl + "\">绑定</a>您的账号，在这里您可以维护您的商品，订单，配送区域等全方位的管理");
            } else {
                return null;
            }
        } else if (receiveXmlMessage instanceof BaseEvent) {
            textMessage.setContent(((BaseEvent) receiveXmlMessage).getEvent());
        } else {
            textMessage.setContent("。。。");
        }
        return textMessage;
    }
}
