/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ubaya.houserental;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

/**
 *
 * @author bodyflicker
 */
public class MainServer extends javax.swing.JFrame implements Runnable{
    
    ServerSocket ss;
    Socket client;
    DataOutputStream out;
    BufferedReader inp;
    Thread t;
    
    String sender = "";
    
    /**
     * Creates new form MainServer
     */
    public MainServer() {
        initComponents();
        try {
            ss = new ServerSocket(6000);
            client = ss.accept();
            this.out = new DataOutputStream(client.getOutputStream());
            this.inp = new BufferedReader(new InputStreamReader(client.getInputStream()));
            
            if (t == null) {
                this.t = new Thread(this, "client");
                t.start();
            }
        } catch (Exception ex) {
            System.out.println("Error MainServer()" + ex);
        }
        
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTextField1 = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jTextField1.setText("SERVER IS RUNNING! ");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(164, 164, 164)
                .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(171, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(164, 164, 164)
                .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(167, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MainServer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MainServer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MainServer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MainServer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainServer().setVisible(true);
            }
        });
    }

    @Override
    public void run() {
        try {
            while(true) {
                String msg = inp.readLine();
                this.getChat(msg , out, inp, client);
            }
        } catch (Exception ex) {
            System.out.println("Error run MainServer" + ex);
        }
    }
    
    public void getChat(String tmp, DataOutputStream outs, BufferedReader inps, Socket c) {
        try {
            String clientMessage = "";
            
            String[] msg = tmp.split("-");
            if(msg[0].equalsIgnoreCase("chat")){
                System.out.println(tmp);
                sender = msg[1];
                
                Penyewa penyewa = new Penyewa();
                String namaPembeli = "";
                
                namaPembeli = penyewa.SelectPenyewa(sender).getFullname();
                System.out.println(namaPembeli);
                
//                for(Penyewa p : penyewa.DaftarPenyewa(sender)) {
//                    namaPembeli = p.getFullname();
//                    System.out.println(namaPembeli);
//                }
                
                ChatFormServer chatForm = new ChatFormServer(client, namaPembeli, out, inp);
//                ChatFormServer chatForm = new ChatFormServer();
                chatForm.setVisible(true);
            }
        } catch (Exception ex) {
            System.out.println("Error getChat() " + ex);
        }
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTextField jTextField1;
    // End of variables declaration//GEN-END:variables
}
