package JSONpack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DbConnect.DbConnect;

public class wrong_ans {
	public static int getCount(String quiz_id,String userid){
		try
		{
			int i=0;
			Connection con=DbConnect.con();
			String query="select count(ans.user_id),ans.user_id from answerkey as ans inner join question as ques on ans.question_id=ques.id inner join register as ud on ans.user_id=ud.student_id inner join quiz_detail as qd on ans.quiz_id=qd.id where ques.quiz_id=? and ans.user_id=? and not ans.answer=ques.answer and not ans.answer='Not Attempt' group by ans.user_id,ans.quiz_id";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,quiz_id);
			ps.setString(2,userid);
			ResultSet rs=ps.executeQuery();
	          
					
			if(rs.next())
				
			{
				i=rs.getInt(1);
				System.out.println(i);
				con.close();
				return i;
			
			}
			else
			{
				return 0;
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
			return 0;
		}
		
	}
}
