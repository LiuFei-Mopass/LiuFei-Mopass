package com.demo.backstage.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.demo.backstage.doman.Right;
import com.demo.backstage.doman.Enums;
import com.demo.backstage.doman.Util;
import com.demo.backstage.service.enumService;
import com.demo.backstage.service.rightService;
import com.demo.util.StringUtil;
import com.demo.util.jdbcUtils;

public class rightServiceImpl implements rightService {
	
	jdbcUtils jdbcutils = new jdbcUtils();
	//backEnumsService backenumsservice = new backEnumsServiceImpl();
	Logger log = Logger.getLogger(rightServiceImpl.class);
	String rightColumn = "R.RIGHT_ID,R.RIGHT_NAME, R.RIGHT_PARENT_ID, R.RIGHT_IS_SHOW, " +
			"R.RIGHT_TYPE ,R.RIGHT_LOCATION, R.RIGHT_IS_DELETE";
	
	
	/**
	 * 方法描述-将list<Map<String,String>> 转换成Entity
	 * @param resultlist
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-29
	 */
	public List<Right> listToEntity( List<Map<String, String>> resultlist) {
		List<Right> rights = new ArrayList<Right>();
		if(resultlist.size()>0){
			for (Map<String, String> map : resultlist) {
				Right right = new Right();
				right.setId(Integer.parseInt(map.get("right_id")+""));
				right.setRightName(map.get("right_name")+"");
				right.setParentId(map.get("right_parent_id")+"");
				right.setParentIdStr(map.get("right_parent_id")+"");
				right.setIsShow(map.get("right_is_show")+"");
				right.setLocation(map.get("right_location")+"");
				right.setRightType(map.get("right_type")+"");
				right.setIsDelete(map.get("right_is_delete")+"");
				rights.add(right);
			}
		}
		return rights;
	}
	/**
	 * 方法描述- 后台用用户登录查询权限
	 * @param id
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-29
	 */
	public List<Right> findAllRights(Integer id) {
		List<Right> rights = new ArrayList<Right>();
		String sql = "SELECT  " +rightColumn+
				" FROM BAC_USER_ROLE UL, BAC_ROLE_RIGHTS RG, BAC_RIGHTS R"+
				" WHERE UL.ROLE_ID = RG.ROLE_ID AND RG.RIGHT_ID = R.RIGHT_ID AND R.RIGHT_IS_DELETE = 1 AND UL.USER_ID = "+id+"" +
						" AND R.RIGHT_IS_SHOW = 1 AND R.RIGHT_PARENT_ID IS NULL"+
				" ORDER BY R.RIGHT_ID ASC";
		if(StringUtil.isNotEmpty(id+"")){
			System.out.println(sql);
			List<Map<String, String>> roleList = jdbcUtils.executeQuery(sql);
			if(roleList.size()>0){
				for (Map<String, String> map : roleList) {
					Right right = new Right();
					right.setId(Integer.parseInt(map.get("right_id")+""));
					right.setRightName(map.get("right_name"));
					//right.setParentId(Integer.parseInt(map.get("right_parent_id")+""));
					//right.setParentIdStr(map.get("right_parent_id"));
					right.setIsShow(map.get("right_is_show"));
					right.setLocation(map.get("right_location"));
					right.setRightType(map.get("right_type"));
					right.setIsDelete(map.get("right_is_delete"));
					rights.add(right);
				}
			}
		}
		return rights;
	}

	/**
	 * 方法描述-
	 * @param id
	 * @param rightId
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-29
	 */
	@Override
	public List<Right> findAllRights(Integer id, Integer rightId) {
		List<Right> rights = new ArrayList<Right>();
		String sql = "SELECT  " +rightColumn+
				" FROM BAC_USER_ROLE UL, BAC_ROLE_RIGHTS RG, BAC_RIGHTS R"+
				" WHERE UL.ROLE_ID = RG.ROLE_ID AND RG.RIGHT_ID = R.RIGHT_ID AND R.RIGHT_IS_DELETE = 1 AND UL.USER_ID = "+id+"" +
						" AND R.RIGHT_IS_SHOW = 1 AND r.right_parent_id = "+rightId+
				" ORDER BY R.RIGHT_ID ASC";
		if(StringUtil.isNotEmpty(id+"")){
			List<Map<String, String>> roleList = jdbcUtils.executeQuery(sql);
			rights = listToEntity(roleList);
		}
		return rights;
	}
	
	/**
	 * 方法描述-分页获取父类权限
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-29
	 */
	@Override
	public List<Right> getParentRightToPage(Util util) {
		log.info("*****开始查询Right datagrid");
		long start = System.currentTimeMillis();
		String sql = "select "+rightColumn+ " from bac_rights r where r.right_parent_id is null and r.right_is_delete ='1' limit ?,? ";
		Integer[] parm  = new Integer[]{util.getInteger1(),util.getInteger2()}; 
		List<Map<String, String>> executeQuery = jdbcUtils.executeQuery(sql, parm);
		List<Right> listToEntity = this.listToEntity(executeQuery);
		log.info("*****开始查询Right datagrid 结束 , 用时："+(System.currentTimeMillis()-start));
		return listToEntity;
	}
	/**
	 * 方法描述-查询RightParent
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-29
	 */
	@Override
	public List<Right> getParentRightList() {
		log.info("*****开始查询RightParent ");
		long start = System.currentTimeMillis();
		String sql = "select "+rightColumn+ " from bac_rights r where r.right_parent_id is null and r.right_is_delete ='1' limit ?,? ";
		//Integer[] parm  = new Integer[]{util.getInteger1(),util.getInteger2()}; 
		List<Map<String, String>> executeQuery = jdbcUtils.executeQuery(sql, null);
		List<Right> listToEntity = this.listToEntity(executeQuery);
		log.info("*****开始查询RightParent 结束 , 用时："+(System.currentTimeMillis()-start));
		return listToEntity;
	}
	@Override
	public List<Right> getChildRightList(String parentid) {
		log.info("*****开始查询RightChild ");
		long start = System.currentTimeMillis();
		String sql = "select "+rightColumn+ " from bac_rights r where r.right_is_delete ='1' and  r.right_parent_id='"+parentid+"'";
		//Integer[] parm  = new Integer[]{util.getInteger1(),util.getInteger2()}; 
		List<Map<String, String>> executeQuery = jdbcUtils.executeQuery(sql, null);
		List<Right> listToEntity = this.listToEntity(executeQuery);
		log.info("*****开始查询RightChild 结束 , 用时："+(System.currentTimeMillis()-start));
		return listToEntity;
	}



	
}
