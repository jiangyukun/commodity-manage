package com.ieebook.wxshop.entity;

/**
 * 基础实体类
 *
 * @author meikehuan
 */

public class BaseEntity {
    /**
     * 创建人created_by
     */
    private Integer createdBy;
    /**
     * 创建时间
     */
    private String createdDate;

    /**
     * 最后更新人 update_by
     */
    private Integer updatedBy;

    /**
     * 最后更新时间
     */
    private String updatedDate;

    public BaseEntity() {
    }

    public BaseEntity(Integer cby, String cdate, Integer uby, String udate) {
        this.setCreatedBy(cby);
        this.setCreatedDate(cdate);
        this.setUpdatedBy(uby);
        this.setUpdatedDate(udate);
    }

    public Integer getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }


    public Integer getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(Integer updatedBy) {
        this.updatedBy = updatedBy;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }
}
