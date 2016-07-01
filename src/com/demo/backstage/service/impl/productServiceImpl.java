package com.demo.backstage.service.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.demo.backstage.doman.Product;
import com.demo.backstage.service.productService;
import com.demo.util.jdbcUtils;

public class productServiceImpl implements productService {

	Logger log = Logger.getLogger(productServiceImpl.class);
	private jdbcUtils jdbcutils;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public List<Product> listToProductEntity(List<Map<String, String>> result){
		List<Product>  productlist = new ArrayList<Product>();
		if(result.size()>0){
			for (Map<String, String> map : result) {
				Product product = new Product();
				product.setId(Integer.parseInt(map.get("id").toString()));
				product.setProductName(map.get("product_name").toString());
				product.setParentId(map.get("parent_id"));
				product.setProductPageType(map.get("product_pagetype"));
				product.setProduntThumbnail(map.get("produnt_thumbnail")+"");
				product.setIsShow(map.get("is_show"));
				product.setIsDelete(map.get("is_delete"));
				product.setCreateTime(Timestamp.valueOf(map.get("create_time")));
				product.setUpdateTime(Timestamp.valueOf(map.get("update_time")));
				product.setCreateUser(map.get("create_user"));
				product.setUpdateUser(map.get("update_user"));
				product.setCreateTimeStr(sdf.format(product.getCreateTime()));
				product.setUpdateTimeStr(sdf.format(product.getUpdateTime()));
				productlist.add(product);
			}
		}
		return productlist;
	}
	

	/**
	 * 方法描述-获取产品的类型在首页显示
	 * @return
	 * @author  LIUFEI
	 * @date  2016-6-2
	 */
	@Override
	public List<Product> getProductType() {
		String sql = "	select  id,product_name,parent_id,product_pagetype,is_show,is_delete,produnt_thumbnail  from  bac_product where  is_show='1' and parent_id is null";
		List<Product> productList = new ArrayList<Product>();
		try {
			List<Map<String, String>> findModeResult = jdbcutils.executeQuery(sql);
			for (Map<String, String> map : findModeResult) {
				Product product = new Product();
				product.setId(Integer.parseInt(map.get("id").toString()));
				product.setProductName(map.get("product_name")+"");
//				product.setParentId(Integer.parseInt(map.get("parent_id")+""));
//				product.setProductPageType(Integer.parseInt(map.get("product_pagetype")+""));
				product.setProduntThumbnail(map.get("produnt_thumbnail")+"");
				productList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productList;
	}

}
