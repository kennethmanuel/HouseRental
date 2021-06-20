/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author bodyflicker
 */
public class Penyewa {

    private String username;
    private String password;
    private String nama;
    private String noTelp;

    private Connection connect;
    private Statement stat;
    private ResultSet result;

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

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getNoTelp() {
        return noTelp;
    }

    public void setNoTelp(String noTelp) {
        this.noTelp = noTelp;
    }

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/houserental", "root", "");
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return connect;
    }
    
    public Penyewa() {
        getConnection();
    }

    public Penyewa(String username, String password, String nama, String noTelp) {
        getConnection();
        this.username = username;
        this.password = password;
        this.nama = nama;
        this.noTelp = noTelp;
    }
    
    public void insert() {
        try {
            stat = (Statement) connect.createStatement();
            if (!connect.isClosed()) {
                PreparedStatement sql = (PreparedStatement) connect.prepareStatement(
                        "INSERT INTO penyewa (`username`, `password`, `nama`, `nomor telepon`) VALUES (?,?,?,?)");
                sql.setString(1, username);
                sql.setString(2, password);
                sql.setString(3, nama);
                sql.setString(4, noTelp);
                sql.executeUpdate();
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
    
    public ArrayList<String> displayToString() {
        
        ArrayList<String> temp = new ArrayList<String>();
        try {
            stat = (Statement) connect.createStatement();
            result = stat.executeQuery("SELECT * FROM penyewa");
            
            while(result.next() == true) {
                Penyewa penyewa = new Penyewa(
                        result.getString("username"), 
                        result.getString("password"), 
                        result.getString("nama"), 
                        result.getString("nomor telepon"));
                temp.add(penyewa.username + "-" + penyewa.password + "-" + penyewa.nama + "-" + penyewa.noTelp);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return temp;
    }
}
