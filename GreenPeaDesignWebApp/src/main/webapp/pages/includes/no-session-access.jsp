<%@ page import="com.example.model.User" %>

<%
  HttpSession checkSession = request.getSession(false);
  if (checkSession != null && checkSession.getAttribute("auth") != null)
  {
    response.sendRedirect("/vision");
  }
%>