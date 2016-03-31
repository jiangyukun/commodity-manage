package com.ieebook.wxshop.weixin.dto.receive.message;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlCData;
import com.ieebook.wxshop.weixin.dto.receive.message.support.BaseXmlMessage;

/**
 * jiangyukun on 2015-11-07 21:18.
 */
public class PositionXmlMessage extends BaseXmlMessage {
    @JsonProperty("Location_X")
    private String locationX;

    @JsonProperty("Location_Y")
    private String locationY;

    @JsonProperty("Scale")
    @JacksonXmlCData
    private String scale;

    @JsonProperty("Label")
    @JacksonXmlCData
    private String label;

    public String getLocationX() {
        return locationX;
    }

    public void setLocationX(String locationX) {
        this.locationX = locationX;
    }

    public String getLocationY() {
        return locationY;
    }

    public void setLocationY(String locationY) {
        this.locationY = locationY;
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
