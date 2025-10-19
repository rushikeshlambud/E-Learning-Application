<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Connection  con=DbConnect.con();
PreparedStatement ps=con.prepareStatement("select * from subject where combine='no' and standard=? ");
ps.setString(1,request.getParameter("std"));
ResultSet rs=ps.executeQuery();
int i=0;
%>
<div class="form-group">
<h4>Select Subjects </h4>
<%while(rs.next()){i++; %>
<p> <input type="checkbox" name="sub<%=i %>" value="<%=rs.getString(1)%>"> <b><%=rs.getString(2)%> </b></p>
<%}con.close();%>
<input type="hidden" name="count" value="<%=i%>" >
</div>