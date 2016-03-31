package com.ieebook.wxshop.dto.merchant;

/**
 * jiangyukun on 15-11-22.
 */
public class MerchantDetailDto {
    private String merchantId;
    private String merchantName;
    private String operator; //
    private String serviceTel;
    private String bindDate;
    private String bindStatus;

    public MerchantDetailDto() {
    }

    /**
     * @param merchantId
     * @param merchantName
     * @param operator
     * @param serviceTel
     * @param bindDate
     * @param bindStatus
     */
    public MerchantDetailDto(String merchantId, String merchantName, String operator, String serviceTel, String bindDate, String bindStatus) {
        this.setMerchantId(merchantId);
        this.setMerchantName(merchantName);
        this.setOperator(operator);
        this.setServiceTel(serviceTel);
        this.setBindDate(bindDate);
        this.setBindStatus(bindStatus);
    }

    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getServiceTel() {
        return serviceTel;
    }

    public void setServiceTel(String serviceTel) {
        this.serviceTel = serviceTel;
    }

    public String getBindDate() {
        return bindDate;
    }

    public void setBindDate(String bindDate) {
        this.bindDate = bindDate;
    }

    public String getBindStatus() {
        return bindStatus;
    }

    public void setBindStatus(String bindStatus) {
        this.bindStatus = bindStatus;
    }
}
