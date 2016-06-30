package com.demo.backstage.service;

import java.util.List;

import com.demo.backstage.doman.ProductInfo;
import com.demo.backstage.doman.User;

public interface productInfoService {
	
	/**
	 * 查询产品列表
	 * liufei 2015-12-26
	 * 
	 * @param productId
	 * @return
	 */
	public List<ProductInfo> getProductInfo(Integer productId);
		

}
