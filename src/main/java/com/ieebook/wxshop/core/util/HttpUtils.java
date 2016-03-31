package com.ieebook.wxshop.core.util;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.InputStreamBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/**
 * jiangyukun on 2015-11-06 19:59
 */
public final class HttpUtils {
    private HttpUtils() {
    }

    /**
     * GET 请求
     *
     * @param url 地址
     * @return 服务器返回的字符串
     * @throws IOException
     */
    public static String get(String url) throws IOException {
        return doRequest(new HttpGet(url));
    }

    /**
     * POST 请求
     *
     * @param url 地址
     * @return 服务器返回的字符串
     * @throws IOException
     */
    public static String post(String url, String body) throws IOException {
        HttpPost httpPost = new HttpPost(url);
        StringEntity stringEntity = new StringEntity(body, ContentType.create("text/plain", "UTF-8"));
        httpPost.setEntity(stringEntity);
        return doRequest(httpPost);
    }

    /**
     * 文件上传
     *
     * @param url  地址
     * @param file File
     * @return 服务器返回的字符串
     * @throws IOException
     */
    public static String uploadFile(String url, File file) throws IOException {
        HttpPost httpPost = new HttpPost(url);
        httpPost.setEntity(MultipartEntityBuilder.create().addPart("file", new FileBody(file)).build());
        return doRequest(httpPost);
    }

    public static String uploadFile(String url, String paramName, InputStream inputStream) throws IOException {
        HttpPost httpPost = new HttpPost(url);
        httpPost.setEntity(MultipartEntityBuilder.create().addPart(paramName, new InputStreamBody(inputStream, "picture")).build());
        return doRequest(httpPost);
    }

    private static String doRequest(HttpUriRequest httRequest) throws IOException {
        try (CloseableHttpClient httpclient = HttpClients.createDefault()) {
            return httpclient.execute(httRequest, response -> {
                int status = response.getStatusLine().getStatusCode();
                if (status >= 200 && status < 300) {
                    HttpEntity entity = response.getEntity();
                    return entity != null ? EntityUtils.toString(entity) : null;
                } else {
                    throw new IllegalStateException("Unexpected response status: " + status);
                }
            });
        }
    }
}
