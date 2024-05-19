package com.example.dao;

import com.example.connection.DBConnection;
import com.example.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao
{
    private Connection con;
    private String query;
    private PreparedStatement preparedStatement;
    private ResultSet rs;

    public UserDao()
    {
    }

    public User loginUser(String email, String password)
    {
        con = DBConnection.getConnection();

        User user = null;
        query = "select * from user where email=? and password=?;";

        try
        {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            rs = preparedStatement.executeQuery();

            if ( rs.next() )
            {
                user = new User();

                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                System.out.println(user);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return user;
    }

    public boolean registerUser( String username, String email, String password )
    {
        con = DBConnection.getConnection();
        int result = 0;

        User user = null;
        query = "insert into user ( username, email, password, role ) values ( ?, ?, ?, ?);";

        try
        {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);
            preparedStatement.setString(4, "customer");

            result = preparedStatement.executeUpdate();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        if ( result == 1 )
            return true;
        else
            return false;
    }

    public User getUserByID(int id)
    {
        con = DBConnection.getConnection();

        User user = null;
        query = "select * from user where id=?;";

        try
        {
            preparedStatement = con.prepareStatement(query);

            preparedStatement.setInt(1, id);

            rs = preparedStatement.executeQuery();

            if ( rs.next() )
            {
                user = new User();

                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                System.out.println(user);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return user;
    }
}