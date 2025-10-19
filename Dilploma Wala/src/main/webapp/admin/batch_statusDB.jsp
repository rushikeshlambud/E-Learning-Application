
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
Connection con= DbConnect.con();
String batch_id=request.getParameter("batch_id");
String staus=request.getParameter("staus");
System.out.print(staus);
PreparedStatement ps=null;
String sql="";
int done;
if(staus.equals("deactivate")){
	sql="update batch_name set status='Activated' where batch_id=?";
	ps=con.prepareStatement(sql);
	ps.setString(1, batch_id);

	done=ps.executeUpdate();
	con.close();
	response.sendRedirect("add_batch_name.jsp");
	
}else if(staus.equals("Activated")){
	sql="update batch_name set status='deactivate' where batch_id=?";
	ps=con.prepareStatement(sql);
	ps.setString(1, batch_id);
	done=ps.executeUpdate();
	con.close();
	response.sendRedirect("add_batch_name.jsp");
}

%>
</body>
</html>