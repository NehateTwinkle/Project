<%@page import="com.model.customermodel"%>
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
    </head>
<body>
<%@ include file="cust-header.jsp" %>

 <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>Customer Booking Details</h2>
                            <p>Home <span>-</span>Booking Page</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    
    <div class="whole-wrap">
		<div class="container box_1170">
    <div class="section-top-border">
			<div class="row">
				<div class="col-lg-8 col-md-8">
					<h3 class="mb-30"> Booking Form</h3>
					<%
					 int productid=Integer.parseInt(request.getParameter("productid"));
					String pname=request.getParameter("pname");
					String price=request.getParameter("price");
					customermodel model=(customermodel)session.getAttribute("model");
					%>
					<form method="post" action="customercontroller">
						<div class="mt-10">
							<input type="text" name="fname" placeholder="First Name" value="<%=model.getFname() %>" class="single-input">
						</div>
						<div class="mt-10">
							<input type="text" name="lname" placeholder="Last Name" value="<%=model.getLname() %>"  class="single-input">
						</div>
						
						<div class="mt-10">
							<input type="email" name="email" placeholder="Email address" 
								value="<%=model.getEmail()%>" class="single-input">
						</div>
						<div class="mt-10">
							<input type="text" name="mobile" placeholder="Mobile" 
								value="<%=model.getMobile() %>" class="single-input">
						</div>
						
						<div class="mt-10">
							<input type="text" name="pname"  value="<%=pname%>" class="single-input">
						</div>
						<div class="mt-10">
							<input type="text" name="price" value="<%=price %>" class="single-input">
							<input type="hidden" name="productid"  value="<%=productid %>" class="single-input">
							<input type="hidden" name="customerid"  value="<%=model.getCustomerid() %>" class="single-input">
							
						</div>
						<div><input type="submit" name="action" class="btn btn-primary" value="book"></div>

					</form>
				</div>
				
						
					
					
						
					</div>
				</div>
			</div>
		</div>
	
	




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