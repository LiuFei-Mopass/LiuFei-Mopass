package com.demo.backstage.doman;

public class ProductInfo {
	
	private Integer id;   // id
	private String productName;  //product_name
	private Integer productId;  //product_id
	private String productInfoImg; //product_info_img
	private Integer isDelete;  //is_delete
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	public String getProductInfoImg() {
		return productInfoImg;
	}
	public void setProductInfoImg(String productInfoImg) {
		this.productInfoImg = productInfoImg;
	}
	

}
