package bean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import bean.ConnectionProvider;


public class ModificaAgenda extends ConnectionProvider {
    PreparedStatement stmt = null;
    PreparedStatement stmt1 = null;
    
    public boolean modificarUsuario(String nombre,String apellidop,String apellidom,String telefono,String correo,String direccion,String password ){
                    
    try
      {
          //Connection con=ConnectionProvider.getCon();            
          String sql = "UPDATE db_LPTI_II.dbo.usuarios3 SET nombre=?,apellidop=?,apellidom=?,telefono=?,direccion=? WHERE correo=?";
          String sql1 = "UPDATE db_LPTI_II.dbo.log2 SET password=? WHERE correo=?";
          
          stmt = con.prepareStatement(sql);
          stmt1 = con.prepareStatement(sql1);
          
          stmt.setString(1, nombre);
          stmt.setString(2, apellidop);
          stmt.setString(3, apellidom);
          stmt.setString(4, telefono);
          stmt.setString(5, direccion);
          stmt.setString(6, correo);
          
          stmt.executeUpdate();
          
          
          stmt1.setString(1, password);
          stmt1.setString(2, correo);
          
          
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
