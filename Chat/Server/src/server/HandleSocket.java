/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package server;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mario
 */
public class HandleSocket extends Thread{
    String username;
    ServerUI parent;
    Socket client;
    DataOutputStream out;
    ObjectOutputStream objOut;
    BufferedReader inp;
    
    public HandleSocket(ServerUI _parent, Socket _client)
    {
        this.parent = _parent;
        this.client = _client;
        try {
            out = new DataOutputStream(client.getOutputStream());
            inp = new BufferedReader(new InputStreamReader(client.getInputStream()));
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public HandleSocket(ServerUI _parent, Socket _client, String _username)
    {
        this.parent = _parent;
        this.client = _client;
        this.username = _username;
        try {
            out = new DataOutputStream(client.getOutputStream());
            inp = new BufferedReader(new InputStreamReader(client.getInputStream()));
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void sendChat(String tmp)
    {
        try {
            out.writeBytes(tmp + "\n");
        } catch (IOException ex) {
            Logger.getLogger(HandleSocket.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void sendObject(Object[] listHs)
    {
        try {
            objOut.writeObject(listHs);
        } catch (IOException ex) {
            Logger.getLogger(HandleSocket.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public void run()
    {
        System.out.println("run Handle socket");
        try {
            while(true)
            {
                System.out.println("menunggu inputan");
                String tmp = inp.readLine();
                if(tmp.contains("LOGIN"))
                {
                    System.out.println("login");
                    parent.Login(this, tmp);
                }
                else
                {
                    if (tmp.contains("[BOOK]")) {
                        parent.Book(this, tmp);
                    }
                    else if(tmp.equals("getRumah")){
                        parent.getDataRumah(this, tmp);
                    }
                    else if(tmp.equals("getHS"))
                    {
                        parent.getDataHS(this,tmp);
                    }
                    else if(tmp.contains("[CONNECT]"))
                    {
                        parent.getDataHS(tmp);
                    }
                    else if(tmp.contains("[HISTORY]"))
                    {
                        parent.historyChat(this, tmp);
                    }
                    else {
                        parent.sendChat(tmp);
                    }
                }
                
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
}
