<%@ page import="com.example.connection.DBConnection" %>
<%@ page import="com.example.model.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="cartProjects" class="java.util.ArrayList" scope="session" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">

    <%@ include file="../includes/const-style.jsp" %>
    <title>Home</title>
</head>

    <!-- 
    <header>	Specifies a header for a document or section
    <nav>	    Defines a navigation area
    <main>	    Specifies the main content of a document
    <aside>	    Defines content aside from the page content
    <section>	Defines a section in a document
    <article>	Defines an article
    <footer>	Defines a footer for a document or section 
    -->

<body>
    <%@ include file="../includes/navigation-bar.jsp" %>
    <% out.print(DBConnection.getConnection()); %>
    <header>${auth}</header>
    
    <main>
        <section></section>
        <section></section>
        <section></section>
        <section></section>
        <section></section>
        <section></section>
        <section></section>
        <section></section>
    </main>

    <%@ include file="../includes/footer-section.jsp" %>
</body>
</html>