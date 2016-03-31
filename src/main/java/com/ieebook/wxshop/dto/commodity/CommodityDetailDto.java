package com.ieebook.wxshop.dto.commodity;

/**
 * jiangyukun on 2015-11-26 10:52
 */
public class CommodityDetailDto extends CommodityDto {
    private String imgUrl;
    private String barCode;
    private String categoryName;

    public CommodityDetailDto() {

    }

    public CommodityDetailDto(Integer id, String name, String imgId, Double price, String specification, int isRecommend, int state) {
        super(id, name, imgId, price, specification, isRecommend, state);
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getBarCode() {
        return barCode;
    }

    public void setBarCode(String barCode) {
        this.barCode = barCode;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
