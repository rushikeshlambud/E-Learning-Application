<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_pannel","root","root");
String user_id=request.getParameter("user_id");
String data=request.getParameter("data");
String qquiz_id=request.getParameter("qquiz_id");
String sql="insert into answer_key(user_id,qquiz_id)values(?,?)";
PreparedStatement ps=con.prepareStatement(sql);
int done=ps.executeUpdate();
if(done>0){
%>
<script type="text/javascript">
location.href="exams.jsp";
</script>
<%} %>
</body>
</html>