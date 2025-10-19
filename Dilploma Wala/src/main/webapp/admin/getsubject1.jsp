<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Connection con=DbConnect.con();
String query="select * from subject where standard=? and subject_status='Activated' and combine!='yes'";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,request.getParameter("std"));
ResultSet rs=ps.executeQuery();
%>
<option value="0">Select Subject</option>
<%
while(rs.next())
{
if(!rs.getString(2).equals("Combine(Physics and Chemistry)"))
{%>
<option value="<%=rs.getString(1)%>"><%=rs.getString(2) %></option>
<%}}con.close();%>