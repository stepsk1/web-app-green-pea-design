package com.example.dao;

import com.example.connection.DBConnection;
import com.example.model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ProjectDao
{
    private Connection con;
    private String query;
    private PreparedStatement preparedStatement;
    private ResultSet rs;

    public ProjectDao()
    {
    }

    public List<Project> getAllProjects()
    {
        con = DBConnection.getConnection();

        List<Project> projects = null;

        query = "select * from project;";

        try
        {
            preparedStatement = con.prepareStatement(query);
            rs = preparedStatement.executeQuery();

            projects = new ArrayList<Project>();

            while (rs.next())
            {
                Project project = new Project();

                project.setId(rs.getInt("id"));
                project.setTitle(rs.getString("title"));
                project.setCategory(rs.getString("category"));
                project.setDescription(rs.getString("description"));
                project.setPrice(rs.getDouble("price"));
                project.setImage(rs.getString("image"));

                projects.add(project);
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }

        return projects;
    }

    public List<Project> getAllProjectsByCategory( String category)
    {
        con = DBConnection.getConnection();

        List<Project> projects = null;

        query = "select * from project where category = ?;";

        try
        {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, category);

            rs = preparedStatement.executeQuery();

            projects = new ArrayList<Project>();

            while (rs.next())
            {
                Project project = new Project();

                project.setId(rs.getInt("id"));
                project.setTitle(rs.getString("title"));
                project.setCategory(rs.getString("category"));
                project.setDescription(rs.getString("description"));
                project.setPrice(rs.getDouble("price"));
                project.setImage(rs.getString("image"));

                projects.add(project);
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }

        return projects;
    }

    public List<String> getAllCategories()
    {
        con = DBConnection.getConnection();

        List<String> categories = null;

        query = "select distinct category from project;";

        try
        {
            preparedStatement = con.prepareStatement(query);
            rs = preparedStatement.executeQuery();

            categories = new ArrayList<String>();

            while (rs.next())
            {
                categories.add(rs.getString("category"));
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }

        return categories;
    }

    public List<Cart> getCartProducts(ArrayList<Cart> cartList)
    {
        con = DBConnection.getConnection();

        List<Cart> projects = new ArrayList<Cart>();

        query = "select * from project;";

        try
        {
            if (cartList.size() > 0) // we have a project
            {
                for (Cart cart : cartList)
                {
                    query = "select * from project where id = ?";

                    preparedStatement = con.prepareStatement(query);

                    preparedStatement.setInt(1, cart.getId());

                    rs = preparedStatement.executeQuery();

                    while (rs.next())
                    {
                        Cart project = new Cart();

                        project.setId(rs.getInt("id"));
                        project.setTitle(rs.getString("title"));
                        project.setCategory(rs.getString("category"));
                        project.setDescription(rs.getString("description"));
                        project.setPrice(rs.getDouble("price") * cart.getQuantity());
                        project.setImage(rs.getString("image"));
                        project.setQuantity(cart.getQuantity());

                        projects.add(project);
                    }
                }
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return projects;
    }

    public double getCartPrice(ArrayList<Cart> cartList)
    {
        con = DBConnection.getConnection();

        double price = 0;
        query = "select price from project where id = ?";

        if (cartList.size() > 0)
        {
            for (Cart c : cartList)
            {
                try
                {
                    preparedStatement = con.prepareStatement(query);

                    preparedStatement.setInt(1, c.getId());

                    rs = preparedStatement.executeQuery();

                    while (rs.next())
                    {
                        price += rs.getDouble("price") * c.getQuantity();
                    }
                }
                catch (SQLException e)
                {
                    throw new RuntimeException(e);
                }
            }
        }

        return price;
    }

    public Project getProjectByID(int projectID)
    {
        con = DBConnection.getConnection();

        Project project = null;

        query = "select * from project where id = ?;";

        try
        {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setInt(1, projectID);

            rs = preparedStatement.executeQuery();

            if (rs.next())
            {
                project = new Project();

                project.setId(rs.getInt("id"));
                project.setTitle(rs.getString("title"));
                project.setCategory(rs.getString("category"));
                project.setDescription(rs.getString("description"));
                project.setPrice(rs.getDouble("price"));
                project.setImage(rs.getString("image"));
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }

        return project;
    }

    public boolean deleteProjectByID ( int projectID )
    {
        con = DBConnection.getConnection();
        query = "delete from project where id = ?;";
        boolean deleted = false;

        try
        {
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, projectID);

            preparedStatement.execute();
            deleted = true;
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }

        return deleted;
    }


    public boolean updateProjectByID ( Project p )
    {
        con = DBConnection.getConnection();
        query = "update project set title = ?, category = ?, description = ?, price = ?, image = ? where id = ?;";
        boolean updated = false;

        try
        {
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, p.getTitle());
            preparedStatement.setString(2, p.getCategory());
            preparedStatement.setString(3, p.getDescription());
            preparedStatement.setDouble(4, p.getPrice());
            preparedStatement.setString(5, p.getImage());
            preparedStatement.setInt(6, p.getId());

            preparedStatement.execute();
            updated = true;
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }

        return updated;
    }


    public boolean addNewProject ( Project p )
    {
        con = DBConnection.getConnection();
        query = "insert into project (title, category, description, price, image) values ( ?, ?, ?, ?, ?);";
        boolean inserted = false;

        try
        {
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, p.getTitle());
            preparedStatement.setString(2, p.getCategory());
            preparedStatement.setString(3, p.getDescription());
            preparedStatement.setDouble(4, p.getPrice());
            preparedStatement.setString(5, p.getImage());

            preparedStatement.executeUpdate();
            inserted = true;
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }

        return inserted;
    }
}














