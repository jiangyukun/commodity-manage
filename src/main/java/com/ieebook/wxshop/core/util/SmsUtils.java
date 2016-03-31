package com.ieebook.wxshop.core.util;

import com.ieebook.wxshop.core.AppConfig;
import com.ieebook.wxshop.core.Phase;
import com.ieebook.wxshop.core.exception.SmsException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * jiangyukun on 2015-11-23 10:44
 */
public class SmsUtils {
    private static final Logger logger = LoggerFactory.getLogger(SmsUtils.class);

    public static void sendSmsCheckCode(String uid, String key, String mobile, String code) throws SmsException {
        try {
            logger.info("验证码: " + code);
            if (AppConfig.CURRENT_PHASE != Phase.DEV) {
                sendSms(uid, key, mobile, code + URLEncoder.encode("  (注册验证码,请勿泄露)", "UTF-8"));
            }
        } catch (UnsupportedEncodingException ignore) {
            // i
        }
    }

    public static void sendSms(String uid, String key, String mobile, String message) throws SmsException {
        String url = "http://utf8.sms.webchinese.cn/?Uid=" + uid + "&Key=" + key + "&smsMob=" + mobile + "&smsText=" + message;
//        logger.debug(url);

        try {
            String result = HttpUtils.get(url);
            int code = Integer.valueOf(result);
            if (code < 1) {
                throw new Exception("[sms send failure] mobile: " + mobile + " message: " + message);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new SmsException(e.getMessage());
        }

/*
        try (CloseableHttpClient httpclient = HttpClients.createDefault()) {
            HttpPost httpPost = new HttpPost("http://gbk.sms.webchinese.cn");
            List<NameValuePair> nvps = new ArrayList<>();
            nvps.add(new BasicNameValuePair("Uid", "ieebook"));
            nvps.add(new BasicNameValuePair("Key", "168106ee4cb2b9e881ee"));
            nvps.add(new BasicNameValuePair("smsMob", mobile));
            nvps.add(new BasicNameValuePair("smsText", message));
            httpPost.setEntity(new UrlEncodedFormEntity(nvps));

//            CloseableHttpResponse response2 = httpclient.execute(httpPost);
            String result = httpclient.execute(httpPost, response -> {
                int status = response.getStatusLine().getStatusCode();
                if (status >= 200 && status < 300) {
                    HttpEntity entity = response.getEntity();
                    return entity != null ? EntityUtils.toString(entity) : null;
                } else {
                    throw new IllegalStateException("Unexpected response status: " + status);
                }
            });
            System.out.println(result);
        }*/
    }
}
