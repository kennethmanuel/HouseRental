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
import java.util.ArrayList;
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

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connect = DriverManager.getConnection("jdbc:mysql://localhost/houserental", "root", "");
        } catch (Exception e) {
            System.out.println(e);
        }
        return connect;
    }

    public void insert() {
        getConnection();
        try {
            state = (Statement) connect.createStatement();
            if (!connect.isClosed()) {

                String query = "Insert into penyewa (`username`, `password` ,`nama` , `nomor telepon`) VALUES (?, ?, ?, ?)";

                PreparedStatement sql = (PreparedStatement) connect.prepareStatement(query);

                sql.setString(1, getUsername());
                sql.setString(2, getPassword());
                sql.setString(3, getFullname());
                sql.setString(4, getNotelp());
                sql.executeUpdate();
            }
            connect.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
    
    public ArrayList<String> displayToString() {
        
        ArrayList<String> temp = new ArrayList<String>();
        try {
            state = (Statement) connect.createStatement();
            result = state.executeQuery("SELECT * FROM penyewa");
            while(result.next() == true) {
                Penyewa penyewa = new Penyewa(
                        result.getString("username"), 
                        result.getString("password"), 
                        result.getString("nama"), 
                        result.getString("nomor telepon"));
                temp.add(penyewa.username + "-" + penyewa.password + "-" + penyewa.fullname + "-" + penyewa.notelp);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return temp;
    }
    
    public ArrayList<Penyewa> DaftarPenyewa(String username) {
        getConnection();
        ArrayList<Penyewa> listPenyewa = new ArrayList<Penyewa>();
        try {
            String query = "SELECT * FROM penyewa WHERE username = ?";
            PreparedStatement sql = (PreparedStatement) connect.prepareStatement(query);
            sql.setString(1, username);
            result = sql.executeQuery();
            while(result.next()) {
                Penyewa p = new Penyewa(
                        result.getString("username"), 
                        result.getString("password"),
                        result.getString("nama"),
                        result.getString("nomor telepon"));
                listPenyewa.add(p);
            }
            connect.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return listPenyewa;
    }
}
