package com.ieebook.wxshop.entity.other;

import com.ieebook.wxshop.entity.BaseEntity;

/**
 * jiangyukun on 2015-11-26 15:37
 */
public class CloudImage extends BaseEntity {
    public static final String ORIGINAL = "ORIGINAL";
    public static final String THUMBNAIL = "THUMBNAIL";

    private String id;
    private String original;
    private String thumbnail;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOriginal() {
        return original;
    }

    public void setOriginal(String original) {
        this.original = original;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }
}
