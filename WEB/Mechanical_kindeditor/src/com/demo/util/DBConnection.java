package com.demo.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	
	   private static final Integer DBTYPE = 0;//0-b本地调试，1-服务器地址
	
		
		private static  String	DRIVER="com.mysql.jdbc.Driver";;
		private static  String	URL;
		private static  String	USERNAME;
		private static  String	PASSWORD;
		
		
	
	

//		private static  String DRIVER="com.mysql.jdbc.Driver";
//		private static  String URL="jdbc:mysql://localhost/Mechanical?useUnicode=true&characterEncoding=UTF-8";
//		private static  String USERNAME="root";
//		private static  String PASSWORD="admin";
		
		
		static{
			try {
				Class.forName(DRIVER);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		public Connection getConnection(){
			
			if(1==DBTYPE){
//				DRIVER="com.mysql.jdbc.Driver";
				URL="jdbc:mysql://192.168.1.74:49056/ea1e45316b9f4?useUnicode=true&characterEncoding=UTF-8";
				USERNAME="15ddbe186c144";
				PASSWORD="2095a6466b3b4";
			}else{
//				DRIVER="com.mysql.jdbc.Driver";
				URL="jdbc:mysql://localhost/Mechanical?useUnicode=true&characterEncoding=UTF-8";
				USERNAME="root";
				PASSWORD="admin";
			}
			Connection con = null;
			try {
				con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			} catch (SQLException e) {
				e.printStackTrace();
				
			}
			return con;
		}
		public void close(ResultSet rs ,PreparedStatement ps ,  Connection con){
			try {
				if(rs!=null){
					rs.close();
				}
				if(ps!=null){
					ps.close();
				}
				if(con!=null){
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}
