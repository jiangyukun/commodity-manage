package com.ieebook.wxshop.entity.products;

import com.ieebook.wxshop.entity.BaseEntity;
/**
 * 产品库
 * @author fish
 *
 */
public class Products extends BaseEntity{
	private String id;
	private String barcode;
	private double price;
	private String name;
	private String img_id;
	private int type;
	private String description;
	
	public Products(){
		
	}
	
	public Products(String id,String barcode,double price,String name,String img_id,int type,String description, Integer cby, String cdate, Integer uby, String udate){
		super(cby, cdate, uby, udate);
		this.id=id;
		this.barcode=barcode;
		this.price=price;
		this.name=name;
		this.img_id=img_id;
		this.type=type;
		this.description=description;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg_id() {
		return img_id;
	}
	public void setImg_id(String img_id) {
		this.img_id = img_id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
