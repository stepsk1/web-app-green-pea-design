package com.example.servlet;

import java.io.*;
import com.example.dao.OrderDao;
import com.example.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "CancelOrderServlet", value = "/cancel-order")
public class CancelOrderServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        String id = request.getParameter("id");
        if ( id != null )
        {
            OrderDao orderDao = new OrderDao();
            orderDao.cancelOrderByID(Integer.parseInt(id));
        }

        User auth = (User) request.getSession().getAttribute("auth");
        if ( auth != null )
        {
            if ( auth.getRole().equalsIgnoreCase("customer"))
            {
                response.sendRedirect("/orders");
            }
            else if ( auth.getRole().equalsIgnoreCase("admin"))
            {
                response.sendRedirect("/admin-orders");
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