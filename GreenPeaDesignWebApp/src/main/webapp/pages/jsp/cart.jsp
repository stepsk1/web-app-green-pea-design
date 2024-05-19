<%@ page import="com.example.dao.ProjectDao" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.example.dao.OrderDao" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../includes/access-session-customer.jsp" %>

<%
    ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProjects = null;
    double cartPrice = 0;

    DecimalFormat formatPrice = new DecimalFormat("#.##");
    request.setAttribute("formatPrice", formatPrice);

    if ( cartList != null )
    {
        ProjectDao projectDao = new ProjectDao();
        cartProjects = projectDao.getCartProducts(cartList);

        cartPrice = projectDao.getCartPrice(cartList);

        request.setAttribute("cartPrice", cartPrice);
        request.setAttribute("cartProjects", cartList);

        session.setAttribute("cartProjects", cartList);
    }
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

<header>
    <div class="header-wrap-cart">
        <div class="header-wrap-title">
            Your Cart
        </div>
    </div>
</header>

<main>
    <section class="cart-grid">
        <div class="cart-total-amount">
            <p>Total Price: </i><span class="cart-total-price">$${ cartPrice > 0 ? formatPrice.format(cartPrice) : 0.00 }</span></p>
            <a onclick="return showContinueConfirmation()" href="/check-out">Check Out <i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i></a>
        </div>
        <div class="table-wrap">
            <table>
                <thead>
                <tr>
                    <th>Column Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Buy Now</th>
                    <th>Cancel</th>
                </tr>
                </thead>
                <tbody>
                <% if ( cartList != null )
                {
                    for ( Cart project : cartProjects )
                    {
                %>
                <tr>
                    <td><%=project.getTitle()%></td>
                    <td><%=project.getCategory()%></td>
                    <td>$<%=formatPrice.format(project.getPrice())%></td>
                    <td>
                        <form action="/order-now" method="post">
                            <input type="hidden" name="id" value="<%=project.getId()%>">
                            <a href="/quantity-change?action=dec&id=<%=project.getId()%>"><i class="fa-solid fa-minus"></i></a>
                            <input readonly type="number" min="1" max="100" name="quantity" value="<%=project.getQuantity()%>">
                            <a href="/quantity-change?action=inc&id=<%=project.getId()%>"><i class="fa-solid fa-plus"></i></a>
                            <button class="buy-now-button card-action-add-to-cart" onclick="return showContinueConfirmation()" type="submit">Buy</button>
                        </form>
                    </td>
                    <td><a onclick="return showContinueConfirmation()" class="cancel-order" href="/remove-from-cart?action=single&id=<%=project.getId()%>">Cancel Project<i class="fa-solid fa-delete-left"></i></a></td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="5"><a onclick="return showContinueConfirmation()" class="cancel-order" href="/remove-from-cart?action=all&id=-1">Remove All <i class="fa-solid fa-trash" style="color: #ffffff;"></i></a></td>
                </tr>
                </tfoot>
            </table>
        </div>
    </section>
</main>

<%@ include file="../includes/footer-section.jsp" %>
</body>
</html>