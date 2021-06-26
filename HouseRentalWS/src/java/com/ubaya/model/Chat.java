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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mario
 */
public class Chat {
    private String content;
    private int idpenyewa;
    Connection connect;
    Statement state;
    ResultSet result;

    public Chat(String content, int idpenyewa) {
        this.content = content;
        this.idpenyewa = idpenyewa;
    }

    public Chat() {
        getConnection();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getIdpenyewa() {
        return idpenyewa;
    }

    public void setIdpenyewa(int idpenyewa) {
        this.idpenyewa = idpenyewa;
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
    
    public void insert(){
        getConnection();
        try {
            state = (Statement) connect.createStatement();
            if (!connect.isClosed()) {

                String query = "Insert into `chat history`(content, penyewa_id) VALUES (?, ?)";

                PreparedStatement sql = (PreparedStatement) connect.prepareStatement(query);

                sql.setString(1, getContent());
                sql.setInt(2, getIdpenyewa());
                sql.executeUpdate();
            }
            connect.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
    
    public String display(int idPenyewa){
        String chat = "";
        try {
            
            state = (Statement) connect.createStatement();
            
            String query = "Select content from chat history where penyewa_id = ?";
//            result = state.executeQuery();
            PreparedStatement sql = (PreparedStatement) connect.prepareStatement(query);
            sql.setInt(1, idPenyewa);
            sql.execute();
            result = sql.getResultSet();
            while(result.next())
            {
                chat += result.getString("content") +"||";
            }
        } catch (SQLException ex) {
            Logger.getLogger(Rumah.class.getName()).log(Level.SEVERE, null, ex);
        }
        return chat;
    }
}
