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
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mario
 */
public class Sewa {
    private int idpenyewa;
    private int idrumah;
    private String tanggalSewa;
    private int harga;
    Connection connect;
    Statement state;
    ResultSet result;
    
    public Sewa(){
        getConnection();
    }
    
    public Sewa(int pIdPenyewa,int pIdRumah,String pTanggalSewa, int pHarga){
        setIdpenyewa(pIdPenyewa);
        setIdrumah(pIdRumah);
        setTanggalSewa(pTanggalSewa);
        setHarga(pHarga);
    }

    public int getIdpenyewa() {
        return idpenyewa;
    }

    public void setIdpenyewa(int idpenyewa) {
        this.idpenyewa = idpenyewa;
    }

    public int getIdrumah() {
        return idrumah;
    }

    public void setIdrumah(int idrumah) {
        this.idrumah = idrumah;
    }

    public String getTanggalSewa() {
        return tanggalSewa;
    }

    public void setTanggalSewa(String tanggalSewa) {
        this.tanggalSewa = tanggalSewa;
    }

    public int getHarga() {
        return harga;
    }

    public void setHarga(int harga) {
        this.harga = harga;
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
    
    public void insert(){
        getConnection();
        try {
            state = (Statement) connect.createStatement();
            if (!connect.isClosed()) {

                String query = "Insert into sewa (penyewa_id, rumah_id ,tanggal_sewa, harga) VALUES (?, ?, ?, ?)";

                PreparedStatement sql = (PreparedStatement) connect.prepareStatement(query);

                sql.setInt(1, getIdpenyewa());
                sql.setInt(2, getIdrumah());
                sql.setString(3, getTanggalSewa());
                sql.setInt(4, getHarga());
                sql.executeUpdate();
                
                
            }
            connect.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
    
    public ArrayList<String> getAllTanggalSewa (String tahunBulan, int pIdRumah){
            ArrayList<String> sewa = new ArrayList<>();
        try {
            
            state = (Statement) connect.createStatement();
            
            result = state.executeQuery("SELECT tanggal_sewa FROM sewa WHERE tanggal_sewa LIKE '"+ tahunBulan +"%' AND rumah_id = " + pIdRumah + " ORDER BY tanggal_sewa ASC");
            while(result.next())
            {                
                sewa.add(result.getString("tanggal_sewa"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Sewa.class.getName()).log(Level.SEVERE, null, ex);
        }
            return sewa;
    }
}
