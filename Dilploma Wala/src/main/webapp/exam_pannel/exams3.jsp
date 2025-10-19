<%-- <%@page import="org.json.JSONString"%>
<%@page import="org.json.JSONStringer"%>
<%@page import="jd.ss"%>
 --%>

<%@page import="JSONpack.checkExam"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="JSONpack.JsonExample1"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.*" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Exams Page</title>
<style>
.rotet{
	margin-top:5%;
   margin-bottom:5%;
}

@media(max-width:900px) and (orientation:portrait){
.rotet{
            transform : rotate(-90deg);
            width:100%;
            //position:absolute;
			margin-top:130%;
			margin-bottom:55%;
}
}
</style>
<script>
     //window.onbeforeunload = function() { return "Your work will be lost."; };
       //window.history.forward(); 
        //function noBack() { 
        //    window.history.forward(); 
        //} 
		

</script>
<jsp:include page="head1.jsp"></jsp:include>
</head>
<body>
<%
try{
if(session.getAttribute("user_id")==null){
%>
<script type="text/javascript">
location.href="../login.jsp";
</script>
<%}else{
%>
<jsp:include page="header1.jsp"></jsp:include>
<div class="container rotet" style="">
<div class="row">
<div class="col-xs-12 col-sm-12  col-md-12 col-lg-12">
<table class="table table-bordered table-striped">
<tr class="info">
<th>Sr.No</th>
<th>Exam Name</th>
<th>Total Question</th>
<th>Right Answer</th>
<th>Wrong Answer</th>
<th>Total Mark</th>
<th>Time</th>
<th>Exam date</th>
<th>Standard</th>
</tr>
<tr>

<%
Connection con=DbConnect.con();
String user_idd="";
String quiz_id="";
String user_id=session.getAttribute("user_id").toString();
try{
String sql1="select user_id,quiz_id from answerkey group by quiz_id";
PreparedStatement ps1=con.prepareStatement(sql1);
ResultSet rs1=ps1.executeQuery();
while(rs1.next()){
	user_idd=rs1.getString(1);
	quiz_id=rs1.getString(2);
%>

<%}}catch(Exception e){e.printStackTrace();} %>

<%
try{
String class1=session.getAttribute("class").toString();
String subid=session.getAttribute("subid").toString();
String batchid=session.getAttribute("batchid").toString();
String sql="select *from quiz_detail where std=? and subject=? and batch=? and exam_status='Active' order by id desc";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, class1);
ps.setString(2, subid);
ps.setString(3, batchid);
ResultSet rs=ps.executeQuery();
int i=1;
while(rs.next()){
%>
<td><%=i %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td>+ <%=rs.getString(4) %></td>
<%if(rs.getString(10).equals("Yes")) {%>
<td style="color:red;" id="wrong">- <%=rs.getString(5) %></td>
<%}else{ %>
<td style="color:blue;" id="wrong">No Negative</td>
<%}%>
<td><%=(Integer.parseInt(rs.getString(3))*Integer.parseInt(rs.getString(4)))%></td>
<td><%=rs.getString(6) %> : <%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(9) %></td>

<%-- <%if(user_idd.equals(session.getAttribute("id").toString()) && quiz_id.equals(rs.getString(1))){ %> --%>
<%if(checkExam.examStatus(user_id, rs.getString(1))){ %>
<td><a href="result.jsp?quiz_id=<%=rs.getString(1) %>" class="btn btn-primary btn-sm" id="">View Result</a></td>
<%}else{ %>
<td><a href="#" class="btn btn-info btn-sm" id="goFS" onclick="quiz_id(<%= rs.getString(1) %>,'<%= rs.getString(10) %>')">Start Exam</a></td>

<%-- <script>
$("#goFS").click(function(){
	var wrong=$("#wrong").text();
	location.href="instruction.jsp?quez_id="+window.btoa(<%= rs.getString(1) %>)+"&wrong="+window.btoa(wrong);
});
</script> --%>
<%} %>
</tr>
<%i++;}}catch(Exception e){e.printStackTrace();} %>
</table></div>



</div>
</div>
<%}}catch(Exception e){e.printStackTrace();} %>

<jsp:include page="footer.jsp"></jsp:include>
<script>
 function quiz_id(x,i){
	var wrong=i;
	location.href="instruction.jsp?quez_id="+window.btoa(x)+"&wrong="+window.btoa(wrong);
 }
</script>



</body>
</html>