package com.demo.backstage.doman;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * 枚举表父表
 * @author  Administrator
 * @date  2016-1-12
 * 
 */
public class EnumsParent {
	private Integer id;
	private String evalue;  //码值
	private String ename;  //名称
	private String edesc;   //描述
	private Integer isDelete;
	private String isDeleteStr;
	private String createUser;
	private Timestamp createTime;
	private String createTimeStr;
	private String updateUser;
	private Timestamp updateTime;
	private String updateTimeStr;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEvalue() {
		return evalue;
	}
	public void setEvalue(String evalue) {
		this.evalue = evalue;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getEdesc() {
		return edesc;
	}
	public void setEdesc(String edesc) {
		this.edesc = edesc;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	public String getIsDeleteStr() {
		return isDeleteStr;
	}
	public void setIsDeleteStr(String isDeleteStr) {
		this.isDeleteStr = isDeleteStr;
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
