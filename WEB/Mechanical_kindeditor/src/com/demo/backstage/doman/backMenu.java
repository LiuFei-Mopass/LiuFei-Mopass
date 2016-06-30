package com.demo.backstage.doman;

public class backMenu {
	private Integer id;
	private String menuName;
	private Integer parentId;
	private Integer url;  
	private Integer isDelete;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public Integer getUrl() {
		return url;
	}
	public void setUrl(Integer url) {
		this.url = url;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
}
