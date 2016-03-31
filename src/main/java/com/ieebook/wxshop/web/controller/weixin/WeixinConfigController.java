package com.ieebook.wxshop.web.controller.weixin;

import com.ieebook.wxshop.core.util.XmlUtils;
import com.ieebook.wxshop.web.support.BaseController;
import com.ieebook.wxshop.weixin.dto.common.GenericXmlMessage;
import com.ieebook.wxshop.weixin.dto.receive.base.IMessageBuilder;
import com.ieebook.wxshop.weixin.dto.receive.event.support.EventBuilder;
import com.ieebook.wxshop.weixin.dto.receive.message.support.MessageBuilder;
import com.ieebook.wxshop.weixin.dto.reply.ReplyMessageBuilder;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.SortedSet;
import java.util.TreeSet;

/**
 * jiangyukun on 2015-11-07 17:02.
 */
@RestController
@RequestMapping("/weixin")
public class WeixinConfigController extends BaseController {

    public static final String TOKEN = "jiangyu";

    @Autowired
    private ReplyMessageBuilder replyMessageBuilder;

    @RequestMapping(value = "/message", method = RequestMethod.GET, produces = "text/plain")
    public void message(String signature, String timestamp, String nonce, String echostr,
                        HttpServletResponse response) throws IOException {
        String result = echostr;
        logger.info("enableServerConfiguration");
        if (echostr == null || !messageValid(signature, timestamp, nonce)) {
            result = "error";
        }
        logger.info(echostr);
        response.getWriter().write(result);
    }

    @RequestMapping(value = "/message", method = RequestMethod.POST, produces = "text/xml")
    public String message(String signature, String timestamp, String nonce,
                          HttpServletRequest request) throws Exception {
        logger.info("revive message from weixin");
        if (!messageValid(signature, timestamp, nonce)) {
            return "error";
        }
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String msgText = "", line;
        while ((line = reader.readLine()) != null) {
            msgText += line;
        }
        IMessageBuilder messageBuilder = new MessageBuilder(new EventBuilder());
        GenericXmlMessage message = messageBuilder.build(msgText);
        logger.debug(message.getClass().getName());

        String returnXml = XmlUtils.obj2XmlWithoutNS(replyMessageBuilder.buildTextMessage(message));
        logger.debug("Send: [ " + returnXml + " ]");
        return new String(returnXml.getBytes("UTF-8"), "ISO_8859_1");
    }

    private boolean messageValid(String signature, String timestamp, String nonce) {
        if (signature == null || timestamp == null || nonce == null) {
            return false;
        }
        SortedSet<String> sortedSet = new TreeSet<>();
        sortedSet.add(timestamp);
        sortedSet.add(nonce);
        sortedSet.add(TOKEN);
        StringBuilder sb = new StringBuilder();
        sortedSet.forEach(sb::append);
        String toSHA1Str = sb.toString();
        String afterSHA1 = DigestUtils.sha1Hex(toSHA1Str);
        return signature.equals(afterSHA1);
    }

}
