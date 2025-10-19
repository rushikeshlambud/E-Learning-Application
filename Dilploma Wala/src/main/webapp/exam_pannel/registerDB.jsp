<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Database</title>
</head>
<body>
<%
String name=request.getParameter("name");
String mobile=request.getParameter("mobile");
String address=request.getParameter("address");
String Class1=request.getParameter("class");
String email=request.getParameter("email");
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_pannel","root","root");
String sql="insert into user(name,mobile,address,class,email,password)values(?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, mobile);
ps.setString(3, address);
ps.setString(4, Class1);
ps.setString(5, email);
ps.setString(6, password);
int done=ps.executeUpdate();
if(done>0){
%>
<script type="text/javascript">
alert("Added user!!");
location.href="login.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
alert("Faild!! Try again");
location.href="login.jsp";
</script>
<%} %>
</body>
</html>