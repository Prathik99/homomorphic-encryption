

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String username=request.getParameter("uname");
String password=request.getParameter("password");

try{
   if(username.equalsIgnoreCase("Cloud")&&password.equalsIgnoreCase("Cloud")){
       %>
       <script type="text/javascript">
           window.alert("Login Successfully....!!!");
           window.location="CloudHome.jsp";
       </script>
       <%
   } else{
 %>
       <script type="text/javascript">
           window.alert("Login Failed....!!!");
           window.location="index.html";
       </script>
       <%
}
}
catch(Exception e){
 out.println(e);   
}
%>