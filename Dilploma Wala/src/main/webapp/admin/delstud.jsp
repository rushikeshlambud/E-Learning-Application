<%@page import="java.sql.PreparedStatement"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Connection con=DbConnect.con();
PreparedStatement ps=con.prepareStatement("delete from register where student_id=?");
ps.setString(1,request.getParameter("id"));
int i=ps.executeUpdate();
if(i>0)
{con.close();
%>
<script>
alert("Successfully Deleted");
location.href="studentlist.jsp";
</script>
<%}
else{con.close();%>
<script>
alert("Try again");
location.href="studentlist.jsp";
</script>
<%}%>