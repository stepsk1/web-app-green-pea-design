<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">

    <%@ include file="../includes/const-style.jsp" %>
    <title>Sign In</title>
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
        <section class="login-wrap">
            <div>
                <h2>Become a Member</h2>
                <p>Excited to purchase your logo designs, elements and various other elements from our online store? You'll find them all here after you sign up!</p>
                <a href="/signup"><button>SIGN UP</button></a>
            </div>
            <div>
                <h2>Already a Member</h2>
                <p>Login here to find all of your membership content, happy to have you!</p>
                <a href="/login"><button>LOGIN</button></a>
            </div>
        </section>
    </main>

    <%@ include file="../includes/footer-section.jsp" %>
</body>
</html>