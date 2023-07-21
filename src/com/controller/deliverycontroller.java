package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.customerdao;
import com.DAO.deldao;
import com.model.customermodel;


@WebServlet("/deliverycontroller")
public class deliverycontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public deliverycontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("register"))
		{
		
		customermodel dmodel=new customermodel();
		dmodel.setFname(request.getParameter("fname"));
		dmodel.setLname(request.getParameter("lname"));
		dmodel.setEmail(request.getParameter("email"));
		dmodel.setMobile(request.getParameter("mobile"));
		dmodel.setPassword(request.getParameter("password"));
		
		
		
		int x=new deldao().dedao(dmodel);
		
		if(x>0)
		{
			response.sendRedirect("dellogin.jsp");
		}
		else {
			response.sendRedirect("delregister.jsp");
		}
		
	}
		else if (action.equalsIgnoreCase("login"))
		{
			customermodel demodel=new customermodel();
			demodel.setEmail(request.getParameter("email"));
			demodel.setPassword(request.getParameter("password"));
			
		customermodel model=new deldao().getdata(demodel);
		if(model!=null)
		{
			HttpSession session=request.getSession();
			session.setAttribute("model",model);
			session.setAttribute("fname",model.getFname());
			session.setAttribute("lname",model.getLname());
			session.setAttribute("dileveryid",model.getDileveryid());
			
			response.sendRedirect("del-home.jsp");
		}
		
		else
		{
			request.setAttribute("msg", "invalid user or password");
			request.getRequestDispatcher("dellogin.jsp").forward(request, response);
		}
			
			
		}

}

	}


