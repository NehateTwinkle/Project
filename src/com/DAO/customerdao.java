package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DBUtil.Cutil;
import com.model.bookmodel;
import com.model.customermodel;
import com.model.feedbackmodel;

public class customerdao {
	
	Connection cn=null;
	int x=0;
	public int custdao(customermodel cmodel)
	{
		cn=new Cutil().getdata();
		String sql="insert into customer(fname,lname,email,mobile,password) values(?,?,?,?,?)";
		try {
		PreparedStatement pst = cn.prepareStatement(sql);
			pst.setString(1,cmodel.getFname());
			pst.setString(2, cmodel.getLname());
			pst.setString(3, cmodel.getEmail());
			pst.setString(4, cmodel.getMobile());
			pst.setString(5, cmodel.getPassword());
			
			x=pst.executeUpdate();
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return x;
		
	}
	
	customermodel model=null;
	public customermodel getdata(customermodel lmodel)
	{
		cn=new Cutil().getdata();
		String sql="select * from customer where email=? and password=?";
		try {
			PreparedStatement pst=cn.prepareStatement(sql);
			pst.setString(1,lmodel.getEmail());
			pst.setString(2, lmodel.getPassword());
			ResultSet rs=pst.executeQuery();
			
			if(rs.next()) {
				model=new customermodel();
				model.setCustomerid(rs.getInt(1));
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
	
	public int bookmedicine(bookmodel bmodel)
	{
		 x=0;
		cn=new Cutil().getdata();
		String sql="insert into book(productid,customerid,price,bdate,status,pstatus) values(?,?,?,?,?,?)";
		try {
		PreparedStatement pst = cn.prepareStatement(sql);
			pst.setInt(1,bmodel.getProductid() );
			pst.setInt(2, bmodel.getCustomerid());
			pst.setString(3, bmodel.getPrice());
			pst.setString(4, bmodel.getBdate());
			pst.setString(5, bmodel.getStatus());
			pst.setString(6, bmodel.getPstatus());
			
			x=pst.executeUpdate();
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return x;
		
	}
	
	
	public int feedbackdao(feedbackmodel fmodel)
	{
		x=0;
		cn=new Cutil().getdata();
		String sql="insert into feedback(cid,email,remark,star) value(?,?,?,?)";
		
		try {
			PreparedStatement pst=cn.prepareStatement(sql);
			pst.setInt(1,fmodel.getCid());
			pst.setString(2,fmodel.getEmail());
			pst.setString(3,fmodel.getRemark());
			pst.setString(4,fmodel.getStar());
			
			
			x=pst.executeUpdate();
			cn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
		
	}

}
