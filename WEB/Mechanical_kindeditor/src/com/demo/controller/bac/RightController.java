package com.demo.controller.bac;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.backstage.doman.DataGrid;
import com.demo.backstage.doman.Right;
import com.demo.backstage.doman.Util;
import com.demo.backstage.service.impl.rightServiceImpl;
import com.demo.util.StringUtil;


@Controller
public class RightController {
	Logger log = Logger.getLogger(RightController.class);
	rightServiceImpl rightserviceimpl = new rightServiceImpl();
	
	
	/**
	 * 方法描述-获取权限类型rightParent列表
	 * @param page
	 * @param rows
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-29
	 */
	@RequestMapping(value="/bac/getRightList.html",method=RequestMethod.POST)
	@ResponseBody
	public DataGrid getRightList(Integer page,Integer rows){
		log.info("===================获取权限类型rightParent列表===========STEART===========");
		DataGrid datagrid = new DataGrid();
		Util utils = new Util();
		if(page==0){
			utils.setInteger1(page);
		}else{
		utils.setInteger1((page-1)*rows);
		}
		utils.setInteger2(rows);
		List<Right> parentRightToPage = rightserviceimpl.getParentRightToPage(utils);
		datagrid.setRows(parentRightToPage);
		datagrid.setTotal((rightserviceimpl.getParentRightList().size()+""));
		log.info("===================获取权限类型rightParent列表===========END===========");
		return datagrid;
	}
	
	/**
	 * 方法描述-获取权限类型rightChild列表
	 * @param page
	 * @param rows
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-29
	 */
	@RequestMapping(value="/bac/getChildRightList.html")
	@ResponseBody
	public DataGrid getChildRightList(String parentid){
		log.info("===================获取权限类型rightChild列表===========STEART===========");
		DataGrid datagrid = new DataGrid();
		if(StringUtil.isNotEmpty(parentid)){
			List<Right> parentRightToPage = rightserviceimpl.getChildRightList(parentid);
			datagrid.setRows(parentRightToPage);
			datagrid.setTotal((parentRightToPage.size()+""));
		}
		log.info("===================获取权限类型rightChild列表===========END===========");
		return datagrid;
	}

}
