<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>DASHMIN - Bootstrap Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
<div class="content">
<%@ include file="header.jsp" %>
<%@ include file="sidebar.jsp" %>
<div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">feedback form</h6>
                        <a href="">Show All</a>
                    </div>
                    <div class="table-responsive">
                    <form action = "admincontroller" method = "post">                      
                      <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-dark">
                                    <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                    <th scope="col">Fid</th>
                                    <th scope="col">Cid</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Remark</th>
                                    <th scope="col">Star</th>
                                 
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                        Class.forName("com.mysql.jdbc.Driver");
                            		Connection	cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","root","");
                            			
                            			PreparedStatement st= cn.prepareStatement("select * from feedback");
                            			ResultSet rs =st.executeQuery();
                            			while(rs.next())
                            			{
                            			%>
                               <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td><%=rs.getInt(1) %></td>
                                    <td><%=rs.getString(2) %></td>
                                    <td><%=rs.getString(3) %></td>
                                    <td><%=rs.getString(4) %></td>
                                    <td><%=rs.getString(5) %></td>
                                    
                                    
                                    
                                    
                                    
                                    
                                    <td><a class="btn btn-sm btn-primary" href="../admincontroller?action=deletefeedback&fid=<%=rs.getInt(1)%>">Delete</a>
                                    
                                   
                                    
                                    
                                    </td>
                                </tr>
                                  <%
                            			}
                                        %>
                            </tbody>
                        </table>
                        </form>
                    </div>
                </div>
            </div>
<%@ include file="footer.jsp" %>
 <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>


 <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>

</body>
</html>