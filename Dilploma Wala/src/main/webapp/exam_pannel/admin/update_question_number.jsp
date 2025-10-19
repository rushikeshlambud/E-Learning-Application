<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="DbConnect.DbConnect"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
<div class="row">
<div class="col-md-12">
<%
Connection con=DbConnect.con();

String question_id=request.getParameter("question_id");
 String sql="select *from question where id="+question_id;
 PreparedStatement ps=con.prepareStatement(sql);
 ResultSet rs=ps.executeQuery();
while(rs.next()){
%>
<form action="update_question_numberDB.jsp" enctype="multipart/form-data" method="post">
<b>Your Previous Image:</b>
<img src="test/<%=rs.getString(2) %>"  style="height:auto;width:100%;">
<b>Select Another Image</b>(optional)
<input type="file" name="image" class="form-control"><br>
<input type="hidden" name="id" value="<%=rs.getString(1) %>" class="form-control">
<input type="hidden" name="quiz_id" value="<%=rs.getString(4) %>" class="form-control"><br>
<b>Your Previous Answer:</b>
<select class="form-control">
<option value="<%=rs.getString(3) %>"><%=rs.getString(3) %></option>
</select><br><br>
<b>If Another Answer Then Select:</b>
<select  name="answer" class="form-control" required>
<option value="<%=rs.getString(3) %>"><%=rs.getString(3) %></option>

<option>A</option>
<option>B</option>
<option>C</option>
<option>D </option>
</select><br>

<input type="submit" value="Update" class="btn btn-info">
<%} %>
<br><br><br><br><br>
</div>
</div>
</div>
</body>
</html>