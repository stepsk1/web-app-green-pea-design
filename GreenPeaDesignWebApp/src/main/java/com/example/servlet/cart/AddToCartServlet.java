package com.example.servlet.cart;

import java.io.*;
import java.util.ArrayList;

import com.example.connection.DBConnection;
import com.example.dao.UserDao;
import com.example.model.Cart;
import com.example.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "AddToCartServlet", value = "/add-to-cart")
public class AddToCartServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        response.setContentType("text/html; charset=UTF-8");
        try( PrintWriter out = response.getWriter())
        {
            ArrayList<Cart> cartList = new ArrayList<Cart>();

            int id = Integer.parseInt(request.getParameter("id"));

            Cart cart = new Cart();
            cart.setId(id);
            cart.setQuantity(1);

            HttpSession session = request.getSession();
            ArrayList<Cart> cartListSession = (ArrayList<Cart>) session.getAttribute("cart-list");

            if ( cartListSession == null ) // there is no session, there is no project in our cart
            {
                cartList.add(cart);
                session.setAttribute("cart-list", cartList); // added to our session

//                out.println("session created and added the list");
//                response.sendRedirect("/shop");
            }
            else
            {
                cartList = cartListSession;
                boolean exist = false;

                for ( Cart c : cartListSession )
                {
                    if ( c.getId() == id )
                    {
                        exist = true;
//                        out.println("product exist");
                        c.setQuantity(c.getQuantity()+1);
                    }
                }

                if ( !exist )
                {
                    cartList.add(cart);
//                    out.println("product added");
//                    response.sendRedirect("/shop");
                }

//                response.sendRedirect("/add-to-cart");
            }
            response.sendRedirect("/cart");
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {

    }
}