<%@ page import="com.example.dao.ProjectDao" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    ProjectDao projectDao = new ProjectDao();

    List<Project> projects = projectDao.getAllProjects();
    List<String> categories = projectDao.getAllCategories();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">

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
    ${pageContext.request.contextPath}
    <header>
        <div class="header-wrap">
            <div class="header-wrap-title">
                Our Store & Resources
            </div>
            <div class="header-wrap-subtitle">
                Wheter you are a startup just starting out or a professional 
                for some time, we can help.
            </div>
        </div>
    </header>
    
    <main>
        <section class="shop-wrap">
            <nav class="shop-nav-wrap">
                <div class="shop-nav-tag">Shop By Category</div>
                <%
                    if ( projects.isEmpty() == false )
                    {
                %>
                        <a href="/filter-category?category=all">ALL</a>
                <%
                        for ( String category : categories )
                        {
                %>
                            <a href="/filter-category?category=<%=category%>"><%=category.toUpperCase()%></a>
                <%
                        }
                    }
                %>
                <p class="error-notify" style="padding-left: 1.3rem; font-size: 1.3rem; text-transform: uppercase;">${errorUpdate}</p>
                <p class="success-notify" style="padding-left: 1.3rem; font-size: 1.3rem; text-transform: uppercase;">${successUpdate}</p>
            </nav>
        </section>
        <section class="shop-grid">
            <%
                if ( request.getAttribute("activeProjects") != null )
                {
                    projects = (List<Project>) request.getAttribute("activeProjects");
                }

                if ( projects.isEmpty() == false )
                {
                    for ( Project p : projects )
                    {
            %>
                    <div class="card-wrap">
                        <%
                            if ( auth != null && auth.getRole().equalsIgnoreCase("admin") == true )
                            {
                        %>
                            <a href="/edit?id=<%=p.getId()%>" class="card-action-image">
                                <img src="${pageContext.request.contextPath}/<%=p.getImage()%>" alt="<%=p.getImage()%>">
                            </a>
                        <%
                            }
                            else
                            {
                        %>
                            <a href="/product-page?id=<%=p.getId()%>" class="card-action-image">
                                <img src="${pageContext.request.contextPath}/<%=p.getImage()%>" alt="<%=p.getImage()%>">
                            </a>
                        <%
                            }
                        %>
                        <div class="card-about-title">
                            <h3><%=p.getTitle()%></h3>
                            <h4><%=p.getCategory()%></h4>
                        </div>
                        <div class="card-about-text">
                            <p><%=p.getDescription()%></p>
                        </div>
                        <%
                            if ( auth != null )
                            {
                                if ( auth.getRole().equalsIgnoreCase("customer") == true)
                                {
                        %>
                        <div class="card-action">
                            <a href="/add-to-cart?id=<%=p.getId()%>" class="card-action-add-to-cart">Add to Cart $<%=p.getPrice()%></a>
                            <a onclick="return showContinueConfirmation()" href="/order-now?quantity=1&id=<%=p.getId()%>" class="card-action-buy-now">Buy Now $<%=p.getPrice()%></a>
                        </div>
                        <%
                                }
                                else if ( auth.getRole().equalsIgnoreCase("admin") == true )
                                {
                        %>
                            <div class="card-action">
                                <a href="/edit?id=<%=p.getId()%>" class="card-action-edit-card">Edit Project<i class="fa-regular fa-pen-to-square" style="color: #ffffff;"></i></a>
                                <a onclick="return showContinueConfirmation()" href="/project-delete?id=<%=p.getId()%>" class="card-action-remove-card">Remove Project<i class="fa-solid fa-xmark" style="color: #ffffff;"></i></a>
                            </div>
                        <%
                                }
                            }
                        %>
                    </div>
            <%
                    }
                }
            %>
        </section>
    </main>

    <%@ include file="../includes/footer-section.jsp" %>
</body>
</html>