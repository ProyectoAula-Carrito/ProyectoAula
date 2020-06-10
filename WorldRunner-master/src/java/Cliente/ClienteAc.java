package Cliente;


import Cliente.Ingreso;
import java.sql.*;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author lyeup
 */
public class ClienteAc {
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
    
    public static boolean Log(Ingreso in) throws SQLException{
        boolean estatus=false;        
        Connection cn = ClienteAc.getConnection();
        ResultSet rs=null;
        try{
            PreparedStatement ps=cn.prepareStatement("select * from cliente where correo=? and password=?");
            ps.setString(1, in.getCorreo());
            ps.setString(2, in.getPassword());
            rs=ps.executeQuery();
            if(rs.next()){
                estatus=true;
            }else{
                estatus=false;
            }
            ps.close();
            cn.close();
        }catch(Exception e){
            System.out.println("Que paso?");
            System.out.println(e.getMessage());
            e.printStackTrace();
            
        }
            
            return estatus;
        
    }
    public static boolean Register(Cliente cl)throws SQLException{
        System.out.println("clientaco "+ cl);
        
        boolean estatus=false;
        try{
        Connection cn=ClienteAc.getConnection();
        PreparedStatement ps=cn.prepareStatement("insert into cliente values(?,?,?,?,?,?,?,?,?)");
        ps.setString(1, cl.getCorreo());
        ps.setString(2, cl.getNombres());
        ps.setString(3, cl.getAppat());
        ps.setString(4, cl.getApmat());
        ps.setInt(5, cl.getDia());
        ps.setInt(6, cl.getMes());
        ps.setInt(7, cl.getYear());
        ps.setString(8, cl.getSexo());
        ps.setString(9, cl.getPassword());
        ps.executeUpdate();
        estatus=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return estatus;
    }
}
