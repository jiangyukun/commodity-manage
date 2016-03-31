package com.ieebook.wxshop.core.util;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ieebook.wxshop.core.exception.JsonException;

import java.io.IOException;

/**
 * jiangyukun on 2015-11-06 20:44
 */
public class JsonUtils {

    private static ObjectMapper mapper = new ObjectMapper();

    public static String obj2String(Object obj) throws JsonException {
        try {
            return mapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            throw new JsonException(obj.getClass().getName() + "转化为json字符串失败: " + e.getMessage());
        }
    }

    public static <T> T readFromString(String content, Class<T> type) throws JsonException {
        try {
            return mapper.readValue(content, type);

        } catch (JsonParseException e) {
            throw new JsonException("格式错误" + content, e);
        } catch (JsonMappingException e) {
            throw new JsonException("未知属性: " + content, e);
        } catch (IOException e) {
            throw new JsonException(e.getMessage(), e);
        }
    }

}
