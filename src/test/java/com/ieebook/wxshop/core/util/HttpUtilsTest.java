package com.ieebook.wxshop.core.util;

import com.ieebook.wxshop.weixin.dto.receive.menu.MenuDtoBuilder;
import org.junit.Test;

import java.io.File;

/**
 * jiangyukun on 2015-11-06 20:12
 */
public class HttpUtilsTest {

    //    @Test
    public void testGet() throws Exception {
        String result = HttpUtils.get("http://baidu.com");
        System.out.println(result);
    }

    //    @Test
    public void testPost() throws Exception {
        String content = JsonUtils.obj2String(MenuDtoBuilder.build(""));
        String accessToken = "gP-Sca_PRzMLmu5GQtiYkoqOp4To-tkZBz1lYUofeGcl55q87VfyDC4oeJF7OHLZYnS79LmGdAUGnjr5FEnNW2-zW66z8Yjwa8Y-vbHVWt4OUJgACAWCR";
        System.out.println(content);
        String result = HttpUtils.post("https://api.weixin.qq.com/cgi-bin/menu/create?access_token=" + accessToken, content);
        System.out.println(result);
    }

    @Test
    public void testUploadFile() throws Exception {
        String r = HttpUtils.uploadFile("http://projectx.ieebook.cn/wxshop/file/upload", new File("D:/dbconfig.properties"));
        System.out.println(r);
    }

    @Test
    public void a() throws Exception{

//        httRequest.setHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
//        httRequest.setHeader("Accept-Encoding", "gzip, deflate, sdch");
//        httRequest.setHeader("Accept-Language", "zh-CN,zh;q=0.8,en;q=0.6");
//        httRequest.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36");
//        httRequest.setHeader("Accept-Charset", "utf-8");
//        httRequest.setHeader("Keep-Alive", "300");
//        httRequest.setHeader("Connection", "keep-alive");
//        httRequest.setHeader("Cache-Control", "max-age=0");
        String result = HttpUtils.get("http://k.autohome.com.cn/proxy/brand?state=0X001C&typeid=0");
        System.out.println(result);
    }
}
