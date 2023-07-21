package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.DBUtil.Cutil;
import com.model.customermodel;
import com.model.productmodel;

public class admindao {
	
	Connection cn=null;
	int x=0;
	public int addproduct(productmodel pm)
	{
		cn=new Cutil().getdata();
		String sql="insert into product(pname,cname,content,mdate,edate,price,image) values(?,?,?,?,?,?,?)";
		try {
		PreparedStatement pst = cn.prepareStatement(sql);
			pst.setString(1,pm.getPname());
			pst.setString(2, pm.getCname());
			pst.setString(3, pm.getContent());
			pst.setString(4, pm.getMdate());
			pst.setString(5, pm.getEdate());
			pst.setString(6,pm.getPrice());
			pst.setString(7, pm.getImage());
			
			x=pst.executeUpdate();
			cn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return x;
		
	}
	
	public int deleteuser(int fid)
	{
		int x=0;
		 cn=new Cutil().getdata();
		 String sql="delete from feedback where fid=?";
		 
		try {
			PreparedStatement pst;
			pst = cn.prepareStatement(sql);
			 pst.setInt(1, fid);
			 x=pst.executeUpdate();
			 cn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return x;
	}
	
	public int deactive(int customerid)
	{
		int x=0;
		 cn=new Cutil().getdata();
		 String sql="update customer set status='deactive' where customerid=?";
		 
		try {
			PreparedStatement pst;
			pst = cn.prepareStatement(sql);
			 pst.setInt(1, customerid);
			 x=pst.executeUpdate();
			 cn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return x;
	}

}
