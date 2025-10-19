package DbConnect;
import java.sql.*;

public class DbConnect {
	static Connection con=null;
	 public static   Connection con()
	 {
		 try
		 {
			Class.forName(DbInitializer.Driver); 
			con=DriverManager.getConnection(DbInitializer.db,DbInitializer.username,DbInitializer.pass);
			return con;
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
			 //to handle exception
			 return con;
		 }
	 }

}
