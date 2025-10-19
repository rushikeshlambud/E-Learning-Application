package Batch;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.jdbc.*;
import com.oreilly.servlet.MultipartRequest;


import DbConnect.DbConnect;

public class AriseBatch implements AriseBatchQueries {

	
	
	//Method for Add batch Details
		public static int AddStudentDetails(MultipartRequest m)
		{
			try
			{
				Connection con=DbConnect.con();
				PreparedStatement ps=con.prepareStatement(addBatch);
				ps.setString(1,m.getParameter("batchname"));
				int i=ps.executeUpdate();
		
						
				if(i>0)
				{
					con.close();
					return 1;
				
				}
				else
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
