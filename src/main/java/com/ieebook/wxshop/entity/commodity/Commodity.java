package com.ieebook.wxshop.entity.commodity;

import com.ieebook.wxshop.entity.BaseEntity;

public class Commodity extends BaseEntity {
    private Integer id;
    private Integer code;
    private Integer tid;
    private String barcode;
    private Double price;
    private String name;
    private String imgId;
    private Integer state = STATE_VALID;
    private Integer isRecommend = RECOMMEND_NO;
    private String specification;
    private String description;

    public static final int STATE_VALID = 1;
    public static final int STATE_INVALID = 0;

    public static final int RECOMMEND_NO = 0;
    public static final int RECOMMEND_YES = 1;

    public Commodity() {
    }

    public Commodity(Integer tid, Integer code,String barcode, Double price, String imgId, int isRecommend, String name, Integer state, String specification, String description, Integer cby, String cdate, Integer uby, String udate) {
        super(cby, cdate, uby, udate);
        this.tid = tid;
        this.barcode=barcode;
        this.code = code;
        this.price = price;
        this.imgId = imgId;
        this.setIsRecommend(isRecommend);
        this.name = name;
        this.state = state;
        this.specification = specification;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImgId() {
        return imgId;
    }

    public void setImgId(String imgId) {
        this.imgId = imgId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(Integer isRecommend) {
        this.isRecommend = isRecommend;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
}
