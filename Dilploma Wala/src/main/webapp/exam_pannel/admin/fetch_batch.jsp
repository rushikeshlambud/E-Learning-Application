<%@page import="DbConnect.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <option>Select Batch</option>
<%
String subject_id=request.getParameter("subject_id");
Connection con=DbConnect.con();
String sql="SELECT * FROM batch_name where subject_id=?";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, subject_id);
ResultSet rs=ps.executeQuery();
while(rs.next()){
%>
<option value="<%=rs.getString(1) %>"><%=rs.getString(3) %></option>
<%}
%>