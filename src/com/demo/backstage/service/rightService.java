package com.demo.backstage.service;

import java.util.List;

import com.demo.backstage.doman.Right;
import com.demo.backstage.doman.Util;

public interface rightService {
		
	
	/**获取用户当前权限
	 * @param id
	 * @return
	 */
	public List<Right> findAllRights(Integer id);
	
	public List<Right> findAllRights(Integer id , Integer rightId);
	
	/**
	 * 方法描述-分页获取父类权限
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-29
	 */
	public List<Right> getParentRightToPage(Util util);
	/**
	 * 方法描述-分页获取父类权限
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-29
	 */
	public List<Right> getParentRightList();
	
	
	/**
	 * 方法描述-获取子类权限
	 * @param parentid
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-29
	 */
	public List<Right> getChildRightList(String parentid);
	
	

	

}
