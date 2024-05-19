package com.example.rmi;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;

public class ChatServerRMI implements ServletContextListener
{
    @Override
    public void contextInitialized(ServletContextEvent sce)
    {
        try
        {
            RemoteChatService remoteChatService = new RemoteChatService();

            LocateRegistry.createRegistry(9888);

            Naming.rebind("//localhost:9888/RemoteChatService", remoteChatService);
        }
        catch (RemoteException | MalformedURLException e)
        {
            e.printStackTrace();
        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce)
    {
    }
}