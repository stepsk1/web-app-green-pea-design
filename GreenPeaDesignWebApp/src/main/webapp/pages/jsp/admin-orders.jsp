<%@ page import="com.example.dao.ProjectDao" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.example.dao.OrderDao" %>
<%@ page import="com.example.dao.UserDao" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
  DecimalFormat formatPrice = new DecimalFormat("#.##");
  request.setAttribute("formatPrice", formatPrice);

  List<Order> orders = new OrderDao().getAllOrders();
  UserDao userDao = new UserDao();
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

  <title>Orders</title>
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
      All Pending Orders
    </div>
  </div>
</header>

<main>
  <section class="cart-grid">
    <div class="cart-total-amount">
      <p>Go Back to store</p>
      <a href="/shop">Store<i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i></a>
      <p>Add a new product</p>
      <a href="/add-product">New Product<i class="fa-regular fa-file" style="color: #ffffff;"></i></a>
    </div>
    <div class="table-wrap">
      <table>
        <thead>
        <tr>
          <th>Date</th>
          <th>Username</th>
          <th>Email</th>
          <th>Title</th>
          <th>Category</th>
          <th>Quantity</th>
          <th>Price</th>
          <th>Cancel</th>
        </tr>
        </thead>
        <tbody>
        <% if ( orders != null )
        {
          for ( Order order : orders )
          {
            User userOrder = userDao.getUserByID(order.getUserID());
        %>
        <tr>
          <td><%=order.getDate()%></td>
<%--          <td><%=order.getId()%></td>--%>
          <td><%=userOrder.getUsername()%></td>
          <td><%=userOrder.getEmail()%></td>
          <td><%=order.getTitle()%></td>
          <td><%=order.getCategory()%></td>
          <td><%=order.getQuantity()%></td>
          <td>$<%=formatPrice.format(order.getPrice())%></td>
          <td><a onclick="return showContinueConfirmation ()" class="cancel-order" href="/cancel-order?id=<%=order.getOrderID()%>">Delete Order<i class="fa-solid fa-delete-left"></i></a></td>
        </tr>
        <%
            }
          }
        %>
        </tbody>
        <tfoot>
        <tr>
          <td colspan="8"><a onclick="return showContinueConfirmation()" class="cancel-order" href="/cancel-all-orders">Delete All <i class="fa-solid fa-trash" style="color: #ffffff;"></i></a></td>
        </tr>
        </tfoot>
      </table>
    </div>
  </section>
</main>

<%@ include file="../includes/footer-section.jsp" %>
</body>
</html>