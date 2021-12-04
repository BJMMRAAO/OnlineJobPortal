package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {

	private static Connection conn1;
	
	public static Connection getconn()
	{
		try {
			if(conn1==null) {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","tiger");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(conn1);
		return conn1;
		//just for test
	}
	/*
	 * public static void main(String[] args) { System.out.println(getconn()); }
	 */
}
