

<%@page import="com.database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%String username=request.getParameter("uname");
String password=request.getParameter("password");
try{
    String query="select * from admin where username='"+username+"'and password='"+password+"'";
    
    ResultSet r=DatabaseConnection.getExecuteQuery(query);

    if(r.next()){

 %>
        <script type="text/javascript">
            window.alert("Login Successfull....!!!");
            window.location="AdminHome.jsp";
        </script>  
        
        <%  

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