package com.example.model;

public class Order extends Project
{
    private int orderID;
    private int userID;
    private int quantity;
    private String date;

    // also we will store product id into the order table for a single order

    public Order()
    {
    }

    public Order(int userID, int quantity, String date)
    {
        this.userID = userID;
        this.quantity = quantity;
        this.date = date;
    }

    public Order(int orderID, int userID, int quantity, String date)
    {
        this.orderID = orderID;
        this.userID = userID;
        this.quantity = quantity;
        this.date = date;
    }

    public int getOrderID()
    {
        return orderID;
    }

    public void setOrderID(int orderID)
    {
        this.orderID = orderID;
    }

    public int getUserID()
    {
        return userID;
    }

    public void setUserID(int userID)
    {
        this.userID = userID;
    }

    public int getQuantity()
    {
        return quantity;
    }

    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
    }

    public String getDate()
    {
        return date;
    }

    public void setDate(String date)
    {
        this.date = date;
    }

    @Override
    public String toString()
    {
        return "Order{" +
                "orderID=" + orderID +
                ", userID=" + userID +
                ", quantity=" + quantity +
                ", date='" + date + '\'' +
                '}';
    }
}
