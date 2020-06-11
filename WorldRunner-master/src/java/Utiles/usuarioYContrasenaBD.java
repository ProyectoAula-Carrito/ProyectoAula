/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utiles;

/**
 *
 * @author crist
 */
public class usuarioYContrasenaBD {
    private String url="jdbc:mysql://localhost:3306/comprascarrito";
    private String user="root";
    private String password="n0m3l0";
    private String driver="com.mysql.jdbc.Driver";

    public String getUrl() {
        return url;
    }

    public String getUser() {
        return user;
    }

    public String getPassword() {
        return password;
    }

    public String getDriver() {
        return driver;
    }
}
