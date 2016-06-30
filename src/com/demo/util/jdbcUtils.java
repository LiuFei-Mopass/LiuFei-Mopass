package com.demo.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public  class jdbcUtils   {
	static DBConnection cons = new DBConnection();
	static Logger log = Logger.getLogger(jdbcUtils.class);

	/**
	 * 
	 * 执行sql语句    insert update   返回Integer
	 * liufei 2016-1-15
	 * @param sql
	 * @return  0-执行失败,1-执行成功
	 */
	public static Integer execute(String sql ){
		Integer result = -1;
		ResultSet rs=null;
		PreparedStatement ps = null;
		Connection con = cons.getConnection();
		try {
			log.info("[ jdbc.execute 执行sql:"+sql+"  ]");
			ps = con.prepareStatement(sql);
			/*for (int i = 0; i < par.length; i++) {
				ps.setObject(i+1, par[i]);
			}*/
			result = ps.executeUpdate();
		} catch (Exception e) {
			result = -1;
			log.error(" [ jdbc.execute 执行sql错误："+e.getMessage()+" ] ");
			e.printStackTrace();
		}finally{
			cons.close(rs, ps, con);
		}
		return result;
	}
	
	
	
	
	/**
	 * 
	 * 执行sql语句     update   返回Integer
	 * liufei 2016-1-15
	 * @param sql
	 * @return  0-执行失败,1-执行成功
	 */
	public static Integer saveOrUpdateData(String sql,Object[] par){
		Integer result = -1;
		ResultSet rs=null;
		PreparedStatement ps = null;
		Connection con = cons.getConnection();
		try {
			log.info("[ jdbc.execute 执行sql:"+sql+"  ]");
			ps = con.prepareStatement(sql);
			for (int i = 0; i < par.length; i++) {
				ps.setObject(i+1, par[i]);
			}
			result = ps.executeUpdate();
		} catch (Exception e) {
			result = -1;
			log.error(" [ jdbc.execute 执行sql错误："+e.getMessage()+" ] ");
			e.printStackTrace();
		}finally{
			cons.close(rs, ps, con);
		}
		return result;
	}
	
	/*
	 * 
	 * 	Object[] ss = new String[]{news.getNewType(),news.getNewTitle(),news.getNewContent()};
		Integer execute = jdbcutils.saveOrUpdateData(t, ss);
	 * 
	 * 
	 * */
	
	/**
	 * 查询sql 返回 ResultSet集合
	 * liufei 2016-1-15
	 * @param sql
	 * @return
	 */
	public static List<Map<String, String>> executeQuery(String sql){
		PreparedStatement ps = null;
		ResultSet rs =null;
		Connection con  = new DBConnection().getConnection();
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		try {
			log.info("[ jdbc.execute 执行sql:"+sql+"  ]");
			ps = con.prepareStatement(sql.toLowerCase());
			rs = ps.executeQuery();
		    ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据
		    int columnCount = md.getColumnCount();   //获得列数 
	        while(rs.next()){
	        	Map<String,String> rowData = new HashMap<String,String>();
	        	for (int i = 1; i <= columnCount; i++) {
	                rowData.put(md.getColumnName(i), rs.getString(i));
	            }
	        	list.add(rowData);
	        }
		} catch (SQLException e) {
			log.error(" [ executeQuery 执行sql错误："+e.getMessage()+" ] ");
		}finally{
			cons.close(rs, ps, con);
		}
		return list;
	}
	
	public static List<Map<String, String>> executeQuery(String sql , Integer[] parm){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs =null;
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		try {
			con = new DBConnection().getConnection();
			log.info("[ jdbc.execute 执行sql:"+sql+"  ]");
			ps = con.prepareStatement(sql.toLowerCase());
			if(parm!=null){
				for (int i = 0; i < parm.length; i++) {
					ps.setObject(i+1, parm[i]);
				}
			}
			rs = ps.executeQuery();
		    ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据
		    int columnCount = md.getColumnCount();   //获得列数 
	        while(rs.next()){
	        	Map<String,String> rowData = new HashMap<String,String>();
	        	for (int i = 1; i <= columnCount; i++) {
	                rowData.put(md.getColumnName(i), rs.getString(i));
	            }
	        	list.add(rowData);
	        }
		} catch (SQLException e) {
			log.error(" [ executeQuery 执行sql错误："+e.getMessage()+" ] ");
		}finally{
			cons.close(rs, ps, con);
		}
		return list;
	}

	
	
    public static List<Map<String, Object>> findModeResult(String sql, Object[] params, Connection con) throws SQLException{  
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();  
        int index = 1; 
        PreparedStatement ps = null;
		ResultSet rs =null;
        ps = con.prepareStatement(sql.toLowerCase());  
        if(params != null && params.length>0){  
            for(int i = 0; i<params.length; i++){  
                ps.setObject(index++, params[i]);  
            }  
        }  
        rs = ps.executeQuery();  
        ResultSetMetaData metaData = rs.getMetaData();  
        int cols_len = metaData.getColumnCount();  
        while(rs.next()){  
            Map<String, Object> map = new HashMap<String, Object>();  
            for(int i=0; i<cols_len; i++){  
                String cols_name = metaData.getColumnName(i+1);  
                Object cols_value = rs.getObject(cols_name);  
                if(cols_value == null){  
                    cols_value = "";  
                }  
                map.put(cols_name, cols_value);  
            }  
            list.add(map);  
        }  
        return list;  
    }  
    
    
    
    /*public static void main(String[] args) {
    	Connection con = new DBConnection().getConnection();
    	String sql = "select * from backstage_user where user_name=? and user_password= ?";
		Object[] params = new String[]{"admin","admin"};
    	try {
			List<Map<String, Object>> findModeResult = findModeResult(sql, params, con);
			System.out.println(findModeResult.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}*/
}
