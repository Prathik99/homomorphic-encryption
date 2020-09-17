

<%@page import="com.database.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%try{
    String user=(String)session.getAttribute("username");
 String email=(String)session.getAttribute("email");
           String username=request.getParameter("user");
           String password=request.getParameter("message");
         
            
        
           int i=DatabaseConnection.getExecuteUpdate("insert into request values(null,'"+email+"','"+username+"','"+password+"','waiting',now())");
           
           if(i>0){
             %>
             <script type="text/javascript">
                 window.alert("Request Sent Successfully.");
                 window.location="SendRequest.jsp";
             </script> 
             <%
           }else{
               %>
             <script type="text/javascript">
                 window.alert("Request Send Failed.");
                 window.location="SendRequest.jsp";
             </script> 
             <%
           }

          
            
        }catch(Exception e){
         System.out.println(e);   
        }



%>