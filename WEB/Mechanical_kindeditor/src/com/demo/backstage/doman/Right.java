package com.demo.backstage.doman;

import java.util.List;

public class Right {
	
	private Integer id;
	private String rightName;
	private String parentId;
	private String parentIdStr;
	private String isShow;
	private String rightType;  //1系统设置 0业务模块
	private String location;
	private String isDelete;
	private String isDeleteStr;
	private List<Right> chRights;
	
	// tree 字段
	private String text;
	private Boolean checked;
	private List<Right> children;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRightName() {
		return rightName;
	}
	public void setRightName(String rightName) {
		this.rightName = rightName;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getIsShow() {
		return isShow;
	}
	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}
	public String getRightType() {
		return rightType;
	}
	public void setRightType(String rightType) {
		this.rightType = rightType;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public List<Right> getChRights() {
		return chRights;
	}
	public void setChRights(List<Right> chRights) {
		this.chRights = chRights;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<Right> getChildren() {
		return children;
	}
	public void setChildren(List<Right> children) {
		this.children = children;
	}
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	public String getParentIdStr() {
		return parentIdStr;
	}
	public void setParentIdStr(String parentIdStr) {
		this.parentIdStr = parentIdStr;
	}
	public String getIsDeleteStr() {
		return isDeleteStr;
	}
	public void setIsDeleteStr(String isDeleteStr) {
		this.isDeleteStr = isDeleteStr;
	}
	
}
