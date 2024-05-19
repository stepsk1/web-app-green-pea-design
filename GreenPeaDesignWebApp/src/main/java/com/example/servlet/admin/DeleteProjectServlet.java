package com.example.servlet.admin;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import com.example.dao.OrderDao;
import com.example.dao.ProjectDao;
import com.example.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "DeleteProjectServlet", value = "/project-delete")
public class DeleteProjectServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        User auth = (User) request.getSession().getAttribute("auth");

        if (auth != null && auth.getRole().equalsIgnoreCase("admin") == true )
        {

            ProjectDao projectDao = new ProjectDao();

            int id = Integer.parseInt(request.getParameter("id"));

            boolean deleted = projectDao.deleteProjectByID(id);

            if ( deleted == true )
            {
                request.setAttribute("successUpdate", "Project has been successfully removed!");
            }
            else
            {
                request.setAttribute("errorUpdate", "Something happened. Try again!");
            }
            getServletContext().getRequestDispatcher("/shop").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        doGet(request,response);
    }
}