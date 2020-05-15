package bean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import bean.ConnectionProvider;


public class EliminaAgenda extends ConnectionProvider{
    PreparedStatement stmt = null;
    PreparedStatement stmt1 = null;
    
         public boolean eliminarUsuario(String correo){
                   
    try
      {
          //Connection con=ConnectionProvider.getCon();            
          String sql = "DELETE FROM db_LPTI_II.dbo.usuarios3 WHERE correo=?";
          String sql1 = "DELETE FROM db_LPTI_II.dbo.log2 WHERE correo=?";
          
          stmt = con.prepareStatement(sql);
          stmt1 = con.prepareStatement(sql1);
          
          stmt.setString(1, correo);
          stmt.executeUpdate();
          
          stmt1.setString(1, correo);          
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
