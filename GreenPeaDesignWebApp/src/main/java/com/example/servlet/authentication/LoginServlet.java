package com.example.servlet.authentication;

import java.io.*;

import com.example.connection.DBConnection;
import com.example.dao.UserDao;
import com.example.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "LoginServlet", value = "/user-login")
public class LoginServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        getServletContext().getRequestDispatcher("/login").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();

        User user = userDao.loginUser(email, password);

        if (user != null)
        {
            request.getSession().setAttribute("auth", user);
            response.sendRedirect("/home");
        }
        else
        {
            request.setAttribute("error", "Account was not found.");
            doGet(request, response);
        }
    }
}