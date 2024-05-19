<%@ page import="com.example.dao.ProjectDao" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.example.dao.OrderDao" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    ProjectDao projectDao = new ProjectDao();
    int id = Integer.parseInt(request.getParameter("id"));

    Project p = projectDao.getProjectByID(id);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">

    <%@ include file="../includes/const-style.jsp" %>

    <title>Store</title>
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

<main>
    <section class="product-wrap">
        <div class="product">
            <div class="product-action-image">
                <img src="${pageContext.request.contextPath}/<%=p.getImage()%>" alt="project-image">
            </div>
            <div class="product-title">
                <h3><%=p.getTitle()%></h3>
                <h4><%=p.getCategory()%></h4>

                <%
                    if ( auth != null )
                    {
                        if ( auth.getRole().equalsIgnoreCase("customer") == true)
                        {
                %>
                <div class="card-action">
                    <a href="/add-to-cart?id=<%=p.getId()%>" class="card-action-add-to-cart">Add to Card $<%=p.getPrice()%></a>
                    <a onclick="return showContinueConfirmation()" href="/order-now?quantity=1&id=<%=p.getId()%>" class="card-action-buy-now">Buy Now $<%=p.getPrice()%></a>
                </div>
                <%
                        }
                    }
                %>
                <div class="product-about-text">
                    <p><%=p.getDescription()%></p>
                </div>
                <br>
                <br>
                <div class="product-about-text">
                    <p>Do you want to check out more items?</p><br><br>
                    <a class="back-to-store-button" href="/shop">Store<i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i></a>
                </div>
            </div>
        </div>

        <script>
            const productImage = document.querySelector('.product-action-image');
            const buyNowButton = document.querySelector('.card-action-buy-now');
            const addToCart = document.querySelector('.card-action-add-to-cart');

            buyNowButton.addEventListener('mouseover', () =>
            {
                productImage.style.backgroundColor = '#008227';
                productImage.style.transition = 'background-color 0.2s, opacity 0.2s';
            });

            buyNowButton.addEventListener('mouseout', () =>
            {
                productImage.style.backgroundColor = '#0082276a';
            });

            addToCart.addEventListener('mouseover', () =>
            {
                productImage.style.backgroundColor = '#2f4ebc';
                productImage.style.transition = 'background-color 0.2s, opacity 0.2s';
            });

            addToCart.addEventListener('mouseout', () =>
            {
                productImage.style.backgroundColor = '#0082276a';
            });

        </script>
    </section>
</main>


<%@ include file="../includes/footer-section.jsp" %>
</body>
</html>