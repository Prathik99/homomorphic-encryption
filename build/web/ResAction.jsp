

<%@page import="cloud.upload.Mail"%>
<%@page import="com.database.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id=request.getParameter("id");
String sender=request.getParameter("sender");
String key=request.getParameter("key");
try{
    String message="the image descryption key:"+key;
    int i=DatabaseConnection.getExecuteUpdate("update request set kstatus='"+key+"' where id='"+id+"'");
    if(i>0){
     Mail.secretMail(message, sender, sender);
     response.sendRedirect("ViewRequest.jsp?msg=success");
    }else{
         response.sendRedirect("ViewRequest.jsp?msg=failed"); 
    }
}catch(Exception ee){
  out.println(ee);  
}
%>