package bean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

public class ConsultaAgenda2 {
    
    public static LinkedList<Contacto2> getContactos()
   {
      LinkedList<Contacto2> listaContactos=new LinkedList<Contacto2>();
      try
      {
          /*
          usuario,password,correo,nombre,apellidop,apellidom,curp,year,month,day,direccion,cp,telefono*/
          Connection con=ConnectionProvider.getCon();            
          String consulta = "SELECT\n" +
                            "	usuarios3.usuario,\n" +
                            "	usuarios3.password,\n" +
                            "	usuarios3.correo,\n" +
                            "	usuarios3.nombre,\n" +
                            "	usuarios3.apellidop,\n" +
                            "	usuarios3.apellidom,\n" +
                            "	usuarios3.curp,\n" +
                            "	usuarios3.year,\n" +
                            "	usuarios3.month,\n" +
                            "	usuarios3.day,\n" +
                            "	usuarios3.direccion,\n" +
                            "	usuarios3.cp,\n" +
                            "	usuarios3.telefono\n" +
                            "FROM\n" +
                            "	db_LPTI_II.dbo.usuarios3;";
          ResultSet rs = null;
          PreparedStatement pst = null;
          pst = con.prepareStatement(consulta);
          rs = pst.executeQuery();
                         
        while (rs.next())
         {
            Contacto2 contacto = new Contacto2();
            contacto.setUsuario(rs.getString("usuario"));
            contacto.setPassword(rs.getString("password"));
            contacto.setCorreo(rs.getString("correo"));
            contacto.setNombre(rs.getString("nombre"));
            contacto.setApellidop(rs.getString("apellidop"));
            contacto.setApellidom(rs.getString("apellidom"));
            contacto.setCurp(rs.getString("curp"));
            contacto.setYear(rs.getString("year"));
            contacto.setMonth(rs.getString("month"));
            contacto.setDay(rs.getString("day"));
            contacto.setDireccion(rs.getString("direccion"));
            contacto.setCp(rs.getString("cp"));
            contacto.setTelefono(rs.getString("telefono"));
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
