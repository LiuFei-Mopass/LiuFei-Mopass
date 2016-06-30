package com.demo.backstage.service;

import java.util.List;

import com.demo.backstage.doman.Product;
import com.demo.backstage.doman.Util;


public interface productService {
	
	
	/**
	 * 方法描述-获取产品的类型在首页显示
	 *
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-2
	 * 	
	 */
	public List<Product> getProductType(); 
	
	
}
