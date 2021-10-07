/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.slides.aula08;
import java.sql.*;
import javax.swing.JOptionPane;


/**
 *
 * @author andre
 */
public class Conector {
    
    public static Connection ConectaDB(){
    Connection conexao=null;
    String url="jdbc:mysql://localhost:3306/pizzaria";
    String usuario="root";
    String senha="";
        try {
            conexao = DriverManager.getConnection(url,usuario,senha);
            System.out.println(conexao);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro: " + ex);
        }
        return conexao;
    }
}
