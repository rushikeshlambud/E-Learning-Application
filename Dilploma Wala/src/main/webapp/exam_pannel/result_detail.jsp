<%@page import="DbConnect.DbConnect"%>
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
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
<div class="row">
<table class="table table-bordered">
<tr>
<th>Exam Name</th>
<th>Questions</th>
<th>Mark(Per Ques)</th>
<th>Wrong Answer(Per Ques)</th>
<th>Class</th>
<th>Exam Date</th>
<th>View Result</th>
</tr>
<tr>
<%
int a=0;
Connection con=DbConnect.con();
String sql="select q.* from answerkey as ans inner join question as ques on ans.question_id=ques.id inner join quiz_detail as q on ques.quiz_id=q.id where ans.user_id='1' and ques.quiz_id='1' group by q.id";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
int i=1;
while(rs.next()){
    
%>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %> Question</td>
<td><%=rs.getString(4) %> Mark</td>
<td><%=rs.getString(5) %> Mark</td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(7) %></td>
<td><a href="result.jsp?quiz_id=<%=rs.getString(1) %>" class="btn btn-info btn-sm">View Result</a></td>
</tr>
<%i++;}con.close(); %>
</table>


</div>
</div>
</body>
</html>