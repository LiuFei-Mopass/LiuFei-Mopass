package com.demo.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MySql extends HttpServlet { 
		 
	    @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
	Connection connection = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = null;
	try {
	/*****1. 填写数据库相关信息(请查找数据库管理页面)*****/
	String databaseName = "d2b373970668f400d88410f41908e413d"; 
	String host = "192.168.1.13";
	String port = "3306";
	String username = "a3c2af15-e0a6";//用户名;
	String password = "38c9598a-49fd";//密码
	String driverName = "com.mysql.jdbc.Driver";
	String dbUrl = "jdbc:mysql://";
	String serverName = host + ":" + port + "/";
	String connName = dbUrl + serverName + databaseName;
	 
	/******2. 接着连接并选择数据库名为databaseName的服务器******/
	Class.forName(driverName);
	connection = DriverManager.getConnection(connName, username, password);
	stmt = connection.createStatement();
	/*至此连接已完全建立，就可对当前数据库进行相应的操作了*/
	/* 3. 接下来就可以使用其它标准mysql函数操作进行数据库操作*/
	//创建一个数据库表
	sql = "create table if not exists test_mysql(" + 
	                "id int primary key auto_increment," + 
	                "no int, "+
	                "name varchar(1024)," + 
	                "key idx_no(no))";
	stmt.execute(sql);
	} catch (Exception e) {
	            e.printStackTrace(resp.getWriter());
	}
	}
	

}
