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

@WebServlet(name = "RemoveFromCart", value = "/remove-from-cart")
public class RemoveFromCart extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        if (action != null )
        {
            ArrayList<Cart> cartList = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

            if (cartList != null)
            {
                if ( action.equalsIgnoreCase("single") && id > 0)
                {
                    for (Cart c : cartList)
                    {
                        if (c.getId() == id)
                        {
                            cartList.remove(cartList.indexOf(c));
                            break;
                        }
                    }
                }
                else if ( action.equalsIgnoreCase("all"))
                {
                    cartList.clear();
                }
            }

            response.sendRedirect("/cart");
        } else
        {
            response.sendRedirect("/cart");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {

    }
}