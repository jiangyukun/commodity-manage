package com.ieebook.wxshop.entity.commodity;

public class CommoditySequnce {
	private int mid;
	private int cid;
	public CommoditySequnce(){
		
	}
	public CommoditySequnce(int mid,int cid){
		this.mid=mid;
		this.cid=cid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
}
