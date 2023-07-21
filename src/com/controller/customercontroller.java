package com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.customerdao;
import com.model.bookmodel;
import com.model.customermodel;
import com.model.feedbackmodel;


@WebServlet("/customercontroller")
public class customercontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public customercontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("register"))
		{
		
		customermodel cmodel=new customermodel();
		cmodel.setFname(request.getParameter("fname"));
		cmodel.setLname(request.getParameter("lname"));
		cmodel.setEmail(request.getParameter("email"));
		cmodel.setMobile(request.getParameter("mobile"));
		cmodel.setPassword(request.getParameter("password"));
		
		
		
		int x=new customerdao().custdao(cmodel);
		
		if(x>0)
		{
			response.sendRedirect("login.jsp");
		}
		else {
			response.sendRedirect("register.jsp");
		}
		
	}
		else if (action.equalsIgnoreCase("login"))
		{
			customermodel lmodel=new customermodel();
			lmodel.setEmail(request.getParameter("email"));
			lmodel.setPassword(request.getParameter("password"));
			
		customermodel model=new customerdao().getdata(lmodel);
		if(model!=null)
		{
			HttpSession session=request.getSession();
			session.setAttribute("model",model);
			session.setAttribute("fname",model.getFname());
			session.setAttribute("lname",model.getLname());
			session.setAttribute("customerid",model.getCustomerid());
			
			response.sendRedirect("cust-home.jsp");
		}
		
		else
		{
			request.setAttribute("msg", "invalid user or password");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
			
			
		}
		
		else if(action.equalsIgnoreCase("book"))
		{
			bookmodel bmodel=new bookmodel();
			Date d1=new Date();
			SimpleDateFormat s1=new SimpleDateFormat("dd-MM-yyyy");
			bmodel.setCustomerid(Integer.parseInt(request.getParameter("customerid")));
			bmodel.setProductid(Integer.parseInt( request.getParameter("productid")));
			bmodel.setPrice(request.getParameter("price"));
			bmodel.setBdate(s1.format(d1));
			bmodel.setStatus("pending");
			bmodel.setPstatus("pending");
			
			
			int x=new customerdao().bookmedicine(bmodel);
			if(x>0)
			{
				response.sendRedirect("payment.jsp?price="+bmodel.getPrice());
			}
			else
			{
				
			}
		}
		
		if(action.equalsIgnoreCase("feedback"))
		{
			feedbackmodel fmodel=new feedbackmodel();
			fmodel.setCid(Integer.parseInt(request.getParameter("cid")));
			fmodel.setEmail(request.getParameter("email"));
			fmodel.setRemark(request.getParameter("remark"));
			fmodel.setStar(request.getParameter("star"));
			
			int x=new customerdao().feedbackdao(fmodel);
			if(x>0)
			{
				response.sendRedirect("cust-home.jsp");
			}
			else
			{
				response.sendRedirect("index.jsp");
			}
		}

}
}
