package com.example.servlet.cart;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import com.example.connection.DBConnection;
import com.example.dao.OrderDao;
import com.example.dao.UserDao;
import com.example.model.Cart;
import com.example.model.Order;
import com.example.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "OrderNowServlet", value = "/order-now")
public class OrderNowServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        try(PrintWriter out = response.getWriter())
        {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            User auth = (User) request.getSession().getAttribute("auth");

            if ( auth != null ) // user logged in - exist
            {
                String projectID = request.getParameter("id");
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                if ( quantity <= 0 )
                {
                    quantity = 1;
                }

                Order order = new Order();
                order.setOrderID(Integer.parseInt(projectID));
                order.setUserID(auth.getId());
                order.setQuantity(quantity);
                order.setDate(dateFormat.format(date));

                OrderDao orderDao = new OrderDao();
                boolean inserted;

                inserted = orderDao.insertOrder(order);

                if ( inserted )
                {
                    ArrayList<Cart> cartList = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

                    if ( cartList != null )
                    {
                        for ( Cart c : cartList )
                        {
                            if ( c.getId() == order.getOrderID())
                            {
                                cartList.remove(cartList.indexOf(c));
                                break;
                            }
                        }
                    }

                    response.sendRedirect("/orders");
                }
                else
                {
                    out.print("order failed");
                }
            }
            else
            {
                response.sendRedirect("/login");
            }
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        doGet(request,response);
    }
}