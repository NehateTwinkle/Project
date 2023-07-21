    <%@ page import="java.sql.*" %>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      
    <%  
    String name=request.getParameter("val");  
    if(name==null||name.trim().equals(""))
    {  
    	out.print("<p>Please enter name!</p>");  
    }
    else
    {  
    	try
    	{  
    		Class.forName("com.mysql.jdbc.Driver");
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");  
    		PreparedStatement ps=con.prepareStatement("select * from product where pname like '"+name+"%'");  
    		ResultSet rs=ps.executeQuery();  
      		if(!rs.isBeforeFirst()) 
      		{      
     			out.println("<p>No Record Found!</p>");   
    		}
      		else
      		{  
    			out.print("<table border='1' cellpadding='2' width='100%'>");  
    			out.print("<tr><th>productid</th><th>pname</th><th>cname</th><th>content</th><th>Mdate</th><th>Edate</th><th>price</th></tr>");  
    			while(rs.next())
    			{  
    				out.print("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td></tr>");  
    			}  
    			out.print("</table>");  
    		}  
    		con.close();  
    	}
    	catch(Exception e)
    	{
    		out.print(e);
    	}  
    }  
    %>  