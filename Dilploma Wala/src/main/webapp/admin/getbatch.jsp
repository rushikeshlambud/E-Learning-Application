<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Connection con=DbConnect.con();
String query="select * from batch_name where subject_id=? ";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,request.getParameter("sub"));
ResultSet rs=ps.executeQuery();
%>
<option value="0">Select Batch</option>
<%
while(rs.next())
{
%>
<option value="<%=rs.getString(1)%>"><%=rs.getString(3) %></option>
<%}con.close();%>