package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DBUtil.Cutil;
import com.model.customermodel;


public class forgotdao {

	public customermodel chequemail(String email)
	{
		customermodel fmodel=new customermodel();
		try {
		Connection cn=new Cutil().getdata();
		String sql="select * from customer where email=?";
		
			PreparedStatement pst=cn.prepareStatement(sql);
			pst.setString(1, email);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				fmodel.setCustomerid(rs.getInt(1));
				fmodel.setEmail(rs.getString("email"));
				fmodel.setFname(rs.getString(2));
				fmodel.setLname(rs.getString(3));
			}
			
			else {
				fmodel=null;
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return fmodel;
		
	}
	public int resetpassword(customermodel fmodel)
	{
		System.out.println("forgot dao2 called..");
		int r=0;
		try {
		Connection cn=new Cutil().getdata();
		String sql="update customer set password=? where customerid=?";
		
			PreparedStatement pst=cn.prepareStatement(sql);
			pst.setString(1, fmodel.getPassword());
			pst.setInt(2, fmodel.getCustomerid());
			r=pst.executeUpdate();
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return r;
		
	}

}


