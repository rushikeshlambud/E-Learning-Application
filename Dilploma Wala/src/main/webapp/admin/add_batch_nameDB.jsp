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
String sub_id=request.getParameter("sub_id");
String batch_name=request.getParameter("batch_name");
Connection con= DbConnect.con();
String sql="insert into batch_name(subject_id, batch_name, status)values(?,?,'deactivate')";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, sub_id);
ps.setString(2, batch_name);
int done=ps.executeUpdate();
if(done>0){
	con.close();
	response.sendRedirect("add_batch_name.jsp");
}else{
	con.close();
	%>
	<script type="text/javascript">
	alert("Try Again!!");
	location.href="add_batch_name.jsp";
	</script>
<%}
%>
</body>
</html>