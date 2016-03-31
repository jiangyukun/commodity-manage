package com.ieebook.wxshop.weixin.dto.receive.message;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlCData;
import com.ieebook.wxshop.weixin.dto.receive.message.support.BaseXmlMessage;

/**
 * jiangyukun on 2015-11-07 19:30.
 */
public class VideoXmlMessage extends BaseXmlMessage {

    @JsonProperty("ThumbMediaId")
    @JacksonXmlCData
    private String thumbMediaId;

    @JsonProperty("MediaId")
    @JacksonXmlCData
    private String mediaId;

    @JsonProperty("Recognition")
    @JacksonXmlCData
    private String recognition;
}
