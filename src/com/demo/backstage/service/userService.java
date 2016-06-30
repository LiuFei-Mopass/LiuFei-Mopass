package com.demo.backstage.service;

import com.demo.backstage.doman.User;

public interface userService {
	
		/**根据相应的条件获取user对象
		 * @param u
		 * @return
		 */
		public User getUser(User u);
		
		
		
		/** 保存user对象
		 * @param u
		 * @return
		 */
		public int saveUser(User u);
		
		
		/** 查询所有用户
		 * @return
		 */
		public String queryAll();
		

}
