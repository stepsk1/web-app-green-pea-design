package com.example.chat;

import com.example.rmi.IDecodeMessage;
import jakarta.websocket.DecodeException;
import jakarta.websocket.Decoder;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

public class MessageDecoderService implements Decoder.Text<MessageInstance>
{
    @Override
    public MessageInstance decode(String s) throws DecodeException
    {
        try
        {
            IDecodeMessage decoder = (IDecodeMessage) Naming.lookup("rmi://localhost:9888/RemoteChatService");

            MessageInstance messageInstance = decoder.decodeMessage(s);

            return messageInstance;
        }
        catch (NotBoundException | MalformedURLException | RemoteException e)
        {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean willDecode(String s)
    {
        return true;
    }
}
