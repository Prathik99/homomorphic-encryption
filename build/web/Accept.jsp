

<%@page import="com.database.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id=request.getParameter("id");

try{
   
    String query="update user set status='Accepted' where id='"+id+"'";
   
    int i=DatabaseConnection.getExecuteUpdate(query);
    
    if(i>0){
      %>
      <script type="text/javascript">
          window.alert("User Authorized Successfully...!!!");
          window.location="ViewAllUsers.jsp";
      </script>
      <%
    }else{
%>
      <script type="text/javascript">
          window.alert("Failed To Authorize User...!!!");
          window.location="ViewAllUsers.jsp";
      </script>
      <%
}
    
}catch(Exception e){
  out.println(e);  
}


%>
