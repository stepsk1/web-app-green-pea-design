package com.example.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection
{
    private static Connection con = null;
    public static Connection getConnection()
    {
        if ( con == null )
        {
            try
            {
                Class.forName(IConnection.DRIVER);
                con = DriverManager.getConnection(IConnection.CONNECTION_STRING);
            }
            catch (ClassNotFoundException | SQLException e)
            {
                throw new RuntimeException(e);
            }
        }
        return con;
    }
}
