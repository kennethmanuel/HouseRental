/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ubaya.houserental;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import com.ubaya.model.Penyewa;
import java.util.ArrayList;

/**
 *
 * @author bodyflicker
 */
@WebService(serviceName = "LoginWS")
public class LoginWS {

    Penyewa model;
    ArrayList<String> listOfPenyewa = new ArrayList<String>();
    
    public LoginWS() {
        model = new Penyewa();
        listOfPenyewa = model.displayToString();
    }

    /**
     * Web service operation
     */
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
            model = new Penyewa(username, password, nama, noTelp);
            model.insert();
        }
        return success;
    }
    
    
}
