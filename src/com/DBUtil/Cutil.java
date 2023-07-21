package com.DBUtil;

import java.sql.Connection;
import java.sql.DriverManager;

public class Cutil {
Connection cn=null;
public Connection getdata()
{
    try {
		Class.forName("com.mysql.jdbc.Driver");
		cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
		System.out.println("connection establish");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return cn;
	
}
}
