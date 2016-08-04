package com.demo.controller.bac;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.backstage.doman.DataGrid;
import com.demo.backstage.doman.Enums;
import com.demo.backstage.doman.EnumsParent;
import com.demo.backstage.doman.MessageObj;
import com.demo.backstage.doman.Util;
import com.demo.backstage.service.enumService;
import com.demo.backstage.service.impl.enumServiceImpl;
import com.demo.util.jdbcUtils;


@Controller
public class EnumsController {
	enumService enumservice =  new enumServiceImpl();
	Logger log = Logger.getLogger(EnumsController.class);

	
	@ResponseBody
	@RequestMapping(value="/getEnums.html", method=RequestMethod.POST)
	public DataGrid getEnums(Integer page,Integer rows){
		DataGrid datagrid = new DataGrid();
		Util utils = new Util();
		if(page==0){
			utils.setInteger1(page);
		}else{
		utils.setInteger1((page-1)*rows);
		}
		utils.setInteger2(rows);
		log.info("======开始分页查询枚举值 page:"+utils.getInteger1()+"=====");
		List<EnumsParent> findAllBackEnums = enumservice.getEnumsParentList(utils);
		datagrid.setTotal(enumservice.getEnumsSize().toString());
		datagrid.setRows(findAllBackEnums);
		log.info("======开始分页查询枚举值 结束=====");
		return datagrid;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/getEnumsChild.html", method=RequestMethod.POST)
	public DataGrid getEnumsChild(String parentId){
		DataGrid datagrid = new DataGrid();
		Util utils = new Util();
		log.info("======开始查询枚举值详细内容 page:"+utils.getInteger1()+"=====");
		List<Enums> findAllBackEnums = enumservice.getEnumsChildList(parentId);
		datagrid.setTotal(enumservice.getEnumsSize().toString());
		datagrid.setRows(findAllBackEnums);
		log.info("======开始分页查询枚举值 结束=====");
		return datagrid;
	}
	
	public MessageObj addEnumType(){
		MessageObj mess = new MessageObj();
		return mess;
	}
	
	public MessageObj updateEnumType(){
		MessageObj mess = new MessageObj();
		return mess;
	}
	
	
	
	
	
	
	

}
