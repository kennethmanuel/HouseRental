/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anonymous.houserental;

import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import model.Penyewa;

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
     * @return True if login success false otherwise.
     */
    @WebMethod(operationName = "checkLogin")
    public Boolean checkLogin(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        
        boolean success = false;
        listOfPenyewa = model.displayToString();
        if (!listOfPenyewa.isEmpty()) {
            for (String penyewa : listOfPenyewa) {
                String [] account = penyewa.split("-");
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
            listOfPenyewa.add(username + "-" + password + "-" + nama + "-" + noTelp);
            model = new Penyewa(username, password, nama, noTelp);
            model.insert();
        }
        
        return success;
    }
}
