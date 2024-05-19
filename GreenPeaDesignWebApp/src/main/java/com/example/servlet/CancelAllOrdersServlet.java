package com.example.servlet;

import java.io.*;
import com.example.dao.OrderDao;
import com.example.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "CancelAllOrdersServlet", value = "/cancel-all-orders")
public class CancelAllOrdersServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        OrderDao orderDao = new OrderDao();
        orderDao.cancelAllOrders();

        User auth = (User) request.getSession().getAttribute("auth");
        if ( auth != null )
        {
            if ( auth.getRole().equalsIgnoreCase("customer"))
            {
                response.sendRedirect("/orders");
                orderDao.cancelAllOrdersFromUser(auth.getId());
            }
            else if ( auth.getRole().equalsIgnoreCase("admin"))
            {
                response.sendRedirect("/admin-orders");
                orderDao.cancelAllOrders();
            }
        }
        else
        {
            response.sendRedirect("/orders");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
//        doGet(request,response);
    }
}