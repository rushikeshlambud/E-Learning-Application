package Batch;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.JSONObject;

import DbConnect.DbConnect;

public class Batch {
	//select batch_id from batch_name where subject_id='5' and batch_name='Batch-1';
	
	public static JSONObject getBatchbyId(String id)
	{
		JSONObject obj=new JSONObject();
		try {
		Connection con=DbConnect.con();
		PreparedStatement ps=con.prepareStatement("select * from batch_name where batch_id=?");
		ps.setString(1,id);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			obj.put("batch_id", rs.getString(1));
			obj.put("batch_Name", rs.getString(3));	
		}
		con.close();
		return obj;	
		}catch(Exception e) {
			
			System.out.print(e);
		return null;
		}
		
	}
	
	
	public static JSONObject getBatchIdbyname(String subject,String Batch)
	{
		JSONObject obj=new JSONObject();
		try {
		Connection con=DbConnect.con();
		PreparedStatement ps=con.prepareStatement("select batch_id from batch_name where subject_id=? and batch_name=?");
		ps.setString(1,subject);
		ps.setString(2,Batch);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			obj.put("batch_id", rs.getString(1));
			
		}
		con.close();
		return obj;	
		}catch(Exception e) {
			
			System.out.print(e);
		return null;
		}
		
	}
	
	
	public static String getBatchNamebysubid(String subject)
	{
	    String obj="";
		try {
		Connection con=DbConnect.con();
		PreparedStatement ps=con.prepareStatement("select batch_name from batch_name where subject_id=? ");
		ps.setString(1,subject);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			obj= rs.getString(1);
			
		}
		con.close();
		return obj;	
		}catch(Exception e) {
			
			System.out.print(e);
		return null;
		}
		
	}
	
	
	
	public static String getBatch(String subject,String batch)
	{
	    String obj="";
		try {
		Connection con=DbConnect.con();
		PreparedStatement ps=con.prepareStatement("select batch_id from batch_name where subject_id=? and batch_name=?");
		ps.setString(1,subject);
		ps.setString(2, batch);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			obj= rs.getString(1);
			
		}
		con.close();
		return obj;	
		}catch(Exception e) {
			
			System.out.print(e);
		return null;
		}
		
	}
	
	
	public static String getBatchIdbyname(String subject)
	{
		String obj="";
		try {
		Connection con=DbConnect.con();
		PreparedStatement ps=con.prepareStatement("select batch_id from batch_name where subject_id=? and batch_name=?");
		ps.setString(1,subject);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			obj=rs.getString(1);
			
		}
		con.close();
		return obj;	
		}catch(Exception e) {
			
			System.out.print(e);
		return null;
		}
		
	}


}
