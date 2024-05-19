package com.example.chat;

import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;

import java.io.IOException;
import java.util.*;

@ServerEndpoint(
        value = "/chatterboxEndpoint",
        encoders = {MessageEncoderService.class},
        decoders = {MessageDecoderService.class}
)
public class ChatterboxEndpoint
{
    private static Set<Session> clients = Collections.synchronizedSet(
            new HashSet<>()
    );

    private void broadcastMessage(MessageInstance msg)
    {
        Iterator<Session> iterator = clients.iterator();

        while (iterator.hasNext())
        {
            try
            {
                iterator.next().getBasicRemote().sendObject(msg);
            }
            catch (IOException | EncodeException e)
            {
                e.printStackTrace();
            }
        }
    }

    @OnOpen
    public void onOpen(Session client)
    {
        MessageInstance msg = new MessageInstance();

        msg.setUsername("Green Pea Design");
        msg.setMessage("Welcome to our chat where creativity meets conversation!");

        try
        {
            client.getBasicRemote().sendObject(msg);
        }
        catch (IOException | EncodeException e)
        {
            e.printStackTrace();
        }

        clients.add(client);

        msg.setMessage("Welcome! Current number of members is " + clients.size());

        broadcastMessage(msg);
    }

    @OnClose
    public void onClose(Session client)
    {
        clients.remove(client);

        if (clients.isEmpty()) return;

        MessageInstance msg = new MessageInstance();

        msg.setUsername("Green Pea Design");
        msg.setMessage("User left. Current number of members is " + clients.size());

        broadcastMessage(msg);
    }

    @OnMessage
    public void onMessage(MessageInstance userMsg)
    {
        broadcastMessage(userMsg);
    }

    @OnError
    public void onError(Throwable t)
    {
        t.printStackTrace();
    }
}