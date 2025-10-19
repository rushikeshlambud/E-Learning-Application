package JSONpack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DbConnect.DbConnect;

public class checkExam {
public static boolean examStatus(String user_id,String quiz_id){
	try
	{
		Connection con=DbConnect.con();
		String query="select user_id,quiz_id from answerkey where user_id=? and quiz_id=? group by quiz_id";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,user_id);
		ps.setString(2,quiz_id);
		ResultSet rs=ps.executeQuery();
          
				
		if(rs.next())
		{
			System.out.println("hfhg");
			con.close();
			return true;
		
		}
		else
		{
			return false;
		}
	}
	catch(Exception e)
	{
		System.out.println(e);
		return false;
	}
	
}
}
