<%@page import="DbConnect.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <option>Select Subject</option>
<%
String std=request.getParameter("std");
Connection con=DbConnect.con();
String sql="SELECT * FROM subject where standard=?";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, std);
ResultSet rs=ps.executeQuery();
while(rs.next()){
%>
<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
<%}
%>