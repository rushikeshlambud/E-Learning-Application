package Registration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.oreilly.servlet.MultipartRequest;

import DbConnect.DbConnect;

public class RegistrationDetails implements RegistrationQueries {

	
	//Method for Add Student Details
	public static int AddStudentDetails(MultipartRequest m)
	{
		try
		{
			Connection con=DbConnect.con();
			PreparedStatement ps=con.prepareStatement(addStudents,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1,m.getParameter(""));
			ps.setString(2,m.getParameter(""));
			ps.setString(3,m.getParameter(""));
			ps.setString(4,m.getParameter(""));
			ps.setString(5,m.getParameter(""));
			ps.setString(6,m.getParameter(""));
			ps.setString(7,m.getParameter(""));
			ps.setString(8,m.getParameter(""));
			ps.setString(9,m.getParameter(""));
			ps.setString(10,m.getParameter(""));
			ps.setString(11,m.getParameter(""));
			ps.setString(12,m.getParameter(""));
			ps.executeUpdate();
			
			ResultSet rs=ps.getGeneratedKeys();
			
			if(rs.next())
			{
				ps=con.prepareStatement(assignBatch);
				ps.setString(1,m.getParameter("Batchid"));
				ps.setString(2,m.getParameter(rs.getString(1)));
				ps.executeUpdate();
				con.close();
				return 1;
						
			}else
			{
				return 0;
			}
		}
		catch(Exception e)
		{
			
		}
		return 0;
	}
}
