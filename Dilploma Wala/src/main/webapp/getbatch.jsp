<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Connection con=DbConnect.con();
String query="select * from batch_name where subject_id=? and  status='Activated' ";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,request.getParameter("sub"));
ResultSet rs=ps.executeQuery();
%>
<%
while(rs.next())
{
%>
<option value="<%=rs.getString(1)%>"><%=rs.getString(3) %></option>
<%}con.close();%>