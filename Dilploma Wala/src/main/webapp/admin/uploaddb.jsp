<%@page import="DbConnect.Query"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String Video_name, Video_Embeded_Id, Video_platfrom, standard;
Connection con=DbConnect.con();
int i=0;
PreparedStatement ps=con.prepareStatement("insert into videos(v_name, v_embed_id, v_standard, v_platform, uploading_date, uploading_time, subject_id, batch_id, video_time)values(?,?,?,?,?,CURTIME(),?,?,?)");
ps.setString(1,request.getParameter("videoTitle"));
ps.setString(2,request.getParameter("embedid"));
ps.setString(3,request.getParameter("std"));
ps.setString(4,request.getParameter("platform"));
ps.setString(5,request.getParameter("videoDate"));
ps.setString(6,request.getParameter("sub"));
ps.setString(7,request.getParameter("batch"));
ps.setString(8,request.getParameter("videoTime"));

i=ps.executeUpdate();
if(i>0)
{
%>
1
<%}else{%>
0<%}%>