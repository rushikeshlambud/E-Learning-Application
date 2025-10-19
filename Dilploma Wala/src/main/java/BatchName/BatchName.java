package BatchName;

import java.sql.Connection;
import java.sql.PreparedStatement;

import DbConnect.DbConnect;

public class BatchName {

	public static String getName(String cls,String subject,String combine)
	{
		if(cls.equals("11th") && subject.equals("Physics"))
		{
			return "Momentum";
		}
		else if(cls.equals("11th") && subject.equals("Chemistry"))
		{
			return "Vision";
		}
		else if(cls.equals("11th") && combine.equals("yes"))
		{
			return "Pinnacle";
		}
		else if(cls.equals("12th") && subject.equals("Physics"))
		{
			return "Focus";
		}
		else if(cls.equals("12th") && subject.equals("Chemistry"))
		{
			return "CM";
		}
		else if(cls.equals("12th") && combine.equals("yes"))
		{
			return "Pinnacle";
		}
		else if(cls.equals("Repeater") && subject.equals("Physics"))
		{
			return "Spectrum";
		}
		else if(cls.equals("Repeater") && subject.equals("Chemistry"))
		{
			return "Target";
		}
		else if(cls.equals("Repeater") && combine.equals("yes"))
		{
			return "Pinnacle";
		}
		else
		{
		return "";	
		}
		
	}
}
