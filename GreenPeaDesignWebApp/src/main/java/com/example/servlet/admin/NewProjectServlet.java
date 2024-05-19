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

@WebServlet(name = "NewProjectServlet", value = "/project-new")
@MultipartConfig(
        fileSizeThreshold = 50,                 // 50kb      file < 2m ? memory : disk
        maxFileSize = 1024 * 1024 * 10,         // 10MB
        maxRequestSize = 1024 * 1024 * 50)      // 50MB
public class NewProjectServlet extends HttpServlet
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

            String title = request.getParameter("title");
            String category = request.getParameter("category");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            Part image = request.getPart("image");

            if (validate(price, PATTERN_PRICE) == false)
            {
                request.setAttribute("errorUpdate", "Invalid price. Please enter a valid price.");
                getServletContext().getRequestDispatcher("/add-product").forward(request, response);
            }

            double priceVal = Double.parseDouble(price);

            String appPath = request.getServletContext().getRealPath(""); // real location
            String savePath = appPath + File.separator + "pages" + File.separator + "assets" + File.separator + "logo";

            File saveDir = new File(savePath); // if folder doesn't exist - create
            if (saveDir.exists() == false)
            {
                saveDir.mkdirs();
            }

            String fileName = System.currentTimeMillis() + "_" + image.getSubmittedFileName(); // unique name
            String imagePath = savePath + File.separator + fileName;
            System.out.println(imagePath);
            image.write(imagePath); // write img to path

            String url = "pages/assets/logo/" + fileName;

            Project p = new Project( title, category, description, priceVal, url);
            boolean inserted = projectDao.addNewProject(p);

            if ( inserted == true )
            {
                request.setAttribute("successUpdate", "Project has been successfully added!");
            }
            else
            {
                request.setAttribute("errorUpdate", "Something happened. Try again!");
            }
            getServletContext().getRequestDispatcher("/add-product").forward(request, response);
        }
        else
        {
            doGet(request,response);
        }
    }
}