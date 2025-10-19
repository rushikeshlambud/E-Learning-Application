<%@page import="DbConnect.Query"%>
<%@page import="DbConnect.DbConnect"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
try{
String Video_name, Video_Embeded_Id, Video_platfrom, standard;
Connection con=DbConnect.con();
int i=0;
PreparedStatement ps=con.prepareStatement("update repe_videos set  v_name=?, v_embed_id=?, rep_id=?, v_platform=?,uploading_date=? where rp_id=?");
ps.setString(1,request.getParameter("videoTitle"));
ps.setString(2,request.getParameter("embedid"));
ps.setString(3,request.getParameter("std"));
ps.setString(4,request.getParameter("platform"));
ps.setString(5,request.getParameter("videoDate"));
ps.setString(6,request.getParameter("vid"));
i=ps.executeUpdate();
if(i>0)
{
%>
1
<%}else{%>
0<%}
}
catch(Exception e){
System.out.print(e);
}%>