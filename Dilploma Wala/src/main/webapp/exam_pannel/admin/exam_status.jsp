
<%@page import="DbConnect.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String status=request.getParameter("status");
String quiz_id=request.getParameter("quiz_id");
Connection con=DbConnect.con();
String sql="";
int done=0;
PreparedStatement ps=null;
if(status.equals("Active")){
	sql="update quiz_detail set exam_status='Deactive' where id=?";
	ps=con.prepareStatement(sql);
	ps.setString(1, quiz_id);
	done=ps.executeUpdate();
}else if(status.equals("Deactive")){
	sql="update quiz_detail set exam_status='Active' where id=?";
	ps=con.prepareStatement(sql);
	ps.setString(1, quiz_id);
	done=ps.executeUpdate();
}

if(done>0){
	response.sendRedirect("student_result.jsp");
}else{
%>
<script type="text/javascript">
alert("Not Status Changed Try Again!!");
location.href="student_result.jsp";
</script>
<%} %>
</body>
</html>