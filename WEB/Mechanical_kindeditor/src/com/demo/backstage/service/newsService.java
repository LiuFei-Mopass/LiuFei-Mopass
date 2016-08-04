package com.demo.backstage.service;

import java.util.List;

import com.demo.backstage.doman.News;
import com.demo.backstage.doman.Util;

public interface newsService {
	
	public List<News> getNewsToPage(Util news);
	
	/**
	 * 查询新闻信息表--查看新闻详细内容
	 * @param news
	 * @return
	 */
	public String getNewsContent(News news);
	public News getNewsContentToJsp(News news);
	
	/**
	 * 获取多少条
	 * @return Integer  
	 * @throws
	 *
	 * @author LIUFEI
	 * @date 2015-11-21 下午3:29:58
	 */
	public Integer getCountNews();
	
	
	
	//---------------------------------------------------------------------------------------------------//
	
	
	public String getBackNewsForList(Util utils);
	
	/**
	 * 方法描述-获取新闻信息列表
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-20
	 */
	 
	public List<News> getNewsList(News news,String type);
	
	
	public Integer addNewsMsg(News news);
	
	
	/**
	 * 方法描述-删除新闻信息
	 * @param id
	 * @return
	 * @author  LIUFEI
	 * @date  2016-8-4
	 */
	public Integer deleteNewsInfo(String id);
	
	
	
}
