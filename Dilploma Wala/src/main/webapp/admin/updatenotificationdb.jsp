<%@page import="java.sql.PreparedStatement"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
try{
String date=request.getParameter("Date");
String title=request.getParameter("Title");
String data=request.getParameter("Data");

Connection con=DbConnect.con();
PreparedStatement ps=con.prepareStatement("update notifications set title=?,data=?,date=? where id=?");
ps.setString(1, title);
ps.setString(2, data);
ps.setString(3, date);
ps.setString(4, request.getParameter("id"));
int i=ps.executeUpdate();
con.close();
if(i>0){
%>
<script>
alert("Notification updated Successfully!");
location.href="notificationlist.jsp";
</script>
<%}else{%>
<script>
alert("Please Try Again");
location.href="notificationlist.jsp";
</script>
<%}}
catch(Exception e){%>
<script>
console.log('<%=e%>');
alert("System Error !");
location.href="notificationlist.jsp";
</script>
<%}%>