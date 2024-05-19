package com.example.rmi;

import com.example.chat.MessageInstance;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface IEncodeMessage extends Remote
{
    public String encodeMessage (MessageInstance message ) throws RemoteException;
}
