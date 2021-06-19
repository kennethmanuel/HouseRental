/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ubaya.model;

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
    private int idsewa;
    private int idpenyewa;
    private int idrumah;
    private Date tanggalSewa;
    private int harga;
    Connection connect;
    Statement state;
    ResultSet result;
    
    public Sewa(){
        getConnection();
    }
    
    public Sewa(int pIdSewa,int pIdPenyewa,int pIdRumah,Date pTanggalSewa, int pHarga){
        setIdsewa(pIdSewa);
        setIdpenyewa(pIdPenyewa);
        setIdrumah(pIdRumah);
        setTanggalSewa(pTanggalSewa);
        setHarga(pHarga);
    }

    public int getIdsewa() {
        return idsewa;
    }

    public void setIdsewa(int idsewa) {
        this.idsewa = idsewa;
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

    public Date getTanggalSewa() {
        return tanggalSewa;
    }

    public void setTanggalSewa(Date tanggalSewa) {
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
        
    }
    
    public ArrayList<String> getAllTanggalSewa (String tahunBulan, int pIdRumah){
            ArrayList<String> sewa = new ArrayList<>();
        try {
            
            state = (Statement) connect.createStatement();
            
            result = state.executeQuery("SELECT tanggal_sewa FROM sewa WHERE tanggal_sewa LIKE '"+ tahunBulan +"%' AND rumah_id = " + pIdRumah);
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
