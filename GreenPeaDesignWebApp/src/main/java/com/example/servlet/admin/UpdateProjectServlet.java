package com.example.servlet.admin;

import java.io.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.example.dao.ProjectDao;
import com.example.model.Project;
import com.example.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "UpdateProjectServlet", value = "/project-update")
public class UpdateProjectServlet extends HttpServlet
{
    private boolean validate(String val, String regex)
    {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(val);
        return matcher.matches();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        getServletContext().getRequestDispatcher("/signup").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        final String PATTERN_PRICE = "\\d+(\\.\\d{1,2})?";

        User auth = (User) request.getSession().getAttribute("auth");

        if (auth != null)
        {

            ProjectDao projectDao = new ProjectDao();

            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String category = request.getParameter("category");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            String url = request.getParameter("url");

            if (validate(price, PATTERN_PRICE) == false)
            {
                request.setAttribute("errorUpdate", "Invalid price. Please enter a valid price.");
                getServletContext().getRequestDispatcher("/edit?id=" + id).forward(request, response);
            }

            double priceVal = Double.parseDouble(price);

            Project p = new Project(id, title, category, description, priceVal, url);
            boolean updated = projectDao.updateProjectByID(p);

            if ( updated == true )
            {
                request.setAttribute("successUpdate", "Project has been successfully updated!");
            }
            else
            {
                request.setAttribute("errorUpdate", "Something happened. Try again!");
            }
            getServletContext().getRequestDispatcher("/edit?id=" + id).forward(request, response);
        }
        else
        {
            doGet(request,response);
        }
    }
}