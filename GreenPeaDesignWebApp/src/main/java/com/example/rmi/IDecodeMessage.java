package com.example.rmi;

import com.example.chat.MessageInstance;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface IDecodeMessage extends Remote
{
    public MessageInstance decodeMessage ( String message ) throws RemoteException;
}
