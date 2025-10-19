<%@page import="DbConnect.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%
String exam_name=request.getParameter("exam_name");
String total_question=request.getParameter("total_question");
String right_ques_mark=request.getParameter("right_ques_mark");
String wrong_ques_mark=request.getParameter("wrong_ques_mark");
String hours=request.getParameter("hours");
String minute=request.getParameter("minute");
String exam_date=request.getParameter("exam_date");
String standard=request.getParameter("standard");
String negative_marking=request.getParameter("negative_marking");
String subject=request.getParameter("subject");
String batch=request.getParameter("batch");
Connection con=DbConnect.con();
String sql="insert into quiz_detail(exam_name, total_question, right_ans_mark, wrong_ans_mark, hours,minute, date, std,negative_marking,exam_status,subject,batch)values(?,?,?,?,?,?,?,?,?,'Deactive',?,?)";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, exam_name);
ps.setString(2, total_question);
ps.setString(3, right_ques_mark);
ps.setString(4, wrong_ques_mark);
ps.setString(5, hours);
ps.setString(6, minute);
ps.setString(7, exam_date);
ps.setString(8, standard);
ps.setString(9, negative_marking);
ps.setString(10, subject);
ps.setString(11, batch);
int done=ps.executeUpdate();
if(done>0){
	%>
	<script>
	alert("Quiz Added Successfully!!");
	location.href="quize_detail_view.jsp";
	</script>
<%}else{
%>
<script>
	alert("Fail Try Again!!");
	location.href="quize_detail.jsp";
	</script>
	<%}%>

