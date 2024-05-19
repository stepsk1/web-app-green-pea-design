package com.example.chat;

import java.io.Serializable;

public class MessageInstance implements Serializable
{
    private String username;
    private String message;

    public MessageInstance()
    {
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getMessage()
    {
        return message;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }
}