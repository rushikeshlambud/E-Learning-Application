
<%@page import="DbConnect.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
<!--<jsp:include page="header.jsp"></jsp:include>-->
<div class="container">
<div class="row">

<div class="col-md-6 col-md-offset-3" style="border: 2px solid;text-align: center;padding: 10px;margin-bottom: 5%;margin-top: 5%;">

<!-- Quiz Detail for addition marks -->
<%
Connection con=DbConnect.con();
String negetive_marking="";
int wrong_anss=0;
String quiz_id=request.getParameter("quiz_id");
String user_id=session.getAttribute("user_id").toString();
int mark_correct_ans=0;
String sql2="select * from quiz_detail where id=?";
PreparedStatement ps2=con.prepareStatement(sql2);
ps2.setString(1, quiz_id);
ResultSet rs2=ps2.executeQuery();
while(rs2.next()){
	mark_correct_ans=rs2.getInt(4);
	negetive_marking=rs2.getString(10);
	wrong_anss=rs2.getInt(5);
%>
<%-- <%=mark_correct_ans %> --%>

<%} %>

<%
int correct_ans=0;
int Not_Attempt=0;
int Wrong_ans=0;
int i=0;
int total_marks=0;
String sql1="select ans.*,ques.* from answerkey as ans inner join question as ques on ans.question_id=ques.id where ans.user_id=? and ans.quiz_id=?";
PreparedStatement ps1=con.prepareStatement(sql1);
ps1.setString(1, user_id);
ps1.setString(2, quiz_id);
ResultSet rs1=ps1.executeQuery();
while(rs1.next()){	
%>

<%if(rs1.getString(4).equals(rs1.getString(8))){ %>

<%correct_ans++;}else if(rs1.getString(4).equals("Not Attempt")){ %>

<%Not_Attempt++;}else if(!rs1.getString(4).equals(rs1.getString(8))){ %>

<%Wrong_ans++;

} %>
<%
if(negetive_marking.equals("Yes")){
	total_marks=(correct_ans * mark_correct_ans)-(Wrong_ans * wrong_anss);
}else{
	total_marks=correct_ans * mark_correct_ans;
}
%>


<%i++;} %>

<h4 style="color:black;">Total Question: <%=i %></h4>
<h4 style="color:green;">Correct Answer: <%=correct_ans %></h4>
<h4 style="color:red;">Not Attempt: <%=Not_Attempt %></h4>
<h4 style="color:red;">Wrong Answer: <%=Wrong_ans %></h4>
<h4 style="color:blue;">Total Marks: <%=total_marks %></h4>
</div>

</div>
<div class="col-md-12">
<%

String sql="select ans.*,ques.* from answerkey as ans inner join question as ques on ans.question_id=ques.id where ans.user_id=? and ans.quiz_id=?";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, user_id);
ps.setString(2, quiz_id);
ResultSet rs=ps.executeQuery();
while(rs.next()){
%>



<%if(rs.getString(4).equals(rs.getString(8))){ %>
<div style="border: 3px solid green;padding: 20px;">

<img src="admin/test/<%=rs.getString(7) %>" style="width: 100%;height: auto;">

<div class="alert alert-success" style="width: 30%;">
Your Answer: <b><%=rs.getString(4) %></b>
<span style="float: right;font-size: 18px;color:green;">&#10004;</span>
</div>
<div class="alert alert-success" style="width: 30%">
Correct Answer: <b><%=rs.getString(8) %></b><span style="float: right;font-size: 18px;color:green;">&#10004;</span></div>

</div>

<%} else{ %>
<div style="border: 1px solid red;padding: 20px;">
<img src="admin/test/<%=rs.getString(7) %>" style="width: 100%;height: auto;">

<div class="alert alert-danger" style="width: 30%;">Your Answer: <b><%=rs.getString(4) %></b><span style="float: right;font-size: 18px;color: red;">&#10006;</span></div>
<div class="alert alert-success" style="width: 30%;">Correct Answer: <b><%=rs.getString(8) %></b><span style="float: right;font-size: 18px;color:green;">&#10004;</span></div>

</div>
<%} %>
<br><br>
<%}con.close(); %>


</div>
</div>

</body>
</html>