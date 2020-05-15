package bean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

public class ConsultaAgenda {
    
    public static LinkedList<Contacto> getContactos()
   {
      LinkedList<Contacto> listaContactos=new LinkedList<Contacto>();
      try
      {
          Connection con=ConnectionProvider.getCon();            
          String consulta = "SELECT\n" +
                            "	log2.correo,\n" +
                            "	log2.password\n" +
                            "FROM\n" +
                            "	db_LPTI_II.dbo.log2;";
          ResultSet rs = null;
          PreparedStatement pst = null;
          pst = con.prepareStatement(consulta);
          rs = pst.executeQuery();
                         
        while (rs.next())
         {
            Contacto contacto = new Contacto();
            contacto.setCorreo(rs.getString("correo"));
            contacto.setPassword(rs.getString("password"));
            listaContactos.add(contacto);
         }
         rs.close();
         pst.close();
         //con.close();
      }
      catch (Exception e)  {  e.printStackTrace();  }
      return listaContactos;
   }    
}
