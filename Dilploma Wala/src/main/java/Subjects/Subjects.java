package Subjects;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.JSONArray;
import org.json.JSONObject;

import DbConnect.DbConnect;

public class Subjects {

	public static JSONArray getsubjects()
	{
		JSONArray arr=new JSONArray();
		try {
		Connection con=DbConnect.con();
		PreparedStatement ps=con.prepareStatement("select * from subject where subject_status='Activated'");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			JSONObject obj=new JSONObject();
			obj.put("sub_Id", rs.getString(1));
			obj.put("sub_Name", rs.getString(2));
			obj.put("combine", rs.getString(5));
			arr.put(obj);
		}
		con.close();
		return arr;	
		}catch(Exception e) {
			
			System.out.print(e);
		return null;
		}
		
	}
	
	
	
	public static JSONObject getsubjectsbyId(String id)
	{
		JSONObject obj=new JSONObject();
		try {
		Connection con=DbConnect.con();
		PreparedStatement ps=con.prepareStatement("select * from subject where subject_id=?");
		ps.setString(1,id);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			
			obj.put("sub_Id", rs.getString(1));
			obj.put("sub_Name", rs.getString(2));
			obj.put("combine", rs.getString(5));
			
		}
		con.close();
		return obj;	
		}catch(Exception e) {
			
			System.out.print(e);
		return null;
		}
		
	}
	
	public static JSONObject getsubjectbyClass(String id)
	{
		JSONObject obj=new JSONObject();
		try {
		Connection con=DbConnect.con();
		PreparedStatement ps=con.prepareStatement("select * from subject where standard=?");
		ps.setString(1,id);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			
			obj.put("sub_Id", rs.getString(1));
			obj.put("sub_Name", rs.getString(2));
			obj.put("combine", rs.getString(5));
			
		}
		con.close();
		return obj;	
		}catch(Exception e) {
			
			System.out.print(e);
		return null;
		}
		
	}
	
	
	public static JSONArray getsubjectbyClassName(String id)
	{
		JSONArray arr=new JSONArray();
		try {
		Connection con=DbConnect.con();
		PreparedStatement ps=con.prepareStatement("select * from subject where standard=? and subject_status='Activated'");
		ps.setString(1,id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			JSONObject obj=new JSONObject();
			obj.put("sub_Id", rs.getString(1));
			obj.put("sub_Name", rs.getString(2));
			obj.put("combine", rs.getString(5));
			arr.put(obj);
		}
		con.close();
		return arr;	
		}catch(Exception e) {
			
			System.out.print(e);
		return null;
		}
		
	}
	
	public static JSONArray getcombinesubjects(String id)
	{
		JSONArray arr=new JSONArray();
		try {
		Connection con=DbConnect.con();
		PreparedStatement ps=con.prepareStatement("select c_subid from combinesubjects where subject_id=?");
		ps.setString(1,id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			JSONObject obj=new JSONObject();
			obj.put("sub_Id", rs.getString(1));
			arr.put(obj);
		}
		con.close();
		return arr;	
		}catch(Exception e) {
			
			System.out.print(e);
		return null;
		}
		
	}
	
	
	
	
	
	
	public static JSONArray getsubjectbyClassName(String id,String batch)
	{
		JSONArray arr=new JSONArray();
		try {
		Connection con=DbConnect.con();
		PreparedStatement ps=con.prepareStatement("select s.* from subject as s inner join batch_name as b on s.subject_id=b.subject_id where s.standard=? and b.batch_name=?;");
		ps.setString(1,id);
		ps.setString(2,batch);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			JSONObject obj=new JSONObject();
			obj.put("sub_Id", rs.getString(1));
			obj.put("sub_Name", rs.getString(2));
			obj.put("combine", rs.getString(5));
			arr.put(obj);
		}
		con.close();
		return arr;	
		}catch(Exception e) {
			
			System.out.print(e);
		return null;
		}
		
	}
}
