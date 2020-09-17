

<%@page import="com.database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
   <!-- Basic -->
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <!-- Mobile Metas -->
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <!-- Site Metas -->
   <title>Patient Monitoring System</title>
   <meta name="keywords" content="">
   <meta name="description" content="">
   <meta name="author" content="">
   <!-- Site Icons -->
   <link rel="shortcut icon" href="images/fevicon.ico.png" type="image/x-icon" />
   <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="css/bootstrap.min.css">
   <!-- Site CSS -->
   <link rel="stylesheet" href="style.css">
   <!-- Colors CSS -->
   <link rel="stylesheet" href="css/colors.css">
      <link rel="stylesheet" href="table.css">
   <!-- ALL VERSION CSS -->
   <link rel="stylesheet" href="css/versions.css">
   <!-- Responsive CSS -->
   <link rel="stylesheet" href="css/responsive.css">
   <!-- Custom CSS -->
   <link rel="stylesheet" href="css/custom.css">
   <!-- Modernizer for Portfolio -->
   <script src="js/modernizer.js"></script>
   <!-- [if lt IE 9] -->
   </head>
   <body class="clinic_version">
      <!-- LOADER -->
      <div id="preloader">
         <img class="preloader" src="images/loaders/heart-loading2.gif" alt="">
      </div>
      <!-- END LOADER -->
      <header>
         <div class="header-top wow fadeIn">
            <div class="container">
                <h1>Patient Monitoring System</h1>
               
            </div>
         </div>
         <div class="header-bottom wow fadeIn">
            <div class="container">
               <nav class="main-menu">
                  <div class="navbar-header">
                     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i class="fa fa-bars" aria-hidden="true"></i></button>
                  </div>
				  
                  <div id="navbar" class="navbar-collapse collapse">
                     <ul class="nav navbar-nav">
                        <li><a href="AdminHome.jsp">Home</a></li>
                        <li><a class="active"  data-scroll href="ViewAllUsers">View All Users</a></li>
                       
                        <li><a data-scroll href="http://localhost:8084/Patient_Monitoring_System/index.html#testimonials">Log Out</a></li>
                     </ul>
                  </div>
               </nav>
               <div class="serch-bar">
                  <div id="custom-search-input">
                     <div class="input-group col-md-12">
                        <input type="text" class="form-control input-lg" placeholder="Search" />
                        <span class="input-group-btn">
                        <button class="btn btn-info btn-lg" type="button">
                        <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                        </span>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </header>
   <center>
     <h2 style='margin-top:300px;'>**** View All Users Details ****</h2>  
                                 <center>
                                     <table border="1">
                                         <tR>
                                             <th>Name</th>
                                             <th>Email</th>
                                             <th>Mobile</th>
                                             <th>Address</th>
                                             <th>UserName</th>
                                             <th>Status</th>
                                           
                                         </tr>
                                         <%try{
                                             
                                             
                  
   
       ResultSet r=DatabaseConnection.getExecuteQuery("select * from user");
       while(r.next()){
           String status=r.getString("status");
       %>
       <tr>
           <td><%=r.getString("name")%></td>
           <td><%=r.getString("email")%></td>
           <td><%=r.getString("mobile")%></td>
           <td><%=r.getString("address")%></td>
           <td><%=r.getString("username")%></td>
           <%if(status.equals("waiting")){
            %>
            <td><a href="Accept.jsp?id=<%=r.getString("id")%>">waiting</a></td>
            <%
           }else{
%>
    <td><%=r.getString("status")%></td>         
            <%
}%>
           
       </tr>  
       
       <%
       }
                                             
                                         }catch(Exception e){
                                             out.println(e);
                                         }
                                         
                                         
                                         
                                         
                                         %>
                                     </table>
                                 </center>
                                 
      <!-- end copyrights -->
      <a href="#home" data-scroll class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
      <!-- all js files -->
      <script src="js/all.js"></script>
      <!-- all plugins -->
      <script src="js/custom.js"></script>
      <!-- map -->
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNUPWkb4Cjd7Wxo-T4uoUldFjoiUA1fJc&callback=myMap"></script>
   </body>
</html>
