<%@ page import="com.example.model.User" %><%
    HttpSession accessSession = request.getSession(false);
    if (accessSession == null || accessSession.getAttribute("auth") == null)
    {
        response.sendRedirect("/login"); // redirect to the login page if not logged in
    }
    else
    {
        User role = (User) accessSession.getAttribute("auth");
        if ( role.getRole().equalsIgnoreCase("admin") == false )
        {
            response.sendRedirect("/error");
        }
    }
%>