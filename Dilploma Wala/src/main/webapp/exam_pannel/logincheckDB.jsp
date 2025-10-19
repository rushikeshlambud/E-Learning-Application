<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Check Database</title>
</head>
<body>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_pannel","root","root");
String sql="select *from user where email=? and password=?";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, email);
ps.setString(2, password);
ResultSet rs=ps.executeQuery();
if(rs.next()){
	session.setMaxInactiveInterval(36000);
	session.setAttribute("id", rs.getString(1));
	session.setAttribute("name", rs.getString(2));
	session.setAttribute("mobile", rs.getString(3));
	session.setAttribute("class", rs.getString(5));
	session.setAttribute("email", rs.getString(6));
	response.sendRedirect("exams.jsp");
}else{ %>
<script type="text/javascript">
alert("Login Faild!!");
location.href="login.jsp";
</script>
<%} %>
</body>
</html>