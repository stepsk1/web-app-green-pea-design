<%@ page import="com.example.dao.ProjectDao" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.example.dao.OrderDao" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../includes/access-session-admin.jsp" %>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/card.css">

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
            <div class="change-product-form-wrap">
                <h1>Modify or Delete</h1>
                <p class="error-notify">${errorUpdate}</p>
                <p class="success-notify">${successUpdate}</p>
                <form class="change-product-form" method="post" action="/project-update">
                    <input id="id" type="hidden" name="id" value="<%=p.getId()%>">
                    <div class="change-product-form-field-wrap">
                        <label for="title">Title: </label>
                        <input id="title" type="text" name="title" value="<%=p.getTitle()%>">
                    </div>

                    <div class="change-product-form-field-wrap">
                        <label for="category">Category: </label>
                        <input id="category" type="text" name="category" value="<%=p.getCategory()%>">
                    </div>

                    <div class="change-product-form-field-wrap">
                        <label for="desc">Description: </label>
                        <textarea id="desc" name="description"><%=p.getDescription()%></textarea>
                    </div>

                    <div class="change-product-form-field-wrap">
                        <label for="price">Price: </label>
                        <input id="price" type="text" name="price" value="<%=p.getPrice()%>">
                    </div>

                    <div class="change-product-form-field-wrap">
                        <label for="url">Url: </label>
                        <input id="url" type="text" name="url" value="<%=p.getImage()%>">
                    </div>
                    <br>
                    <br>
                    <div class="card-action">
                        <button type="submit" onclick="return showContinueConfirmation()" class="card-action-edit-card-button">Edit Project<i class="fa-regular fa-pen-to-square" style="color: #ffffff;"></i></button>
                        <a onclick="return showContinueConfirmation()" href="/project-delete?id=<%=p.getId()%>" class="card-action-remove-card">Delete Project<i class="fa-solid fa-xmark" style="color: #ffffff;"></i></a>
                        <a class="back-to-store-button" href="/shop">Go Back Store<i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i></a>
                    </div>
                </form>

            </div>
        </div>

        <script>
            const productImage = document.querySelector('.product-action-image');
            const editButton = document.querySelector('.card-action-edit-card-button');
            const deleteButton = document.querySelector('.card-action-remove-card');

            editButton.addEventListener('mouseover', () =>
            {
                productImage.style.backgroundColor = '#fb8500';
                productImage.style.transition = 'background-color 0.2s, opacity 0.2s';
            });

            editButton.addEventListener('mouseout', () =>
            {
                productImage.style.backgroundColor = '#0082276a';
            });

            deleteButton.addEventListener('mouseover', () =>
            {
                productImage.style.backgroundColor = '#ef233c';
                productImage.style.transition = 'background-color 0.2s, opacity 0.2s';
            });

            deleteButton.addEventListener('mouseout', () =>
            {
                productImage.style.backgroundColor = '#0082276a';
            });

        </script>
    </section>
</main>


<%@ include file="../includes/footer-section.jsp" %>
</body>
</html>