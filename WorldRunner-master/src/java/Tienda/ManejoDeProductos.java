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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author crist
 */
public class ManejoDeProductos {
    public String[] productosEnBD(){
        String[] productos = null;
        Connection cn = ClienteAc.getConnection();
        ResultSet rs = null;
        
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
                        
                        String botonDeCompra = "<br><br><br><br>";
                        if (disponibilidad) {
                            disponible = "Disponibles: <br><input id=\""+ rs.getString("cproducto") +"\" value=\"" + rs.getInt("cantidad") + "\" readonly style=\"width: 30%;\" class=\"intro\"><br><input hidden id=\"ORG"+ rs.getString("cproducto") +"\" value=\"" + rs.getInt("cantidad") + "\"readonly>";
                            botonDeCompra = "<br>"
                                            + "<input type=\"button\" onclick=\"agregar('" + rs.getString("cproducto") + "', '" + rs.getString("nombre") + "', '" + rs.getString("talla") + "', '" + rs.getString("precio") + "')\" value=\"Añadir al carrito\" class=\"intro\">"
                                            + "<br>"
                                            + "<input type=\"button\" onclick=\"quitar('" + rs.getString("cproducto") + "', '" + rs.getString("nombre") + "', '" + rs.getString("talla") + "', '" + rs.getString("precio") + "')\" value=\"Quitar 1 del carrito\" class=\"intro\">\n"; 
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
        finally{
            try {
                cn.close();
            } catch (SQLException ex) {
                Logger.getLogger(ManejoDeProductos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
         
        return productos;
    }
    
    public boolean compraRealizada(String productos){
        if (productos != "" && productos != null) {
            ArrayList<String> producto = new ArrayList();
            String productoCopiaTemporal = "";
            String cantidadCopiaTemporal = "";
            boolean copiarID = true;
            
            for (int i = 0; i < productos.length(); i++) {
                if (productos.charAt(i) == '-') {
                    copiarID = false;
                    i++;
                }
                
                if (copiarID) {
                    productoCopiaTemporal = productoCopiaTemporal + "" + productos.charAt(i);
                }else if (productos.charAt(i) != ','){
                    cantidadCopiaTemporal = cantidadCopiaTemporal + "" + productos.charAt(i);
                }
                else{
                    producto.add(productoCopiaTemporal.trim());
                    producto.add(cantidadCopiaTemporal.trim());
                    
                    copiarID = true;
                    
                    productoCopiaTemporal = "";
                    cantidadCopiaTemporal = "";
                }
            }
            
            if (producto.size() > 0) {
                Connection cn = ClienteAc.getConnection();
                
                try{
                    for (int i = 0; i < producto.size(); i++) {
                        if (i + 1 < producto.size()) {
                            ResultSet rs = null;
                           
                            PreparedStatement ps = cn.prepareStatement("select * from playera WHERE cproducto = '" + producto.get(i) + "';");
                            rs = ps.executeQuery();
                            rs.next();
                            int productosDisponiblesFinales = rs.getInt("cantidad") - Integer.parseInt(producto.get(i+1));
                            
                            ps = cn.prepareStatement("UPDATE playera SET cantidad = '" + productosDisponiblesFinales + "' WHERE cproducto = '" + producto.get(i) + "';");
                            ps.executeUpdate();
                            i++;
                        }
                    }
                }catch(Exception e){
                    System.out.println("Que paso?");
                    System.out.println(e.getMessage());
                    e.printStackTrace();
                    try {
                        cn.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(ManejoDeProductos.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                    return false;
                }
            }
            
            return true;
        }
        
        return false;
    }
}
