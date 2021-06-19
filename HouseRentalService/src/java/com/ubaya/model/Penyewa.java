/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ubaya.model;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.swing.JOptionPane;

/**
 *
 * @author Mario
 */
public class Penyewa {
    private String username;
    private String password;
    private String fullname;
    private String notelp;
    Connection connect;
    Statement state;
    ResultSet result;

    public Penyewa() {
        getConnection();
    }

    public Penyewa(String username, String password, String fullname, String notelp) {
        this.setUsername(username);
        this.setPassword(password);
        this.setFullname(fullname);
        setNotelp(notelp);
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getNotelp() {
        return notelp;
    }

    public void setNotelp(String notelp) {
        this.notelp = notelp;
    }
    
    public Connection getConnection(){
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            
            connect = DriverManager.getConnection("jdbc:mysql://localhost/houserental","root","");
            
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
        return connect;
    }
    
    public void insert (){
        getConnection();
        try
        {
            state = (Statement)connect.createStatement();
            if (!connect.isClosed()) {
                
                String query = "Insert into penyewa (username,password,nama,nomor telepon) VALUES (?, ?, ?, ?)";
                
                PreparedStatement sql = (PreparedStatement)connect.prepareStatement(query);
                
                sql.setString(1, getUsername());
                sql.setString(2, getPassword());
                sql.setString(3, getFullname());
                sql.setString(4, getNotelp());
                sql.executeUpdate();
            }
            connect.close();
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
    }
    
    public String Login(String uname, String pwd){
        try
        {
            Statement state;
            ResultSet result;
            
            state = (Statement)getConnection().createStatement();
            
            if (!getConnection().isClosed()) {
                
                String query = "SELECT * FROM penyewa where username = ? AND password = ?";
                
                PreparedStatement sql = (PreparedStatement)connect.prepareStatement(query);
                
                sql.setString(1, uname);
                sql.setString(2, pwd);

                sql.execute();
                
                result = sql.getResultSet();
                result.next();
                
                int jumlahData = result.getRow();
                
                if(jumlahData == 1)
                {
                    return "SUKSES";
                }
                else
                {
                    return "GAGAL";
                }
            }
            getConnection().close();
        }
        catch(Exception ex)
        {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Warning", JOptionPane.WARNING_MESSAGE);
        }
        return"";
    }
}
