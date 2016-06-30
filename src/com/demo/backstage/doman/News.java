package com.demo.backstage.doman;

import java.sql.Timestamp;

public class News {

	private Integer id;
	private String newType;
	private String newTitle;
	private String newContent;
	private Timestamp createTime;
	private String createStrTime;
	private String isDelete;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNewType() {
		return newType;
	}
	public void setNewType(String newType) {
		this.newType = newType;
	}
	public String getNewTitle() {
		return newTitle;
	}
	public void setNewTitle(String newTitle) {
		this.newTitle = newTitle;
	}
	public String getNewContent() {
		return newContent;
	}
	public void setNewContent(String newContent) {
		this.newContent = newContent;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public String getCreateStrTime() {
		return createStrTime;
	}
	public void setCreateStrTime(String createStrTime) {
		this.createStrTime = createStrTime;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	
	
}
