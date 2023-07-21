<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.DBUtil.Cutil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>aranoz</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
    
   
<script>  
var request=new XMLHttpRequest();  
function searchInfo()
{  
	var name=document.vinform.name.value;  
	var url="cust-home1.jsp?val="+name;  
  	try
  	{  
		request.onreadystatechange=function()
		{  
			if(request.readyState==4)
			{  
				var val=request.responseText;  
				document.getElementById('tops').innerHTML=val;  
			}  
		}  
		request.open("GET",url,true);  
		request.send();  
	}
  	catch(e)
  	{
  		alert("Unable to connect to server");
  	}  
}  
</script>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajax Search Example</title>
</head>
  
<body>
<%@ include file="cust-header.jsp" %>
<%@ include file="slider.jsp" %>
<h1>Serch medicine</h1>
<form name="vinform">
<input type="text" name="name" onkeyup="searchInfo()">

</form>
<span id="tops"></span>

<section class="feature_part padding_top">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                  <div class="section_tittle text-center">
                        <h2>Medicine Product </h2>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-between">
            <%
                Connection cn = new Cutil().getdata();
            String sql="select * from product";
            PreparedStatement ps=cn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
            	
    %> 
                <div class="col-lg-6 col-sm-6">
                    <div class="single_feature_post_text">
                        <p><%= rs.getString(3) %>(Rs : <%=rs.getString(7) %>)</p>
                        <h3><%=rs.getString(2) %></h3>
                        <a href="book.jsp?productid=<%=rs.getInt(1) %>&pname=<%=rs.getString(2) %>&price=<%=rs.getString(7) %>" class="feature_btn">Book<i class="fas fa-play"></i></a>
                        <img src="image/<%=rs.getString(8) %>" height="200px" width="200" alt="">
                    </div>
                </div>
                
                <%
            }
            cn.close();
                
                %>
                
            </div>
        </div>
    </section>

<%@ include file="footer.jsp" %>

    <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="js/masonry.pkgd.js"></script>
    <!-- particles js -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="js/slick.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>

</body>
</html>




