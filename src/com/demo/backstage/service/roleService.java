package com.demo.backstage.service;

import com.demo.backstage.doman.Role;

public interface roleService {
	/** 通过用户id 查询用户 角色
	 * @param userid
	 * @return
	 */
	public Role findAllRole(Integer userid);
	
	/**
	 * 获取所有角色
	 * liufei 2016-1-14
	 * @return
	 */
	public String getAllRoles();

}
