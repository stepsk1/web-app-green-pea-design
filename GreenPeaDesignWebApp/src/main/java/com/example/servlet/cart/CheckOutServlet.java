package com.example.servlet.cart;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import com.example.dao.OrderDao;
import com.example.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "CheckOutServlet", value = "/check-out")
public class CheckOutServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();

        ArrayList<Cart> cartList = (ArrayList<Cart>) request.getSession().getAttribute("cart-list"); // get all cart projects
        User auth = (User) request.getSession().getAttribute("auth"); // user authentication

        if ( cartList != null && auth != null )
        {
            for ( Cart cart : cartList )
            {
                Order order = new Order();

                order.setOrderID(cart.getId());
                order.setUserID(auth.getId());
                order.setQuantity(cart.getQuantity());
                order.setDate(dateFormat.format(date));

                OrderDao orderDao = new OrderDao();
                boolean inserted;

                inserted = orderDao.insertOrder(order);

                if ( inserted == false )
                {
                    break;
                }
            }
            cartList.clear();
            response.sendRedirect("/orders");
        }
        else
        {
            if ( auth == null )
            {
                response.sendRedirect("/login");
            }
            response.sendRedirect("/cart");
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        doGet(request,response);
    }
}