package com.demo.controller;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.demo.backstage.doman.Product;
import com.demo.backstage.service.productService;
import com.demo.backstage.service.impl.productServiceImpl;



@Controller
public class PagesController {
	productService productservice = new  productServiceImpl();
	Logger log = Logger.getLogger(PagesController.class);
	
	/*----------------------------REC-------------------------------*/
	/**
	 * 方法描述-  访问首页
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-3
	 */
	@RequestMapping(value="/index.html")
	public ModelAndView getIndexPage(){
		ModelAndView mv = new ModelAndView();
		List<Product> productList = productservice.getProductType();
		
		mv.addObject("productType", productList);
		mv.setViewName("reception/recindex");
		return mv;
	}
	/**
	 * 方法描述- 访问关于劲凯
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-3
	 */
	@RequestMapping(value="/about.html",method=RequestMethod.GET)
	public ModelAndView getPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reception/recabout");
		return mv;
	}
	/**
	 * 方法描述-  产品中心
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-3
	 */
	@RequestMapping(value="/product.html")
	public ModelAndView getProductPage(){
		ModelAndView  mv = new ModelAndView();
		mv.setViewName("reception/recproduct");
		return mv;
	}
	/**
	 * 方法描述- 加入我们
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-3
	 */
	@RequestMapping(value="/resource.html")
	public ModelAndView getResourcePage(){
		ModelAndView  mv = new ModelAndView();
		mv.setViewName("reception/resource");
		return mv;
	}
	
	
	
	
	/**
	 * 方法描述- 加入我们
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-3
	 */
	@RequestMapping(value="/support.html")
	public ModelAndView getSupportPage(){
		ModelAndView  mv = new ModelAndView();
		mv.setViewName("reception/support");
		return mv;
	}
	
	/*----------------------------BAC--------------------------------*/
	/**
	 * 方法描述-访问后台登录页面
	 * @author  LIUFEI
	 * @date  2016-6-3
	 */
	 
	@RequestMapping(value="/baclogin.html",method=RequestMethod.GET)
	public ModelAndView getBacLoginPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("backstage/baclogin");
		return mv;
	}
	
	
	
	
	/*************************euditor*******************************/
	
	public void name(HttpServletRequest request , HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Content-Type", "text/html");
		String realPath = request.getRealPath("/");
		//response.getWriter().write(new ActionEnter());
		
	}
	
	
	
	
	
	

}
