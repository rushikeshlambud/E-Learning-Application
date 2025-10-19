<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%
String exam_name=request.getParameter("exam_name");
String total_question=request.getParameter("total_question");
String right_ques_mark=request.getParameter("right_ques_mark");
String wrong_ques_mark=request.getParameter("wrong_ques_mark");
String time=request.getParameter("time");
String exam_date=request.getParameter("exam_date");
String standard=request.getParameter("standard");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_pannel","root","root");
String sql="insert into quiz_detail(exam_name, total_question, right_ans_mark, wrong_ans_mark, time, date, std)values(?,?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, exam_name);
ps.setString(2, total_question);
ps.setString(3, right_ques_mark);
ps.setString(4, wrong_ques_mark);
ps.setString(5, time);
ps.setString(6, exam_date);
ps.setString(7, standard);
int done=ps.executeUpdate();
if(done>0){
	%>
	<script>
	alert("Quiz Added Successfully!!");
	location.href="quize_detail.jsp";
	</script>
<%}else{
%>
<script>
	alert("Fail Try Again!!");
	location.href="quize_detail.jsp";
	</script>
	<%}%>

