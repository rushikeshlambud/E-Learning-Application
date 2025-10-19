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
PreparedStatement ps=con.prepareStatement(Query.delete_video_details);
ps.setString(1,request.getParameter("id"));
i=ps.executeUpdate();
if(i>0)
{con.close();
%>
1
<%}else{
con.close();%>
0<%}%>