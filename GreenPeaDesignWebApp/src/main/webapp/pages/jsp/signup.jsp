<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">

    <%@ include file="../includes/const-style.jsp" %>
    <title>Sign Up</title>
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
        <section class="sign-up-wrap">
            <div class="sign-up-title">
                Sign up
                <br>
                <p class="error-notify">${error}</p>
                <p class="success-notify">${success}</p>
            </div>
            <form class="sign-up-form" method="POST" action="/user-register">
                <div>
                    <label for="sign-up-name">Full Name: </label>
                    <input id="sign-up-name" name="name" type="text" required minlength="3" maxlength="20" required>
                </div>

                <div>
                    <label for="sign-up-email">Email: </label>
                    <input id="sign-up-email" name="email" type="email" required>
                </div>

                <div>
                    <label for="sign-up-password">Password: </label>
                    <input id="sign-up-password" name="password" type="password" required>
                </div>

                <div>
                    <label for="sign-up-password-confirm">Confirm Password: </label>
                    <input id="sign-up-password-confirm" name="confirm-password" type="password" required>
                </div>
                
                <button type="submit">Sign up</button>
            </form>
            <div class="sign-up-wrap-bottom">
                Already have an account? <a href="/login">Log in</a>
            </div>
        </section>
    </main>

    <%@ include file="../includes/footer-section.jsp" %>
</body>
</html>