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
PreparedStatement ps=con.prepareStatement("insert into repe_videos(rep_id, std, v_name, v_embed_id, v_platform, uploading_date, uploading_time, subject_id, video_time, batch_id)values(?,?,?,?,?,?,?,?,?,?)");
ps.setString(1,request.getParameter("std"));
ps.setString(2,request.getParameter("rstd"));
ps.setString(3,request.getParameter("videoTitle"));
ps.setString(4,request.getParameter("embedid"));
ps.setString(5,request.getParameter("platform"));
ps.setString(6,request.getParameter("videoDate"));
ps.setString(7,request.getParameter("platform"));
ps.setString(8,request.getParameter("sub"));
ps.setString(9,request.getParameter("videoTime"));
ps.setString(10,request.getParameter("batch"));
i=ps.executeUpdate();
if(i>0)
{
%>
1
<%}else{%>
0<%}%>