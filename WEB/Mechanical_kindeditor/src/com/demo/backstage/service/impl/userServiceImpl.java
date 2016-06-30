package com.demo.backstage.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.demo.backstage.doman.User;
import com.demo.backstage.service.userService;
import com.demo.util.DBConnection;
import com.demo.util.StringUtil;
import com.demo.util.jdbcUtils;

public class userServiceImpl implements userService {
	Logger log = Logger.getLogger(userServiceImpl.class);
	
	private jdbcUtils jdbcutils;
	public User getUser(String name,String password) {
		User user = null;
		if(StringUtil.isNotEmpty(name) && StringUtil.isNotEmpty(password)){
			String sql = "select * from bac_user where user_name=? and user_password= ?";
			Object[] params = new String[]{name,password};
			List<Map<String, Object>> result;
			Connection con = null;
			try {
				con = new DBConnection().getConnection();
				result = jdbcutils.findModeResult(sql, params, con);
				if(result.size()>0){
					user = new User();
					user.setId(Integer.parseInt(result.get(0).get("user_id")+""));
					user.setName(result.get(0).get("user_name")+"");
					user.setPassword(result.get(0).get("user_password")+"");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				new DBConnection().close(null,null, con);
			}
		}
		return user;
	}

	public int saveUser(User u) {
		// TODO Auto-generated method stub
		return 0;
	}

	public String queryAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUser(User u) {
		// TODO Auto-generated method stub
		return null;
	}

}
