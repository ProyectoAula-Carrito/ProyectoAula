package bean;
import java.sql.*;
public class LoginDao {

	public static boolean validate(LoginBean bean){
		boolean status=false;
		try{
			Connection con=ConnectionProvider.getCon();
			
			PreparedStatement ps=con.prepareStatement("select * from db_LPTI_II.dbo.log2 where correo=? and password=?");
			ps.setString(1,bean.getCorreo());
			ps.setString(2,bean.getPassword());
			
			ResultSet rs=ps.executeQuery();
			status=rs.next();
			
		}catch(SQLException e){}
		return status;
	}
        
        
   

       }
