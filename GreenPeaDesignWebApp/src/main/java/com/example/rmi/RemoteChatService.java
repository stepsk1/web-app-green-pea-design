package com.example.rmi;

import com.example.chat.MessageInstance;
import com.google.gson.Gson;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class RemoteChatService extends UnicastRemoteObject implements IEncodeMessage, IDecodeMessage
{
    protected RemoteChatService() throws RemoteException
    {
    }

    @Override
    public MessageInstance decodeMessage(String message) throws RemoteException
    {
        return new Gson().fromJson(message, MessageInstance.class);
        // json-formatted string - message, structure of fields to deserialize json data to - class
    }

    @Override
    public String encodeMessage(MessageInstance message) throws RemoteException
    {
        return new Gson().toJson(message);
    }
}
