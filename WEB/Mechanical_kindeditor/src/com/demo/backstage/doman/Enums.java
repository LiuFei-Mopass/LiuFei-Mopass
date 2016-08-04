package com.demo.backstage.doman;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * 枚举类
 * @author  LIUFEI
 * @date  2016-1-12
 * 
 */
public class Enums {
	private Integer id;
	private String ekey;
	private String evalue1;
	private String evalue2;
	private String evalue3;
	private String queryId;
	private String sequ;
	private String createUser;
	private Timestamp createTime;
	private String createTimeStr;
	private String updateUser;
	private Timestamp updateTime;
	private String updateTimeStr;
	private String useable;
	public String getUseable() {
		return useable;
	}
	public void setUseable(String useable) {
		this.useable = useable;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEkey() {
		return ekey;
	}
	public void setEkey(String ekey) {
		this.ekey = ekey;
	}

	public String getEvalue1() {
		return evalue1;
	}
	public void setEvalue1(String evalue1) {
		this.evalue1 = evalue1;
	}
	public String getEvalue2() {
		return evalue2;
	}
	public void setEvalue2(String evalue2) {
		this.evalue2 = evalue2;
	}
	public String getEvalue3() {
		return evalue3;
	}
	public void setEvalue3(String evalue3) {
		this.evalue3 = evalue3;
	}
	public String getQueryId() {
		return queryId;
	}
	public void setQueryId(String queryId) {
		this.queryId = queryId;
	}
	public String getSequ() {
		return sequ;
	}
	public void setSequ(String sequ) {
		this.sequ = sequ;
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
