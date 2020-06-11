package Cliente;


import Cliente.Ingreso;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
    
    public static int Log(Ingreso in) throws SQLException{
        int privilegio = 0;         
        Connection cn = ClienteAc.getConnection();
        ResultSet rs=null;
        try{
            PreparedStatement ps=cn.prepareStatement("select privilegio from cliente where correo=? and password=?");
            ps.setString(1, in.getCorreo());
            ps.setString(2, in.getPassword());
            rs=ps.executeQuery();
            if(rs.next()){
                privilegio=rs.getInt(1);
            }else{
                privilegio=0;
            }
            ps.close();
            cn.close();
        }catch(Exception e){
            System.out.println("Que paso?");
            System.out.println(e.getMessage());
            e.printStackTrace();
            
        }
            
            return privilegio;
        
    }
    public static int Register(Cliente cl)throws SQLException{
        System.out.println("clientaco "+ cl);
        ResultSet rs=null;
        int estatus=0;
        try{
        Connection cn=ClienteAc.getConnection();
        PreparedStatement ps=cn.prepareStatement("select correo from cliente where correo=?");
        ps.setString(1, cl.getCorreo());
        rs=ps.executeQuery();
        if (rs.next()) {
            estatus=2;
        }else{
            try{

            ps=cn.prepareStatement("insert into cliente values(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, cl.getCorreo());
            ps.setString(2, cl.getNombres());
            ps.setString(3, cl.getAppat());
            ps.setString(4, cl.getApmat());
            ps.setInt(5, cl.getDia());
            ps.setInt(6, cl.getMes());
            ps.setInt(7, cl.getYear());
            ps.setString(8, cl.getSexo());
            ps.setString(9, cl.getPassword());
            ps.setInt(10, cl.getPrivilegio());
            ps.executeUpdate();
            estatus=1;
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
    public static List<Cliente> Consultar() throws SQLException{
        List<Cliente> datos=new ArrayList<Cliente>();
        try{
            Connection cn=ClienteAc.getConnection();
            String q="select correo,nombres,appat,apmat,dia,mes,year,sexo from cliente where privilegio=1";
            PreparedStatement ps=cn.prepareStatement(q);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Cliente cl=new Cliente();
                cl.setCorreo(rs.getString(1));
                cl.setNombres(rs.getString(2));
                cl.setAppat(rs.getString(3));
                cl.setApmat(rs.getString(4));
                cl.setDia(rs.getInt(5));
                cl.setMes(rs.getInt(6));
                cl.setYear(rs.getInt(7));
                cl.setSexo(rs.getString(8));
                datos.add(cl);
                
            }
            cn.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return datos;
    }
    public static List<Cliente> ConsultarbyCorreo(Ingreso in) throws SQLException{
        List<Cliente> datos=new ArrayList<Cliente>();
        try{
            Cliente cl=new Cliente();
            Connection cn=ClienteAc.getConnection();
            String q="select correo,nombres,appat,apmat,dia,mes,year,sexo from cliente where correo=?";
          
            PreparedStatement ps=cn.prepareStatement(q);
            ps.setString(1, in.getCorreo());
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                
                cl.setCorreo(rs.getString(1));
                cl.setNombres(rs.getString(2));
                cl.setAppat(rs.getString(3));
                cl.setApmat(rs.getString(4));
                cl.setDia(rs.getInt(5));
                cl.setMes(rs.getInt(6));
                cl.setYear(rs.getInt(7));
                cl.setSexo(rs.getString(8));
                datos.add(cl);
                
            }
            cn.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return datos;
    }
}
