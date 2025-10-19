<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
if(session.getAttribute("User")==null){
%>
<script type="text/javascript">
alert("Login First");
location.href="../login.jsp";
</script>
<%} %>
<%
/* session.setMaxInactiveInterval(7000); */
if(session.getAttribute("User")!=null){
%>
<a href="exams.jsp">Exam</a>
<a href="logout.jsp">Logout</a>
<%}else{ %>
<a href="../login.jsp">Login</a>
<%} %>
