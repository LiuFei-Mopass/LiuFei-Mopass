package com.demo.backstage.service.impl;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.demo.backstage.doman.Role;
import com.demo.backstage.service.roleService;
import com.demo.util.DBConnection;
import com.demo.util.StringUtil;
import com.demo.util.jdbcUtils;

public class roleServiceImpl implements roleService {
	

	/* (non-Javadoc)  根据用户id 查询用户角色
	 * 
	 */
	@Override
	public Role findAllRole(Integer userid) {
		Role role = null;
		if(StringUtil.isNotEmpty(userid+"")){
			Connection con = new DBConnection().getConnection();
			String sql = "SELECT r.role_id,r.role_name,r.role_user_id,r.role_is_delete " +
							"FROM bac_user_role ul, bac_role r " +
							"WHERE ul.role_id = r.role_id AND ul.user_id = "+userid;
			
			List<Map<String, String>> roleList = jdbcUtils.executeQuery(sql);
			if(roleList.size()>0){
				role = new Role();
				role.setId(Integer.parseInt(roleList.get(0).get("role_id")));
				role.setName(roleList.get(0).get("role_name"));
				role.setUserId(Integer.parseInt(roleList.get(0).get("role_user_id")));
				role.setIsDelete(Integer.parseInt(roleList.get(0).get("role_is_delete")));
			}
		
		
		}
		return role;
		
	}

	@Override
	public String getAllRoles() {
		return "";
	}

}
