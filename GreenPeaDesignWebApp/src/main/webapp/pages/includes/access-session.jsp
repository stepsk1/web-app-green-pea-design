<%@ page import="com.example.model.User" %>
<%--<%--%>
<%--    HttpSession accessSession = request.getSession(false);--%>
<%--    System.out.println(accessSession.toString());--%>
<%--    System.out.println(accessSession);--%>
<%--    if (accessSession == null || accessSession.getAttribute("auth") == null)--%>
<%--    {--%>
<%--        response.sendRedirect("/login"); // redirect to the login page if not logged in--%>
<%--    }--%>
<%--%>--%>

<%
    User checkSession = (User) request.getSession().getAttribute("auth");
    System.out.println(checkSession.toString());
    if ( checkSession == null )
    {
        response.sendRedirect("/login");
    }
%>