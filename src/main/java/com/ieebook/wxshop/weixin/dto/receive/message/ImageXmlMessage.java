package com.ieebook.wxshop.weixin.dto.receive.message;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlCData;
import com.ieebook.wxshop.weixin.dto.receive.message.support.BaseXmlMessage;

/**
 * jiangyukun on 2015-11-07 19:24.
 */
public class ImageXmlMessage extends BaseXmlMessage {
    @JsonProperty("PicUrl")
    @JacksonXmlCData
    private String picUrl;

    @JsonProperty("MediaId")
    @JacksonXmlCData
    private String mediaId;
}
