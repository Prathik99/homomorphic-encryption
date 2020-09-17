

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
   <link rel="stylesheet" href="table.css">
   <!-- Colors CSS -->
   <link rel="stylesheet" href="css/colors.css">
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
              
                  <div id="navbar" class="navbar-collapse collapse">
                     <ul class="nav navbar-nav">
                        <li><a href="AdminHome.jsp">Home</a></li>
                        <li><a data-scroll href="ViewRequest.jsp">View Request</a></li>
                        <li><a data-scroll href="SendRequest.jsp">Send Request</a></li>
                         <li><a  class="active" data-scroll href="RequestStatus.jsp">Request Status</a></li>
                          <li><a data-scroll href="Decryption.jsp">Decrypt</a></li>
                        <li><a data-scroll href="http://localhost:8084/Patient_Monitoring_System/index.html">Log Out</a></li>
                     </ul>
                  </div>
               </nav>
               
            </div>
         </div>
      </header>
   <center>
       <%String username=(String)session.getAttribute("username");
      String email=(String)session.getAttribute("email");%>
      
    <h2 style="margin-bottom:80px;margin-top:300px;"><span>Welcome:</span> <%=username%></h2>
    
    
<table>
    <h3>View Request Status</h3>
        <tr>
            <th>Sender To</th><th>Message</th><th>Status</th><th>Requested Time</th>
            
        </tr>
        <%try{
            ResultSet r=DatabaseConnection.getExecuteQuery("select * from request where sender='"+email+"'");
            while(r.next()){
              %>
              <tr>
                  <td><%=r.getString("receiver")%></td>
                  <td><%=r.getString("message")%></td>
                   <td><%=r.getString("kstatus")%></td>
                          <td><%=r.getString("date")%></td>
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
