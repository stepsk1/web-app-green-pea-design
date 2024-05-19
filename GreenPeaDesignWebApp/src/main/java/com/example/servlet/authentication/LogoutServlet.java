package com.example.servlet.authentication;

import java.io.*;

import com.example.connection.DBConnection;
import com.example.dao.UserDao;
import com.example.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "LogoutServlet", value = "/user-logout")
public class LogoutServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        if (request.getSession().getAttribute("auth") != null)
        {
            request.getSession().removeAttribute("auth");
            response.sendRedirect("/signin");

            HttpSession session = request.getSession(false);
            if ( session != null )
            {
                session.invalidate();
            }
        } else
        {
            response.sendRedirect("/home");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {

    }
}