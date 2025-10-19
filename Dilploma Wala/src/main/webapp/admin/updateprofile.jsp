
<%@page import="DbConnect.Query"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

Connection con=DbConnect.con();
int i=0;
PreparedStatement ps=con.prepareStatement("update register set profile=? where student_id=?");
ps.setString(1,request.getParameter("profile"));
ps.setString(2,request.getParameter("id"));
i=ps.executeUpdate();
con.close();
if(i>0)
{
%>
<script>
alert("Updated Successfully !");
location.href="viewscreenshot.jsp?id=<%=request.getParameter("id")%>";
</script>
<%}else{%>
<script>
alert("Try again !");
location.href="viewscreenshot.jsp?id=<%=request.getParameter("id")%>";
</script>
<%}%>