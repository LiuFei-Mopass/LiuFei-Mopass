package com.demo.backstage.service.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.demo.backstage.doman.Enums;
import com.demo.backstage.doman.EnumsParent;
import com.demo.backstage.doman.Util;
import com.demo.backstage.service.enumService;
import com.demo.util.StringUtil;
import com.demo.util.jdbcUtils;

public class enumServiceImpl implements enumService {
	private jdbcUtils jdbcutils = new jdbcUtils();
	Logger log = Logger.getLogger(enumServiceImpl.class);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss");


	/**
	 * 方法描述-封装实体集合
	 * @param findModeResult
	 * @author  LIUFEI
	 * @date  2016-6-25
	 */
	 
	public List<Enums> getEnumsChildList(List<Map<String, String>> findModeResult) {
		List<Enums> enumslist = new ArrayList<Enums>();
		for (Map<String, String> map : findModeResult) {
			Enums enums = new Enums();
			enums.setId(Integer.parseInt(map.get("id")));
			enums.setEkey(map.get("ekey"));
			enums.setEvalue1(map.get("evalue1"));
			enums.setEvalue2(map.get("evalue2"));
			enums.setEvalue3(map.get("evalue3"));
			enums.setQueryId(map.get("query_id"));
			enums.setSequ(map.get("sequ"));
			enums.setCreateUser(map.get("create_user"));
			enums.setCreateTime(Timestamp.valueOf(map.get("create_time")));
			enums.setCreateTimeStr(sdf.format(Timestamp.valueOf(map.get("create_time"))));
			enums.setUpdateUser(map.get("update_user"));
			enums.setUpdateTime(Timestamp.valueOf(map.get("update_time")));
			enums.setUpdateTimeStr(sdf.format(Timestamp.valueOf(map.get("update_time"))));
			enums.setUseable(map.get("useable"));
			enumslist.add(enums);
		}
		return  enumslist;
	}
	public List<EnumsParent> getEnumsParentList(List<Map<String, String>> findModeResult) {
		List<EnumsParent> enumslist = new ArrayList<EnumsParent>();
		for (Map<String, String> map : findModeResult) {
			EnumsParent enums = new EnumsParent();
			enums.setId(Integer.parseInt(map.get("id")));
			enums.setEname(map.get("ename"));
			enums.setEvalue(map.get("evalue"));
			enums.setEdesc(map.get("edesc"));
			enums.setCreateUser(map.get("create_user"));
			enums.setIsDelete(Integer.parseInt(map.get("is_delete")));
			enums.setIsDeleteStr(map.get("is_delete"));
			enums.setCreateTime(Timestamp.valueOf(map.get("create_time")));
			enums.setCreateTimeStr(sdf.format(Timestamp.valueOf(map.get("create_time"))));
			enums.setUpdateUser(map.get("update_user"));
			enums.setUpdateTime(Timestamp.valueOf(map.get("update_time")));
			enums.setUpdateTimeStr(sdf.format(Timestamp.valueOf(map.get("update_time"))));
			enumslist.add(enums);
		}
		return  enumslist;
	}
	
	
	
	
	
	
	
	@Override
	public List<EnumsParent> getEnumsParentList(Util u) {
		log.info("*****开始查询枚举值");
		long startTime = System.currentTimeMillis();
		List<EnumsParent>  enumlist = new ArrayList<EnumsParent>();
		String sql = "select * from bac_enum_parentdesc order by update_time asc limit ?,?";
		try {
			Integer[] params = new Integer[]{u.getInteger1(),u.getInteger2()};
			List<Map<String, String>> findModeResult = jdbcutils.executeQuery(sql, params);
			enumlist = getEnumsParentList(findModeResult);
		} catch (Exception e) {
			log.error("*****查询枚举值异常");
		}
		long endTime = System.currentTimeMillis();
		log.info("*****查询所花时间："+(endTime-startTime));
		return enumlist;
	}

	public Integer getEnumsSize(){
		log.info("*****开始查询枚举值 SIZE");
		long startTime = System.currentTimeMillis();
		List<Map<String, String>> findModeResult = null;
		String sql = "select * from bac_enum_parentdesc order by update_time asc ";
		try {
			log.info("*****查询SQL:"+sql);
			findModeResult = jdbcutils.executeQuery(sql, null);
		} catch (Exception e) {
			log.error("*****查询枚举SIZE值异常");
		}
		long endTime = System.currentTimeMillis();
		log.info("*****查询所花时间："+(endTime-startTime));
		return findModeResult.size();
	}
	
	
	/**
	 * 方法描述-查询枚举值子类详细枚举
	 * @param parentid
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-25
	 */
	public  List<Enums>  getEnumsChildList(String parentid){
		log.info("*****开始查询子类枚举值");
		long startTime = System.currentTimeMillis();
		List<Enums>  enumlist = new ArrayList<Enums>();
		String sql = "select * from bac_enums  where is_delete ='0' and query_id='"+parentid+"' order by update_time asc ";
		try {
			log.info("*****查询SQL:"+sql);
			List<Map<String, String>> findModeResult = jdbcutils.executeQuery(sql, null);
			enumlist = getEnumsChildList(findModeResult);
		} catch (Exception e) {
			log.error("*****查询枚举值异常, 异常信息: ");
		}
		long endTime = System.currentTimeMillis();
		log.info("*****查询所花时间："+(endTime-startTime));
		return enumlist;
	}
	/**
	 * 方法描述-修改枚举类型
	 * @param enums
	 * @return
	 * @author  LIUFEI
	 * @date  2016-8-4
	 */
	@Override
	public Integer updateEnumsType(EnumsParent enumsPar) {
		Integer saveOrUpdateData = 0;
		String sql = "update bac_enum_parentdesc set";
		if(StringUtil.isNotEmpty(enumsPar.getEname())){
			sql+=" ename ='"+enumsPar.getEname()+"' ";
		}
		if(StringUtil.isNotEmpty(enumsPar.getEvalue())){
			sql+=" evalue ='"+enumsPar.getEvalue()+"' ";
		}
		
		
		
				//" value('"+enumsPar.getEvalue()+"','"+enumsPar.getEdesc()+"','"+enumsPar.getIsDelete()+"','"+enumsPar.getUpdateUser()+"','"+enumsPar.getUpdateTime()+"')";
		log.info("####执行sql:" +sql);
		 saveOrUpdateData = jdbcutils.saveOrUpdateData(sql, null);
		return saveOrUpdateData;
	}
	@Override
	public Integer addEnumsType(EnumsParent enumsPar) {
		Integer saveOrUpdateData = 0;
		String sql = "insert into bac_enum_parentdesc(evalue,ename,edesc,is_delete,update_user,update_time)" +
				" value('"+enumsPar.getEvalue()+"','"+enumsPar.getEdesc()+"','"+enumsPar.getIsDelete()+"','"+enumsPar.getUpdateUser()+"','"+enumsPar.getUpdateTime()+"')";
		log.info("####执行sql:" +sql);
		 saveOrUpdateData = jdbcutils.saveOrUpdateData(sql, null);
		return saveOrUpdateData;
	}
	
	@Override
	public Integer updateEnumsChild(Enums enums) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Integer addEnumsChild(Enums enums) {
		// TODO Auto-generated method stub
		return null;
	}






}
