<%@page import="DbConnect.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%
   Connection con=DbConnect.con();
    String sql="";
    PreparedStatement ps=null;
    ResultSet rs=null;
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Question</title>
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
String quiz_id=request.getParameter("quiz_id");
 sql="select *from question where quiz_id="+quiz_id;
 ps=con.prepareStatement(sql);
 rs=ps.executeQuery();
int i=1;
while(rs.next()){
%>
<div class="container">
<div class="row">

<div class="col-md-12" style="border: 2px solid red;padding: 10px;">
<b>Quistion Number: <%=i %></b>
<a href="update_question_number.jsp?question_id=<%= rs.getString(1) %>&&quiz_id=<%=quiz_id %>" class="btn btn-info" style="float: right;">Update Question</a>

<img src="test/<%=rs.getString(2) %>"  style="height: auto;width:100%;">
<b>Answer:</b>
<select class="form-control">
<option value="<%=rs.getString(3) %>"><%=rs.getString(3) %></option>
</select>

</div>
</div>
</div>
<br><br>
<%i++;} %>
</body>
</html>