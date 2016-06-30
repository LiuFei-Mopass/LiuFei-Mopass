package com.demo.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;



public class Test {
	
	private static  String DRIVER="";
	private static  String URL="";
	private static  String USERNAME="";
	private static  String PASSWORD="";
	
	
	public  void testResd() throws Exception {
		String path = Test.class.getResource("").toString();  
		String filePath = path.substring(5, path.indexOf("com"))+"mysqlConnection.properties";
		System.out.println(filePath);
		File file = new File(filePath);// 指定要读取的文件  
		
        FileReader reader = new FileReader(file);// 获取该文件的输入流  
        
        char[] bb = new char[1024];// 用来保存每次读取到的字符  
        String str = "";// 用来将每次读取到的字符拼接，当然使用StringBuffer类更好  
        int n;// 每次读取到的字符长度  
        while ((n = reader.read(bb)) != -1) {  
            str += new String(bb, 0, n);  
            String[] split = str.split("=");
            if("driver".equals(split[0])){
            	DRIVER = split[1];
            }
            if("URL".equals(split[0])){
            	URL = split[1];
            }
            if("USERNAME".equals(split[0])){
            	USERNAME = split[1];
            }
            if("PASSWORD".equals(split[0])){
            	PASSWORD = split[1];
            }
        }  
        reader.close();// 关闭输入流，释放连接  
        System.out.println(str);
        System.out.println("DRIVER:"+DRIVER); 
        System.out.println("URL:"+URL);
        System.out.println("USERNAME:"+USERNAME);
        System.out.println("PASSWORD:"+PASSWORD);
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	  /**
     * 以行为单位读取文件，常用于读面向行的格式化文件
     */
    public static void readFileByLines() {
    	String path = Test.class.getResource("").toString();  
		String filePath = path.substring(5, path.indexOf("com"))+"mysqlConnection.properties";
        File file = new File(filePath);
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            while ((tempString = reader.readLine()) != null) {
                // 显示行号
            	String[] split = tempString.split("=");
                if("driver".equals(split[0])){
                 	DRIVER = split[1];
                }
                if("url".equals(split[0])){
                	URL = split[1];
                }
                if("username".equals(split[0])){
                	USERNAME = split[1];
                }
                if("password".equals(split[0])){
                	PASSWORD = split[1];
                }
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
    }
    
    
    	public static void main(String[] args) {
    		String str = "12345A";
    		String s = str.toLowerCase();
    		System.out.println(s);
    		
	}

}
