/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tienda;

import Cliente.ClienteAc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author crist
 */
public class TiendaCargarProductos {
    public String[] productosEnBD(){
        String[] productos = null;
        Connection cn = ClienteAc.getConnection();
        ResultSet rs=null;
        
        try{
            PreparedStatement ps=cn.prepareStatement("select count(*) as items from playera;");
            rs = ps.executeQuery();
            rs.next();
            int cantidadDeRegistros = rs.getInt("items");
            
            if (cantidadDeRegistros > 0) {
                productos = new String[cantidadDeRegistros];
                
                ps = cn.prepareStatement("select * from playera;");
                rs = ps.executeQuery();
                
                for (int i = 0; i < cantidadDeRegistros; i++) {
                    if (rs.next()) {
                        boolean disponibilidad = rs.getInt("cantidad") > 0;
                        String disponible = "<br>"
                                            + "Agotado";
                        
                        String botonDeCompra = "<br><br>";
                        if (disponibilidad) {
                            disponible = "Disponibles: <br><input id=\""+ rs.getString("cproducto") +"\" value=\"" + rs.getInt("cantidad") + "\" readonly style=\"width: 30%;\" class=\"intro\">";
                            botonDeCompra = "<br>"
                                            + "<input type=\"button\" onclick=\"agregar('" + rs.getString("cproducto") + "')\" value=\"Añadir al carrito\" class=\"intro\">"
                                            + "\n"; 
                        }
                        
                        productos[i] = "<article style=\"display: inline-block; padding: 2%; text-align: center; color: white;\">\n"
                                        + "<img src=\"" + rs.getString("img") + "\">\n"
                                        + "<br>\n"
                                        + rs.getString("nombre") + "\n"
                                        + "<br>\n"
                                        + "Talla: " + rs.getString("talla") + "\n"
                                        + "<br>\n"
                                        + rs.getInt("precio") + " $\n"
                                        + "<br>\n"
                                        + disponible + "\n"
                                        + botonDeCompra
                                        + "</article>";
                    }
                    else{
                        break;
                    }
                }
            }
            
            ps.close();
            cn.close();
        }catch(Exception e){
            System.out.println("Que paso?");
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
         
        return productos;
    }
}
