package com.example.servlet.authentication;

import java.io.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.example.dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "RegisterServlet", value = "/user-register")
public class RegisterServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        getServletContext().getRequestDispatcher("/signup").forward(request, response);
    }

    private boolean validate(String val, String regex)
    {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(val);
        return matcher.matches();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        final String PATTERN_USERNAME = "^[a-zA-Z]{3,15}$";
        final String PATTERN_EMAIL = "^[A-Za-z0-9+_.-]+@([A-Za-z0-9.-]+)$";
        final String PATTERN_PASSWORD = "^[a-zA-Z0-9]{3,15}$";

        String username = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");

        if (username.isEmpty() || email.isEmpty() || password.isEmpty() || confirmPassword.isEmpty())
        {
            request.setAttribute("error", "Please fill in all of the inputs.");
            doGet(request, response);
        } else
        {
            if (validate(username, PATTERN_USERNAME) == false)
            {
                request.setAttribute("error", "Invalid name. Please enter a name between 3 and 15 letters.");
                doGet(request, response);
            } else if (validate(email, PATTERN_EMAIL) == false)
            {
                request.setAttribute("error", "Invalid email format. Please provide a valid email address.");
                doGet(request, response);
            } else if (validate(password, PATTERN_PASSWORD) == false)
            {
                request.setAttribute("error", "Invalid password. Password must be between 3 and 15 characters and contain only letters and numbers.");
                doGet(request, response);
            } else if (!password.equalsIgnoreCase(confirmPassword))
            {
                request.setAttribute("error", "Passwords do not match. Please make sure the passwords match.");
                doGet(request, response);
            } else
            {
                UserDao userDao = new UserDao();

                boolean registered = userDao.registerUser(username, email, password);

                if (registered == true)
                {
                    request.setAttribute("success", "Account has been successfully created!");
                    getServletContext().getRequestDispatcher("/login").forward(request, response);
                }
            }
        }
    }
}