package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DBUtil.Cutil;
import com.model.customermodel;

public class deldao {
	
	Connection cn=null;
	int x=0;
	public int dedao(customermodel dmodel)
	{
		cn=new Cutil().getdata();
		String sql="insert into deliveryboy(fname,lname,email,mobile,password) values(?,?,?,?,?)";
		try {
		PreparedStatement pst = cn.prepareStatement(sql);
			pst.setString(1,dmodel.getFname());
			pst.setString(2, dmodel.getLname());
			pst.setString(3, dmodel.getEmail());
			pst.setString(4, dmodel.getMobile());
			pst.setString(5, dmodel.getPassword());
			
			x=pst.executeUpdate();
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return x;
		
	}
	customermodel model=null;
	public customermodel getdata(customermodel demodel)
	{
		cn=new Cutil().getdata();
		String sql="select * from deliveryboy  where email=? and password=?";
		try {
			PreparedStatement pst=cn.prepareStatement(sql);
			pst.setString(1,demodel.getEmail());
			pst.setString(2, demodel.getPassword());
			ResultSet rs=pst.executeQuery();
			
			if(rs.next()) {
				model=new customermodel();
				model.setDileveryid(rs.getInt(1));
				model.setFname(rs.getString(2));
				model.setLname(rs.getString(3));
				model.setEmail(rs.getString(4));
				model.setMobile(rs.getString(5));
				model.setPassword(rs.getString(6));
				
			}
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return model;
	}

}
