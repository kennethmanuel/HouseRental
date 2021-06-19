/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ubaya.houserental;

import com.ubaya.model.Penyewa;
import com.ubaya.model.Rumah;
import com.ubaya.model.Sewa;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Mario
 */
@WebService(serviceName = "HouseRentalWebService")
public class HouseRentalWebService {

    Sewa sewa;
    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getTanggalSewaPerBulan")
    public ArrayList<String> getTanggalSewaPerBulan(@WebParam(name = "tanggal") String tanggal, @WebParam(name = "idrumah") int idrumah) {
        //TODO write your implementation code here:
        sewa = new Sewa();
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

    /**
     * Web service operation
     */
    @WebMethod(operationName = "register")
    public void register(@WebParam(name = "username") String username, @WebParam(name = "password") String password, @WebParam(name = "fullname") String fullname, @WebParam(name = "notelp") String notelp) {
        //TODO write your implementation code here:
        Penyewa p = new Penyewa(username, password, fullname, notelp);
        p.insert();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "login")
    public String login(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */

}
