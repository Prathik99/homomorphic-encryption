

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%String id=request.getParameter("id");
if(id!=null){
  %>
  <script type="text/javascript">
      window.alert("Encrypted Success");
      window.location="ViewAllFiles.jsp";
  </script>
<%  
}else{
%>
  <script type="text/javascript">
      window.alert("Encrypted Failed");
      window.location="ViewAllFiles.jsp";
  </script>
<%
}%>