package com.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.DAO.admindao;
import com.model.customermodel;
import com.model.feedbackmodel;
import com.model.productmodel;


@WebServlet("/admincontroller")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512,
  maxFileSize = 1024 * 1024 * 512,
  maxRequestSize = 1024 * 1024 * 512)
public class admincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public admincontroller() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private String extractfilename(Part file) {
	    String cd = file.getHeader("content-disposition");
	    String[] items = cd.split(";");
	    for (String string : items) {
	        if (string.trim().startsWith("filename")) {
	            return string.substring(string.indexOf("=") + 2, string.length()-1);
	        }
	    }
	    return "";
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String action=request.getParameter("action");
     if (action.equalsIgnoreCase("deletefeedback")) {
			
			int fid=Integer.parseInt(request.getParameter("fid"));
			
			int x=new admindao().deleteuser(fid);
			
			if(x>0)
			{
				response.sendRedirect("admin/feedback.jsp");
			}
			else {
				
			}
			
			
		}
	
     
     
     else  if (action.equalsIgnoreCase("deactive")) {
			
			int customerid=Integer.parseInt(request.getParameter("customerid"));
			
			int x=new admindao().deactive(customerid);
			
			if(x>0)
			{
				response.sendRedirect("admin/viewcustomer.jsp");
			}
			else {
				
			}
			
			
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("action");
		if(action.equals("login"))
		{
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			if(username.equals("admin")&& password.equals("admin"))
			{
				response.sendRedirect("admin/dashboard.jsp");
			}
			else {
				response.sendRedirect("admin/index.jsp");
			}
		}
		
		else if (action.equalsIgnoreCase("add product")) {
			
		
		
		String savePath = "C:\\MiniProject\\WebContent\\image";
		
		File fileSaveDir=new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		
		Part file=request.getPart("image");
		 	String fileName=extractfilename(file);
		    file.write(savePath+File.separator+fileName);
		    String filePath=savePath+File.separator+fileName;
		    System.out.println("Your Image Path... "+filePath);
		    
		    
		
		
		
		
		
			productmodel pm=new productmodel();
			pm.setPname(request.getParameter("pname"));
			pm.setCname(request.getParameter("cname"));
			pm.setContent(request.getParameter("content"));
			pm.setMdate(request.getParameter("mdate"));
			pm.setEdate(request.getParameter("edate"));
			pm.setPrice(request.getParameter("price"));
			pm.setImage(fileName);
			
			int x=new admindao().addproduct(pm);
			
			if(x>0)
			{
				response.sendRedirect("admin/dashboard.jsp");
			}
			else {
				response.sendRedirect("admin/addproduct.jsp");
			}
		}
		
		
	}

}
