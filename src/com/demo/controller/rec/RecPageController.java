package com.demo.controller.rec;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.backstage.doman.News;
import com.demo.backstage.doman.Util;
import com.demo.backstage.service.newsService;
import com.demo.backstage.service.impl.newsServiceImpl;
import com.demo.util.StringUtil;


@Controller
public class RecPageController {
	
	
	Logger log = Logger.getLogger(RecPageController.class);
	
	newsService newsservice = new newsServiceImpl();
	
	/**
	 * 方法描述- 新闻中心
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-3
	 */
	@RequestMapping(value="/news",method=RequestMethod.GET)
	public ModelAndView getNewsPage(Integer page){
		ModelAndView mv = new ModelAndView();
		Util utils = new Util();
		Integer a = page; //当前页数
		Integer b = 4; //每页显示几条数据
		int pagesize = newsservice.getNewsList(null,"rec").size();
		//判断页面不再范围内  取页码极值
		if(pagesize%b==0){
			if(a>=pagesize/b){
				a = pagesize/b;
			}
			if(a<=0){
				a=1;
			}
		}else{
			if(a>=(pagesize/b)+1){
				a = (pagesize/b)+1;
			}
			if(a<=0){
				a=1;
			}
		}
		
		if(a==1){
			utils.setInteger1(0);
		}else{
			utils.setInteger1((a*b)-(b-1));
		}
		utils.setInteger2(b);
		utils.setStr1("rec");
		mv.addObject("page", a);//当前页数
		//获取页面数据
		List<News> newsList = newsservice.getNewsToPage(utils);
		mv.addObject("NewsList",newsList);
		//获取新闻列表信息SIZE
		if(pagesize%b==0){
			pagesize = (pagesize/b);
		}else{
			pagesize = (pagesize/b)+1;
		}
		//总页数
		mv.addObject("pagesize",pagesize);
		mv.setViewName("reception/recnews");
		return mv;
	}
	@RequestMapping(value="/getnewcontent.html",method=RequestMethod.GET)
	public ModelAndView getNewsContent(String id){
		News news = new News();
		ModelAndView mv = new ModelAndView();
		if(StringUtil.isNotEmpty(id)){
			news.setId(Integer.parseInt(id));
			List<News> newsList = newsservice.getNewsList(news,"bac");
			if(!newsList.isEmpty()){
				mv.addObject("news", newsList.get(0));
				mv.setViewName("reception/recNewsContent");
			}
		}
		return mv;
	}

}
