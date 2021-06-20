/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ubaya.houserental;

import com.ubaya.model.Penyewa;
import com.ubaya.model.Rumah;
import com.ubaya.model.Sewa;
import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Mario
 */
@WebService(serviceName = "HouseRentalServices")
public class HouseRentalServices {

    Penyewa model;
    ArrayList<String> listOfPenyewa = new ArrayList<String>();
    
    
    public HouseRentalServices() {
        model = new Penyewa();
        listOfPenyewa = model.displayToString();
    }
    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
    @WebMethod(operationName = "getTanggalSewaPerBulan")
    public ArrayList<String> getTanggalSewaPerBulan(@WebParam(name = "tanggal") String tanggal, @WebParam(name = "idrumah") int idrumah) {
        //TODO write your implementation code here:
        Sewa sewa = new Sewa();
        return sewa.getAllTanggalSewa(tanggal, idrumah);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getRumah")
    public ArrayList<Rumah> getRumah() {
        //TODO write your implementation code here:
        Rumah rumah = new Rumah();
        return rumah.getRumah();
    }
    
    @WebMethod(operationName = "login")
    public Boolean login(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        boolean success = false;
        listOfPenyewa = model.displayToString();
        if (!listOfPenyewa.isEmpty()) {
            for (String penyewa : listOfPenyewa) {
                
                String[] account = penyewa.split("-");
                if (account[0].equals(username) && account[1].equals(password)) {
                    success = true;
                    break;
                }
            }
        }
        return success;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "register")
    public Boolean register(@WebParam(name = "username") String username, @WebParam(name = "password") String password, @WebParam(name = "nama") String nama, @WebParam(name = "noTelp") String noTelp) {
        boolean success = true;
        if (!listOfPenyewa.isEmpty()) {
            for (String penyewa: listOfPenyewa) {
                String[] account = penyewa.split("-");
                if (account[0].equals(username)) {
                    success = false;
                    break;
                }
            }
        }
        
        if (success == true) {
            listOfPenyewa.add(username + "-" + password  + "-" + nama  + "-" + noTelp);
            model = new Penyewa(0,username, password, nama, noTelp);
            model.insert();
        }
        return success;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "insertSewa")
    public void insertSewa(@WebParam(name = "idPenyewa") int idPenyewa, @WebParam(name = "idRumah") int idRumah, @WebParam(name = "tanggalSewa") String tanggalSewa, @WebParam(name = "harga") int harga) {
        //TODO write your implementation code here:
        Sewa sewa = new Sewa(idPenyewa, idRumah, tanggalSewa, harga);
        
       sewa.insert();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getPenyewa")
    public Penyewa getPenyewa(@WebParam(name = "username") String username) {
        Penyewa p = new Penyewa();
        p.getPenyewa(username);
        return p;
    }

    
    
}
