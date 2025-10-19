<%@page import="DbConnect.Query"%>
<%@page import="DbConnect.DbConnect"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
try{
Connection con=DbConnect.con();
int i=0;
String q="update demovideos set  v_name=?, v_embed_id=?, v_standard=?, v_platform=? where dvid=?";
PreparedStatement ps=con.prepareStatement(q);
ps.setString(1,request.getParameter("videoTitle"));
ps.setString(2,request.getParameter("embedid"));
ps.setString(3,request.getParameter("std"));
ps.setString(4,request.getParameter("platform"));
ps.setString(5,request.getParameter("vid"));
i=ps.executeUpdate();
con.close();
if(i>0)
{
%>
1
<%}else{%>0<%=request.getParameter("videoTitle")%>s

<%}
}
catch(Exception e){
System.out.print(e);
}%>