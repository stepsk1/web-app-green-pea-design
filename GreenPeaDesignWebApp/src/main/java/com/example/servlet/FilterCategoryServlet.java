package com.example.servlet;

import java.io.*;
import java.util.*;

import com.example.dao.ProjectDao;
import com.example.model.Project;
import com.example.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "FilterCategoryServlet", value = "/filter-category")
public class FilterCategoryServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        List<Project> projects = null;

        ProjectDao projectDao = new ProjectDao();
        String category = request.getParameter("category");

        if ( category.equalsIgnoreCase("all") == true )
        {
            projects = projectDao.getAllProjects();
        }
        else
        {
            projects = projectDao.getAllProjectsByCategory(category);
        }
        request.setAttribute("activeProjects", projects);
        getServletContext().getRequestDispatcher("/shop").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {

    }
}