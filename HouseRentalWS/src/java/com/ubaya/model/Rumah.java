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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mario
 */
public class Rumah {
    private int id;
    private String nama;
    private int harga;
    private String foto;
    private String kamar;
    private String fasilitas;
    Connection connect;
    Statement state;
    ResultSet result;

    public Rumah(int id, String nama, int harga, String foto, String kamar, String fasilitas) {
        setId(id);
        setNama(nama);
        setHarga(harga);
        setFoto(foto);
        setKamar(kamar);
        this.setFasilitas(fasilitas);
    }

    public Rumah() {
        getConnection();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public int getHarga() {
        return harga;
    }

    public void setHarga(int harga) {
        this.harga = harga;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getKamar() {
        return kamar;
    }

    public void setKamar(String kamar) {
        this.kamar = kamar;
    }

    public String getFasilitas() {
        return fasilitas;
    }

    public void setFasilitas(String fasilitas) {
        this.fasilitas = fasilitas;
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
    
    public ArrayList<Rumah> getRumah(){
            ArrayList<Rumah> listRumah = new ArrayList<>();
        try {
            
            state = (Statement) connect.createStatement();
            
            result = state.executeQuery("Select * from rumah");
            while(result.next())
            {
                Rumah r = new Rumah(
                        result.getInt("id"), 
                        result.getString("nama"),
                        result.getInt("harga"),
                        result.getString("foto"),
                        result.getString("kamar"),
                        result.getString("fasilitas"));
                listRumah.add(r);

            }
        } catch (SQLException ex) {
            Logger.getLogger(Rumah.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listRumah;
    }
    
    public Rumah getRumahId(int idRumah){
            
        try {
            
            state = (Statement) connect.createStatement();
            
            String query = "Select * from rumah where id = ?";
//            result = state.executeQuery();
            PreparedStatement sql = (PreparedStatement) connect.prepareStatement(query);
            sql.setInt(1, idRumah);
            sql.execute();
            result = sql.getResultSet();
            while(result.next())
            {
                        setId(result.getInt("id"));
                        setNama(result.getString("nama"));
                        setHarga(result.getInt("harga"));
                        setFoto(result.getString("foto"));
                        setKamar(result.getString("kamar"));
                        setFasilitas(result.getString("fasilitas"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(Rumah.class.getName()).log(Level.SEVERE, null, ex);
        }
        return this;
    }
}
