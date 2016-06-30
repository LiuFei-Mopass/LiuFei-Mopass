package com.demo.backstage.doman;

import java.sql.Timestamp;
import java.util.List;

/**
 * ClassName: Product 
 * @Description: TODO
 * @author  LIUFEI
 * @date  2015-11-20 下午12:46:55
 * 	
 */
public class Product {
	private Integer id;
	private String productName;
	private String parentId;
	private String productPageType;  
	private String isShow;
	private String isDelete;
	private String produntThumbnail;  //缩略图
	private String createUser;
	private Timestamp createTime;
	private String createTimeStr;
	private String updateUser;
	private Timestamp updateTime;
	private String updateTimeStr;
	
	private List<Product> productChild;//子类
	
	private List<ProductInfo> productInfoList;//子类产品集合

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
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getProductPageType() {
		return productPageType;
	}
	public void setProductPageType(String productPageType) {
		this.productPageType = productPageType;
	}
	public String getIsShow() {
		return isShow;
	}
	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public String getProduntThumbnail() {
		return produntThumbnail;
	}
	public void setProduntThumbnail(String produntThumbnail) {
		this.produntThumbnail = produntThumbnail;
	}
	public List<Product> getProductChild() {
		return productChild;
	}
	public void setProductChild(List<Product> productChild) {
		this.productChild = productChild;
	}
	public List<ProductInfo> getProductInfoList() {
		return productInfoList;
	}
	public void setProductInfoList(List<ProductInfo> productInfoList) {
		this.productInfoList = productInfoList;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public String getCreateTimeStr() {
		return createTimeStr;
	}
	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	public String getUpdateTimeStr() {
		return updateTimeStr;
	}
	public void setUpdateTimeStr(String updateTimeStr) {
		this.updateTimeStr = updateTimeStr;
	}
	

}
