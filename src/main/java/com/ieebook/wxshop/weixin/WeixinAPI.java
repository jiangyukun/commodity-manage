package com.ieebook.wxshop.weixin;

import com.ieebook.wxshop.core.exception.JsonException;
import com.ieebook.wxshop.core.exception.WeixinException;
import com.ieebook.wxshop.core.util.HttpUtils;
import com.ieebook.wxshop.core.util.JsonUtils;
import com.ieebook.wxshop.weixin.dto.AccessTokenDto;
import com.ieebook.wxshop.weixin.dto.common.GenericJsonResult;
import com.ieebook.wxshop.weixin.dto.jssdk.JsApiTicketDto;
import com.ieebook.wxshop.weixin.dto.receive.menu.MenuDto;
import com.ieebook.wxshop.weixin.dto.user.UserBaseInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.net.ConnectException;

/**
 * jiangyukun on 2015-11-06 18:38
 */
public class WeixinAPI {
    private static final Logger logger = LoggerFactory.getLogger(WeixinAPI.class);

    private String appId;
    private String appSecret;
    private WeixinUrl weixinUrl;

    WeixinAPI(String appId, String appSecret) {
        this.appId = appId;
        this.appSecret = appSecret;
        this.weixinUrl = new WeixinUrl(appId, appSecret);
    }

    public AccessTokenDto getAccessToken() throws WeixinException {
        String url = this.weixinUrl.getUrl("access_token");
        try {
            return fetchFromWeixin(url, AccessTokenDto.class);
        } catch (Exception e) {
            throw new WeixinException(e.getMessage(), e);
        }
    }

    public GenericJsonResult createMenu(MenuDto menuDto) throws IOException, JsonException {
        String url = this.weixinUrl.getUrl("create_menu", getAccessToken().getAccessToken());
        String result = HttpUtils.post(url, JsonUtils.obj2String(menuDto));
        return JsonUtils.readFromString(result, GenericJsonResult.class);
    }

    //网页授权
    public UserBaseInfo getOpenId(String code) throws IOException, JsonException {
        String url = this.weixinUrl.getUrl("get_open_id", code);
        String result = HttpUtils.get(url);
        logger.debug("user base info: " + result);
        return JsonUtils.readFromString(result, UserBaseInfo.class);
    }

    // js sdk
    public JsApiTicketDto getTicket() {
        String url = this.weixinUrl.getUrl("jsapi_ticket", getAccessToken().getAccessToken());
        try {
            return fetchFromWeixin(url, JsApiTicketDto.class);
        } catch (Exception e) {
            throw new WeixinException(e.getMessage(), e);
        }
    }

    //模板消息
    public void templateMessage(String body) {
        String url = this.weixinUrl.getUrl("template_message", getAccessToken().getAccessToken());
        try {
            postToWeixin(url, body);
        } catch (Exception e) {
            throw new WeixinException(e.getMessage(), e);
        }
    }

    private <T> T fetchFromWeixin(String url, Class<T> type) throws ConnectException, JsonException {
        String result;
        try {
            result = HttpUtils.get(url);
        } catch (IOException e) {
            throw new ConnectException(e.getMessage());
        }
        return JsonUtils.readFromString(result, type);
    }

    private <T> T sendToWeixin(String url, Class<T> returnType) throws ConnectException, JsonException {
        String result;
        try {
            result = HttpUtils.get(url);
        } catch (IOException e) {
            throw new ConnectException(e.getMessage());
        }
        return JsonUtils.readFromString(result, returnType);
    }

    private <T> T postToWeixin(String url, String body, Class<T> returnType) throws ConnectException, JsonException {
        String result;
        try {
            result = HttpUtils.post(url, body);
        } catch (IOException e) {
            throw new ConnectException(e.getMessage());
        }
        return JsonUtils.readFromString(result, returnType);
    }

    private String postToWeixin(String url, String body) throws ConnectException, JsonException {
        String result;
        try {
            return HttpUtils.post(url, body);
        } catch (IOException e) {
            throw new ConnectException(e.getMessage());
        }
    }

    public String getAppId() {
        return appId;
    }

    public String getAppSecret() {
        return appSecret;
    }
}
