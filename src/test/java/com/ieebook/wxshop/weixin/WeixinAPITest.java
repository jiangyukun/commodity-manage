package com.ieebook.wxshop.weixin;

import com.ieebook.wxshop.app.RootConfig;
import com.ieebook.wxshop.app.WebConfig;
import com.ieebook.wxshop.core.exception.JsonException;
import com.ieebook.wxshop.core.util.JsonUtils;
import com.ieebook.wxshop.weixin.dto.AccessTokenDto;
import com.ieebook.wxshop.weixin.dto.template.Template;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * jiangyukun on 2015-11-06 22:19
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {RootConfig.class, WebConfig.class})
public class WeixinAPITest {
    @Autowired
    private WeixinAPI weixinAPI;

//    @Test
    public void testGetAccessToken() throws Exception {
        AccessTokenDto dto = weixinAPI.getAccessToken();
        System.out.println(dto);
    }

    @Test
    public void testTemplateMessage() throws JsonException {
        Template template = new Template();
        template.setTemplateId("7KDk22VYpXjqmm1JOmeaN6SsH4BoG8PxUrZ-lzJtUvA");
        template.setToUser("ovxzEvrjp0OloLC7j-QiT6LCoRjk");
        template.setUrl("http://baidu.com");
        String templateBody = JsonUtils.obj2String(template);
        weixinAPI.templateMessage(templateBody);
    }
}
