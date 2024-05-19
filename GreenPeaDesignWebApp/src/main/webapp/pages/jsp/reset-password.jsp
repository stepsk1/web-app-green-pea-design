<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../includes/access-session.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signin.css">

    <%@ include file="../includes/const-style.jsp" %>
    <title>Log in</title>
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
    
    <main class="main-sign-up-wrap">
        <section class="reset-password-wrap">
            <div class="sign-up-title">
                Reset Password
                <p>Reset your password by providing your account email below.</p>
            </div>
            <form class="sign-up-form" action="reset-password-response.jsp">

                <div>
                    <label for="sign-up-email">Email: </label>
                    <input id="sign-up-email" name="email" type="email" required>
                </div>

                <button type="submit">Next</button>
            </form>
        </section>
    </main>

    <%@ include file="../includes/footer-section.jsp" %>
</body>
</html>