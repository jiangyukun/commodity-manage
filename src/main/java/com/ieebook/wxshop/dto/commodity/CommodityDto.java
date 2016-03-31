package com.ieebook.wxshop.dto.commodity;

/**
 * jiangyukun on 2015-11-24 15:05
 */
public class CommodityDto {
    private Integer id;
    private String name;
    private Integer categoryId;
    private String imgId;
    private Double price;
    private String specification;
    private Integer recommend;
    private Integer state;

    public CommodityDto() {
    }

    public Integer getRecommend() {
        return recommend;
    }

    public void setRecommend(Integer recommend) {
        this.recommend = recommend;
    }

    /**
     * @param id
     * @param name
     * @param imgId
     * @param price
     * @param specification
     * @param recommend
     * @param state
     */
    public CommodityDto(Integer id, String name, String imgId, Double price, String specification, Integer recommend, Integer state) {
        this.setId(id);
        this.setName(name);
        this.setImgId(imgId);
        this.setPrice(price);
        this.setSpecification(specification);
        this.setRecommend(recommend);
        this.setState(state);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getImgId() {
        return imgId;
    }

    public void setImgId(String imgId) {
        this.imgId = imgId;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
