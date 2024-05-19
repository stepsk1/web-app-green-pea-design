<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Style -->    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/logo-design-elements.css">

    <%@ include file="../includes/const-style.jsp" %>
    <title>Vision</title>
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

<body id="header">
    <%@ include file="../includes/navigation-bar.jsp" %>

    <header>
        <div class="logo-design-elements-hero-wrap">
            <div class="header-wrap-title">
                Unlock Your<br>Brand's Potential
            </div>
            <div class="header-wrap-subtitle">
                Elevate Your Identity with Stunning Logo Designs & various other elements to effectively scale your business.
            </div>
        </div>
    </header>
    
    <main>
        <section class="shop-wrap">
            <nav class="shop-nav-wrap">
                <a href="#header">Home</a>
                <a href="#behind-the-logo">Behind the Logo</a>
                <a href="#our-process">Our process</a>
                <a href="#connect-with-us">Connect with us</a>
                <a href="#design-assets">Design Assets</a>
                <a href="#testimonials">Testimonials</a>
            </nav>
        </section>

        <script>
            document.addEventListener("DOMContentLoaded", function ()
            {
                const navLinks = document.querySelectorAll(".shop-nav-wrap a[href^='#']");

                navLinks.forEach(link =>
                {
                    link.addEventListener("click", function (event)
                    {
                        event.preventDefault();
                        const target = document.querySelector(this.getAttribute("href"));
                        if (target)
                        {
                            const topOffset = target.getBoundingClientRect().top + window.scrollY;
                            window.scrollTo({ top: topOffset, behavior: "smooth" });
                        }
                    });
                });
            });
        </script>

        <section class="logo-design-elements-wrap">

            <section id="behind-the-logo" class="logo-design-elements-behind-the-logo">
                <div class="title-paragraph-section">
                    <h2 class="logo-design-elements-section-title">Behind the Logo</h2>
                    <div class="logo-design-elements-section-brief">
                        <h3>Unveiling the Soul of Your Brand</h3>
                        <p>
                            Discover the captivating stories that lie beneath each of our unique logo designs.
                            We dive deep into your brand's essence to create a visual identity that resonates
                            with your audience on a profound level. Our logos aren't just designs; they are
                            powerful narratives that speak volumes about your business.
                        </p>
                    </div>
                    <div class="logo-design-elements-behind-the-logo-image"></div>
                </div>
                <div class="logo-design-elements-behind-the-logo-gallery">
                    <img src="${pageContext.request.contextPath}/pages/assets/a%20(3).png" alt="logo-preview">
                    <img src="${pageContext.request.contextPath}/pages/assets/a%20(17).png" alt="logo-preview">
                    <img src="${pageContext.request.contextPath}/pages/assets/a%20(8).png" alt="logo-preview">
                    <img src="${pageContext.request.contextPath}/pages/assets/a%20(24).png" alt="logo-preview">
                </div>
            </section>

            <section id="our-process" class="logo-design-elements-behind-the-logo">
                <div class="title-paragraph-section">
                    <h2 class="logo-design-elements-section-title">Our Process</h2>
                    <div class="logo-design-elements-section-brief">
                        <h3>Crafted with Care, Perfected with Passion</h3>
                        <p>
                            At our design agency, excellence is our tradition.
                            Our meticulous process ensures that every logo is a masterpiece.
                            From initial concepts to final execution, we pour our heart and soul into each step.
                            Our dedication to quality and innovation is what sets us apart, delivering logos that leave a lasting impact.
                        </p>
                    </div>
                    <div class="logo-design-elements-our-process-image"></div>
                </div>
            </section>

            <section  id="connect-with-us" class="logo-design-elements-behind-the-logo">
                <div class="title-paragraph-section">
                    <h2 class="logo-design-elements-section-title">Connect with Us</h2>
                    <div class="logo-design-elements-section-brief">
                        <h3>Personalized Projects or Ready-Made Perfection</h3>
                        <p>
                            Whether you seek a bespoke logo crafted exclusively for your brand or prefer
                            the convenience of pre-made assets, we've got you covered. Our team of experts
                            is eager to bring your vision to life through custom projects. Alternatively,
                            explore our extensive store of design assets for quick and impressive solutions.
                        </p>
                    </div>
                    <div class="logo-design-elements-behind-the-logo-gallery">
                        <img src="${pageContext.request.contextPath}/pages/assets/a%20(12).png" alt="logo-preview">
                        <a class="logo-design-elements-shop-button" href="/shop">Check Out Our Store<i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i></a>
                    </div>
                </div>
            </section>
            
            <section id="design-assets" class="logo-design-elements-connect-design-assets">
                <h2 class="logo-design-elements-section-title">Design Assets</h2>
                <div>
                    <h3>Empowering Your Creativity</h3>
                    <p>
                        Unlock a treasure trove of design assets curated to empower your creative endeavors. 
                        Our collection boasts a vast array of premium logo elements, allowing you to infuse your 
                        brand with a unique personality effortlessly. Fuel your imagination and bring your ideas 
                        to life with our thoughtfully crafted assets.
                    </p>
                </div>
            </section>
            
            <section id="testimonials" class="logo-design-elements-connect-testimonials">
                <h2 class="logo-design-elements-section-title">Testimonials</h2>
                <div>
                    <h3>Experiences That Speak Louder Than Words</h3>
                    <p>
                        Our clients' success stories inspire us to keep pushing the boundaries of design. 
                        Here's what they have to say about their transformative journey with us. 
                        Join the ranks of delighted businesses who have redefined their 
                        identities with our unparalleled logo designs and elements.
                    </p>
                </div>
            </section>

            <section id="logo-design-elements-quote">
                    <p>
                        Unlock your brand's true potential today. 
                        Contact us for a custom project or browse our store for ready-to-use design assets.
                    </p>
            </section>
        </section>
    </main>

    <%@ include file="../includes/footer-section.jsp" %>
</body>
</html>