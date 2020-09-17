

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
try{
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
       String address=request.getParameter("address");
    String uname=request.getParameter("uname");
    String pwd=request.getParameter("password");
   
    int count=0;
    String query="select count(*) from user where email='"+email+"'";
    
   ResultSet rs=DatabaseConnection.getExecuteQuery(query);
  while(rs.next()){
     count=rs.getInt(1); 
  }
    if(count==0){
     String query1="insert into user values(null,'"+name+"','"+email+"','"+mobile+"','"+address+"','"+uname+"','"+pwd+"','waiting')";
       int i=DatabaseConnection.getExecuteUpdate(query1);
       
        if(i>0){
         %>
        <script type="text/javascript">
            window.alert("Registration Successfull....!!!");
            window.location="Register.jsp";
        </script>  
        
        <%   
        }else{
 %>
        <script type="text/javascript">
            window.alert("Registration Failed....!!!");
            window.location="Register.jsp";
        </script>  
        
        <%   
}
        
        
    }else{
        %>
        <script type="text/javascript">
            window.alert("Email Already Exist");
            window.location="Register.jsp";
        </script>  
        
        <%
    }
    
    
}catch(Exception e){
 out.println(e);   
}






%>