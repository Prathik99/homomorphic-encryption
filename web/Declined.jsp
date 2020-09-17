

<%@page import="com.database.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id=request.getParameter("id");

try{
   
    String query="update request set status='Declined' where id='"+id+"'";
   
    int i=DatabaseConnection.getExecuteUpdate(query);
    
    if(i>0){
      %>
      <script type="text/javascript">
          window.alert("Request Declined ...!!!");
          window.location="ViewRequest.jsp";
      </script>
      <%
    }else{
%>
      <script type="text/javascript">
          window.alert("Failed To Decline Request...!!!");
          window.location="ViewRequest.jsp";
      </script>
      <%
}
    
}catch(Exception e){
  out.println(e);  
}


%>
