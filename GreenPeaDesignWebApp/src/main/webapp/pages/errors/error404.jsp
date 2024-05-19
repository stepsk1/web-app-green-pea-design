<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">

  <%@ include file="../includes/const-style.jsp" %>
  <title>Error</title>
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

<header>
  <div class="header-wrap">
    <div class="header-wrap-title">
      Error - Something happened!
    </div>
    <div class="header-wrap-subtitle">
      You should go back.
      <div class="navbar-sign-in-wrap">
        <a href="/vision"><div>Home Page</div></a>
      </div>
    </div>
  </div>
</header>


<%@ include file="../includes/footer-section.jsp" %>
</body>
</html>