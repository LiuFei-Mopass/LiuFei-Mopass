package com.demo.controller.bac;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.backstage.doman.DataGrid;
import com.demo.backstage.doman.MessageObj;
import com.demo.backstage.doman.News;
import com.demo.backstage.doman.Util;
import com.demo.backstage.service.newsService;
import com.demo.backstage.service.impl.newsServiceImpl;

@Controller
@RequestMapping(value="/news")
public class NewsController {
	
	Logger log = Logger.getLogger(NewsController.class);
	newsService newsservice = new newsServiceImpl();
	
	@RequestMapping(value="/getNewsList.html")
	@ResponseBody
	public DataGrid getNewsList(Integer page,Integer rows){
		DataGrid datagrid = new DataGrid();
		Util utils = new Util();
		if(page==0){
			utils.setInteger1(page);
		}else{
		utils.setInteger1((page-1)*rows);
		}
		utils.setInteger2(rows);
		utils.setStr1("bac");//bac -全部显示  rec-显示180个字
		//分页查询显示新闻信息
		List<News> newsList= newsservice.getNewsToPage(utils);
		int pagesize = newsservice.getNewsList(null,"rec").size();
		//获取总条数
		datagrid.setTotal(pagesize+"");
		datagrid.setRows(newsList);
		return datagrid;
	}
	
	
	@RequestMapping(value="/addNews.html")
	@ResponseBody
	public MessageObj addNewsMsg(Map<String,String> parms){
		MessageObj msg = new MessageObj();
		
		
		return msg;
	}
	
	
	
	public MessageObj deleteNewsMsg(String id){
		MessageObj msg = new MessageObj();
		
		return msg;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
