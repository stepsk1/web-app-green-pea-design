<%@ page import="com.example.model.*" %>

<nav class="navbar-wrap">
    <div class="navbar-logo-wrap">
        <a href="/vision"><div></div></a>
    </div>
    <div class="navbar-menu-wrap">
        <a href="/vision">Our Process & Vision</a>
        <a href="/shop">Design Store</a>
        <a href="/chat">ChatterBox</a>
        <div class="navbar-sign-in-wrap">
            <a href="/help"><div>Need Help?</div></a>
        </div>
        <%
            User auth = (User) request.getSession().getAttribute("auth");
            if ( auth != null )
            {
                if ( auth.getRole().equalsIgnoreCase("customer"))
                {
        %>
                    <a href="/cart">Cart <span class="cart-badge">${cartProjects.size()}</span><i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i></a>
                    <a href="/orders">Orders</a>
        <%
                }
                else if ( auth.getRole().equalsIgnoreCase("admin"))
                {

        %>
                <a href="/admin-orders">All Orders</a>
                <a href="/add-product">Add Project</a>
        <%
                }
        %>
                <div class="navbar-sign-in-wrap">
                    <a href="/user-logout"><div>LOGOUT</div></a>
                </div>
        <%
            }
            else
            {
        %>
                    <div class="navbar-sign-in-wrap">
                        <a href="/signin"><div>SIGN IN</div></a>
                    </div>
        <%
            }
        %>
    </div>
</nav>

<script>
    function showContinueConfirmation()
    {
        let result = confirm("Are you sure you want to continue?");
        return result;
    }
</script>