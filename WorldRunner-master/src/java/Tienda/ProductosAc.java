/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tienda;
import Tienda.Productoc;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author lyeup
 */
public class ProductosAc {
    public static Connection getConnection(){
        Connection con=null;
        String url = new Utiles.usuarioYContrasenaBD().getUrl();
        String user = new Utiles.usuarioYContrasenaBD().getUser();
        String password = new Utiles.usuarioYContrasenaBD().getPassword();
        String driver = new Utiles.usuarioYContrasenaBD().getDriver();
        try{
            Class.forName(driver);
            con=DriverManager.getConnection(url,user,password);
        }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }  
        return con;
    }
    public static List<Productoc> Consultar() throws SQLException{
        List<Productoc> datos=new ArrayList<Productoc>();
        try{
            Connection cn=ProductosAc.getConnection();
            String q="select cproducto,nombre,precio,talla,cantidad,img from playera";
            PreparedStatement ps=cn.prepareStatement(q);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                Productoc pr=new Productoc();
                pr.setCproducto(rs.getString(1));
                pr.setNombre(rs.getString(2));
                pr.setPrecio(rs.getInt(3));
                pr.setTalla(rs.getString(4));
                pr.setCantidad(rs.getInt(5));
                pr.setImg(rs.getString(6));
                datos.add(pr);
                
            }
            cn.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return datos;
    }
    public static List<Productoc> ConsultarbyCod(Search sr) throws SQLException{
        List<Productoc> datos=new ArrayList<Productoc>();
        try{
            Productoc pr=new Productoc();
            Connection cn=ProductosAc.getConnection();
            String q="select cproducto,nombre,precio,talla,cantidad,img from playera where cproducto=?";
            PreparedStatement ps=cn.prepareStatement(q);
            ps.setString(1, sr.getCproducto());
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                
                pr.setCproducto(rs.getString(1));
                pr.setNombre(rs.getString(2));
                pr.setPrecio(rs.getInt(3));
                pr.setTalla(rs.getString(4));
                pr.setCantidad(rs.getInt(5));
                pr.setImg(rs.getString(6));
                datos.add(pr);
                
            }
            cn.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return datos;
    }
    public static boolean Añadir(Productoc pr)throws SQLException{
        ResultSet rs=null;
        boolean estatus=false;
        try{
        Connection cn=ProductosAc.getConnection();
        PreparedStatement ps=cn.prepareStatement("select cproducto from playera where cproducto=?");
        ps.setString(1, pr.getCproducto());
        rs=ps.executeQuery();
        if (rs.next()) {
            estatus=false;
        }else{
            try{

            ps=cn.prepareStatement("insert into playera values(?,?,?,?,?,?)");
            ps.setString(1, pr.getCproducto());
            ps.setString(2, pr.getNombre());
            ps.setInt(3, pr.getPrecio());
            ps.setString(4, pr.getTalla());
            ps.setInt(5, pr.getCantidad());
            ps.setString(6, pr.getImg());

            ps.executeUpdate();
            estatus=true;
            cn.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return estatus;
    }
    public static boolean Modificar(Productoc pr) throws SQLException{
        boolean estatus=false;
        try{
            Connection cn=ProductosAc.getConnection();
            PreparedStatement ps=cn.prepareStatement("update playera set nombre=?,precio=?,talla=?,cantidad=?,img=? where cproducto=?");
            ps.setString(1, pr.getNombre());
            ps.setInt(2, pr.getPrecio());
            ps.setString(3, pr.getTalla());
            ps.setInt(4, pr.getCantidad());
            ps.setString(5, pr.getImg());
            ps.setString(6, pr.getCproducto());
            ps.executeUpdate();
            estatus=true;
            cn.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return estatus;
    }
    public static boolean Eliminar(Search sr)throws SQLException{
        boolean estatus=false;
        try{
            Connection cn=ProductosAc.getConnection();
            PreparedStatement ps=cn.prepareStatement("Delete from playera where cproducto=?");
            ps.setString(1, sr.getCproducto());
            ps.executeUpdate();
            estatus=true;
            cn.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return estatus;
    }
}
