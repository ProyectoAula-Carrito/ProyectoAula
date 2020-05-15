package bean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import bean.ConnectionProvider;

public class InsertaAgenda extends ConnectionProvider{
    PreparedStatement stmt = null;
    PreparedStatement stmt1 = null;
    
     public boolean agregarUsuario(String usuario,String password,String correo,String nombre,String apellidop,String apellidom,String curp,String year,String month,String day,String direccion,String cp,String telefono){
                   
    try
      {
          //Connection con=ConnectionProvider.getCon();            
          String sql = "INSERT INTO db_LPTI_II.dbo.usuarios3 (usuario,password,correo,nombre,apellidop,apellidom,curp,year,month,day,direccion,cp,telefono) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
          String sql1 = "INSERT INTO db_LPTI_II.dbo.log2 (correo,password ) VALUES (?,?)";
          
          stmt = con.prepareStatement(sql);
          stmt1 = con.prepareStatement(sql1);
          
          stmt.setString(1, usuario);
          stmt.setString(2, password);
          stmt.setString(3, correo);
          stmt.setString(4, nombre);
          stmt.setString(5, apellidop);
          stmt.setString(6, apellidom);
          stmt.setString(7, curp);
          stmt.setString(8, year);
          stmt.setString(9, month);
          stmt.setString(10, day);
          stmt.setString(11, direccion);
          stmt.setString(12, cp);
          stmt.setString(13, telefono);
          
          stmt.executeUpdate();
          
          stmt1.setString(1, correo);
          stmt1.setString(2, password);
          
          stmt1.executeUpdate();
          
          if(stmt != null && stmt1 != null) {
              //con.close();
              stmt.close();
              stmt = null;
              
              stmt1.close();
              stmt1 = null;
              
              return true;
          }
          
        } catch (Exception e)  {  
          return false;
           }
        return true;
        }
        
}
