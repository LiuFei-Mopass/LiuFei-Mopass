package com.demo.backstage.service.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.demo.backstage.doman.News;
import com.demo.backstage.doman.Util;
import com.demo.backstage.service.newsService;
import com.demo.util.StringUtil;
import com.demo.util.jdbcUtils;

public class newsServiceImpl implements newsService {
	private jdbcUtils jdbcutils;
	Logger log = Logger.getLogger(newsServiceImpl.class);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
	static String CLASSNAME = new newsServiceImpl().getClass().getName();


	/**
	 * 方法描述- recnews.jsp 页面数据
	 * @param news
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-20
	 */
	@Override
	public List<News> getNewsToPage(Util u) {
		String sql = " select id,new_title,new_content,new_type,create_time from bac_news n where isdelete='0' order by create_time  desc  limit ?,? ";
		List<News> newsList = new ArrayList<News>();
		try {
		Integer[] params = new Integer[]{u.getInteger1(),u.getInteger2()};
		List<Map<String, String>> findModeResult = jdbcutils.executeQuery(sql, params);
		for (Map<String, String> map : findModeResult) {
			News news = new News();
			news.setId(Integer.parseInt(map.get("id")+""));
			news.setNewTitle(map.get("new_title"));
			String string = map.get("new_content");
			if("rec".equals(u.getStr1())){
				news.setNewContent(string.length()>180?string.substring(0, 180):string+"...");
			}else if("bac".equals(u.getStr1())){
				news.setNewContent(string);
			}
			news.setNewType(map.get("nwe_type"));
			news.setCreateTime(Timestamp.valueOf(map.get("create_time")+""));
			news.setCreateStrTime(sdf.format(Timestamp.valueOf(map.get("create_time")+"")));
			newsList.add(news);
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsList;
	}

	@Override
	public String getNewsContent(News news) {
		
		return null;
	}

	@Override
	public News getNewsContentToJsp(News news) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer getCountNews() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getBackNewsForList(Util utils) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 方法描述-获取新闻信息列表
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-20
	 */
	@Override
	public List<News> getNewsList(News newz,String type) {
		String sql = " select id,new_title,new_content,new_type,create_time  from bac_news where isdelete='0'" ;
		if(newz!=null){
			if(StringUtil.isNotEmpty(newz.getId()+"")){
				sql +=" and id = "+newz.getId();
			}
		}
		sql+=" order by create_time desc ";
		List<News> newsList = new ArrayList<News>();
		try {
		List<Map<String, String>> findModeResult = null;
		try {
			findModeResult = jdbcutils.executeQuery(sql, null);
			
		} catch (Exception e) {
			String methodName = Thread.currentThread().getStackTrace()[1].getMethodName();
			log.info("查询: 在类"+CLASSNAME+"中的"+methodName+"方法查询出现异常");
		}
		for (Map<String, String> map : findModeResult) {
			News news = new News();
			news.setId(Integer.parseInt(map.get("id")+""));
			news.setNewTitle(map.get("new_title"));
			String string = map.get("new_content");
			if("bac".equals(type)){
				news.setNewContent(string);
			}else if(type.equals("rec")){
				news.setNewContent(string.length()>180?string.substring(0, 180):string+"...");
			}
			news.setNewType(map.get("nwe_type"));
			news.setCreateTime(Timestamp.valueOf(map.get("create_time")+""));
			news.setCreateStrTime(sdf.format(Timestamp.valueOf(map.get("create_time")+"")));
			newsList.add(news);
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsList;
	}

	@Override
	public Integer addNewsMsg(News news) {
		
		String sql = "insert into bac_news ";
		
		
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer deleteNewsInfo(String id) {
		Integer res = 0;
		if(StringUtil.isNotEmpty(id)){
			String sql = " update bac_news set isdelete='1' where id= "+Integer.parseInt(id);
			try {
				res = jdbcutils.saveOrUpdateData(sql, null);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return res;
	}

}
