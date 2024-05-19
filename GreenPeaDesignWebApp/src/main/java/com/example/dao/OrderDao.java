package com.example.dao;

import com.example.connection.DBConnection;
import com.example.model.*;
import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderDao
{
    private Connection con;
    private String query;
    private PreparedStatement preparedStatement;
    private ResultSet rs;

    public OrderDao()
    {
    }

    public boolean insertOrder(Order order)
    {
        con = DBConnection.getConnection();
        boolean inserted = false;

        query = "insert into orders (product_id, user_id, quantity, date) values ( ?, ?, ?, ? ); ";

        try
        {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setInt(1, order.getOrderID()); // product id
            preparedStatement.setInt(2, order.getUserID());
            preparedStatement.setInt(3, order.getQuantity());
            preparedStatement.setString(4, order.getDate());

            preparedStatement.executeUpdate();

            inserted = true;
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }

        return inserted;
    }

    public List<Order> getAllOrders ()
    {
        con = DBConnection.getConnection();
        List<Order> userOrders = new ArrayList<Order>();

        query = "select * from orders order by date desc;";

        try
        {
            preparedStatement = con.prepareStatement(query);
            rs = preparedStatement.executeQuery();

            while(rs.next())
            {
                Order order = new Order();

                ProjectDao projectDao = new ProjectDao();

                int projectID = rs.getInt("product_id");

                Project project = projectDao.getProjectByID(projectID);

                order.setOrderID(rs.getInt("id"));
                order.setUserID(rs.getInt("user_id"));
                order.setId(projectID);
                order.setTitle(project.getTitle());
                order.setCategory(project.getCategory());
                order.setPrice(project.getPrice()*rs.getInt("quantity"));
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("date"));

                System.out.println(order.toString());
                System.out.println(project.toString());
                System.out.println();

                userOrders.add(order);
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }

        return userOrders;
    }

    public List<Order> getUserOrders ( int userID )
    {
        con = DBConnection.getConnection();
        List<Order> userOrders = new ArrayList<Order>();

        query = "select * from orders where user_id = ? order by date desc;";

        try
        {
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, userID);

            rs = preparedStatement.executeQuery();

            while(rs.next())
            {
                Order order = new Order();

                ProjectDao projectDao = new ProjectDao();

                int projectID = rs.getInt("product_id");

                Project project = projectDao.getProjectByID(projectID);

                order.setOrderID(rs.getInt("id"));
                order.setUserID(rs.getInt("user_id"));
                order.setId(projectID);
                order.setTitle(project.getTitle());
                order.setCategory(project.getCategory());
                order.setPrice(project.getPrice()*rs.getInt("quantity"));
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("date"));

                System.out.println(order.toString());
                System.out.println(project.toString());
                System.out.println();

                userOrders.add(order);
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }

        return userOrders;
    }

    public void cancelOrderByID ( int orderID )
    {
        con = DBConnection.getConnection();

        query = "delete from orders where id = ?;";

        try
        {
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, orderID);

            preparedStatement.execute();
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }
    public void cancelAllOrders ()
    {
        con = DBConnection.getConnection();

        query = "delete from orders;";

        try
        {
            preparedStatement = con.prepareStatement(query);
            preparedStatement.execute();
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    public void cancelAllOrdersFromUser ( int userID )
    {
        con = DBConnection.getConnection();

        query = "delete from orders where user_id = ?;";

        try
        {
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, userID);
            preparedStatement.execute();
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }
}
