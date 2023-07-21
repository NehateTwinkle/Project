<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 
           

            <!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Customer</p>
                                <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
                                
                                PreparedStatement pst=cn.prepareStatement("select count(*) from customer");
                                ResultSet rs=pst.executeQuery();
                                if(rs.next())
                                {
                                %>	
                                <h6 class="mb-0"><%=rs.getInt(1) %></h6>
                                <%
                                    } cn.close();
                                %>
                                
                                
                               
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Product</p>
                                <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
                                
                                PreparedStatement pst1=cn1.prepareStatement("select count(*) from product");
                                ResultSet rs1=pst1.executeQuery();
                                if(rs1.next())
                                {
                                %>	
                                <h6 class="mb-0"><%=rs1.getInt(1) %></h6>
                                <%} cn1.close();
                                %>
                                
                                
                               
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Pending-Booking</p>
                                <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
                                
                                PreparedStatement pst2=cn2.prepareStatement("select count(*) from book where status='pending'");
                                ResultSet rs2=pst2.executeQuery();
                                if(rs2.next())
                                {
                                %>	
                                <h6 class="mb-0"><%=rs2.getInt(1) %></h6>
                                <%} cn2.close();
                                %>
                                
                               
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Completed Booking</p>
                                <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn3=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
                                
                                PreparedStatement pst3=cn3.prepareStatement("select count(*) from book where status='complete?'");
                                ResultSet rs3=pst3.executeQuery();
                                if(rs3.next())
                                {
                                %>	
                                <h6 class="mb-0"><%=rs3.getInt(1) %></h6>
                                <%} cn3.close();
                                %>
                                
                                
                                
                            </div>
                        </div>
                    </div>
                    
                    
                     <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Completed Booking</p>
                                <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn4=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
                                
                                PreparedStatement pst4=cn4.prepareStatement("select count(*) from book where status='complete?'");
                                ResultSet rs4=pst4.executeQuery();
                                if(rs4.next())
                                {
                                %>	
                                <h6 class="mb-0"><%=rs4.getInt(1) %></h6>
                                <%} cn4.close();
                                %>
                                
                                
                                
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    </div>
                    </div>
                    
                    

</body>
</html>