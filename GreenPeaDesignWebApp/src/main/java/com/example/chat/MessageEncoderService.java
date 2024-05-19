package com.example.chat;

import com.example.rmi.IEncodeMessage;
import jakarta.websocket.EncodeException;
import jakarta.websocket.Encoder;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

public class MessageEncoderService implements Encoder.Text<MessageInstance>
{
    @Override
    public String encode(MessageInstance messageInstance) throws EncodeException
    {
        try
        {
            IEncodeMessage encoder = (IEncodeMessage) Naming.lookup("rmi://localhost:9888/RemoteChatService");

            return encoder.encodeMessage(messageInstance);
        }
        catch (NotBoundException | MalformedURLException | RemoteException e)
        {
            e.printStackTrace();

            return null;
        }
    }
}