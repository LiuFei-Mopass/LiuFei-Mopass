package com.demo.backstage.service;

import java.util.List;

import com.demo.backstage.doman.Enums;
import com.demo.backstage.doman.EnumsParent;
import com.demo.backstage.doman.Util;

public interface enumService {

	
	/**
	 * 查询所有枚举值  翻页显示
	 * liufei 2016-1-12
	 * @return
	 */
	public  List<EnumsParent>  getEnumsParentList(Util utils);
	/**
	 * 方法描述-查询子类详细枚举内容
	 * @param parentid
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-25
	 */
	 
	public  List<Enums>  getEnumsChildList(String parentid);

	
	

	/**
	 * 修改具体枚举值
	 * liufei 2016-1-14
	 * @param enums
	 * @return
	 */
	public String updateEnumsType(Enums enums);
	/**
	 * 方法描述-新增枚举类型
	 * @param enums
	 * @return
	 * @author  LIUFEI
	 * @date  2016-8-4
	 */
	public String addEnumsType(Enums enums);
	
	/**
	 * 修改具体枚举值
	 * liufei 2016-1-14
	 * @param enums
	 * @return
	 */
	public String updateEnumsChild(Enums enums);
	/**
	 * 方法描述-新增枚举值
	 * @param enums
	 * @return
	 * @author  LIUFEI
	 * @date  2016-8-4
	 */
	public String addEnumsChild(Enums enums);
	
	public Integer getEnumsSize();
	
	
}
