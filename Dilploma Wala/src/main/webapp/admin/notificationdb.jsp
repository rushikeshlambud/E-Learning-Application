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
PreparedStatement ps=con.prepareStatement("insert into notifications(title,data,date)values(?,?,?)");
ps.setString(1, title);
ps.setString(2, data);
ps.setString(3, date);
int i=ps.executeUpdate();
con.close();
if(i>0){
%>
<script>
alert("Notification Addeed Successfully!");
location.href="uploadnotes.jsp";
</script>
<%}else{%>
<script>
alert("Please Try Again");
location.href="uploadnotes.jsp";
</script>
<%}}
catch(Exception e){%>
<script>
console.log('<%=e%>');
alert("System Error !");
location.href="uploadnotes.jsp";
</script>
<%}%>