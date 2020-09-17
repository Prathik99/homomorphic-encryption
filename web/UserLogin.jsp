

<%@page import="com.database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%String username=request.getParameter("uname");
String password=request.getParameter("pass");
try{
    String query="select * from user where username='"+username+"'and password='"+password+"'";
    
    ResultSet r=DatabaseConnection.getExecuteQuery(query);

    if(r.next()){
      String status=r.getString("status"); 
    
    if(status.equals("waiting")){
    %>
        <script type="text/javascript">
            window.alert("Sorry! Your Not Authorized By Admin....!!!");
            window.location="index.html";
        </script>  
        
        <%       
    }else{
session.setAttribute("id",r.getString("id"));
session.setAttribute("email",r.getString("email"));
session.setAttribute("username",username);
 %>
        <script type="text/javascript">
            window.alert("Login Successfull....!!!");
            window.location="UserHome.jsp";
        </script>  
        
        <%  
}
}  else{
  %>
        <script type="text/javascript">
            window.alert("Please Check Username/Password....!!!");
            window.location="index.html";
        </script>  
        
        <%      
}  
}catch(Exception e){
    out.println(e);
}


%>