<%@ page import="com.example.dao.ProjectDao" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.example.dao.OrderDao" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
            <div class="product-action-image-logo" style="background-color: #fff">
                <img src="${pageContext.request.contextPath}/pages/assets/icon.svg" alt="logo">
            </div>
            <div class="change-product-form-wrap">
                <h1>Add New Project</h1>
                <p class="error-notify">${errorUpdate}</p>
                <p class="success-notify">${successUpdate}</p>
                <form class="change-product-form" method="post" action="/project-new" enctype="multipart/form-data">
                    <input id="id" type="hidden" name="id">
                    <div class="change-product-form-field-wrap">
                        <label for="title">Title: </label>
                        <input id="title" type="text" name="title" placeholder="Enter a title" required>
                    </div>

                    <div class="change-product-form-field-wrap">
                        <label for="category">Category: </label>
                        <input id="category" type="text" name="category"placeholder="Enter a category" required>
                    </div>

                    <div class="change-product-form-field-wrap">
                        <label for="desc">Description: </label>
                        <textarea id="desc" name="description"></textarea>
                    </div>

                    <div class="change-product-form-field-wrap">
                        <label for="price">Price: </label>
                        <input id="price" type="text" name="price" placeholder="Add a price" required>
                    </div>

                    <div class="change-product-form-field-wrap">
                        <label for="image-input-button">Image: </label>
                        <input id="image-input-button" type="file" name="image" accept="image/jpeg,image/png" required>
                    </div>
                    <br>
                    <br>
                    <div class="card-action">
                        <button type="submit" onclick="return showContinueConfirmation()" class="card-action-edit-card-button">New Project</button>
                    </div>
                </form>

            </div>
        </div>
    </section>
</main>


<%@ include file="../includes/footer-section.jsp" %>
</body>
</html>