<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<jsp:include page="head.jsp"></jsp:include>
<style type="text/css">


</style>

<script>
     //window.onbeforeunload = function() { return "Your work will be lost."; };
       //window.history.forward(); 
        //function noBack() { 
         //   window.history.forward(); 
       // } 
</script>

</head>
<body style="background: gray;">
<!--<jsp:include page="header.jsp"></jsp:include>-->
<div class="container">
<div class="row">
<div class="col-md-12">
<h2 style="text-align: center;color:white;">Instruction</h2>
<table class="table table-striped" style="background: white;">

<tr>
<th style="padding: 15px;">
1. The examination will comprise of Objective type Multiple Choice Questions (MCQs).
</th>
</tr>

<tr>
<th style="padding: 15px;">
2. The total number of questions, duration of examination, will be different based on
the course.
</th>
</tr>
<tr>
<th style="padding: 15px;">
3. The Subjects or topics covered in the exam will be as per the Syllabus.
</th>
</tr>
<tr>
<th style="padding: 15px;">
<%
String wrong=request.getParameter("wrong");
%>
<p id="wrong"></p>
<script>
	var wrong=window.atob("<%=wrong%>");
	if(wrong=="No"){
		$("#wrong").html("4. There will be <span style='color:blue'>NO NEGATIVE MARKING</span> for the wrong answers.");
	}else{
		$("#wrong").html("4. There will be <span style='color:red'>NEGATIVE MARKING</span> for the wrong answers.");
	}
</script>

</th>
</tr>
<tr>
<th style="padding: 15px;">
5. On computer screen every student will be given objective type type Multiple Choice
Questions (MCQs).
</th>
</tr>
<tr>
<th style="padding: 15px;">
6. The students just need to click on the Right Choice / Correct option from the
multiple choices /options given with each question. For Multiple Choice Questions,
each question has four options, and the candidate has to click the appropriate
option.
</th>
</tr>

<tr>
<th style="padding: 15px;">7. You can see the history of test taken and scores in the Your Dashboard.</th>	
</tr>

<tr>
<th style="padding: 15px;">8. If you get some error, you can contact us via this form</th>
</tr>

<tr>
<th>
<div class="col-md-5"></div>
<div class="col-md-2">
<%
String quez_id=request.getParameter("quez_id");
%>
<a href="#" id="st" class="form-control btn btn-success">Start Exam</a>

</div>
</th>
</tr>

</table>
</div>
</div>
</div>
<script>
$("#st").click(function(){
	var q=window.atob("<%=quez_id%>");
	//alert(q);
	location.href="exam_start.jsp?quez_id="+q;
	//self.close();
//window.open('exam_start.jsp?quez_id='+q,'name','width=1000,height=800');
});
</script>

</body>
</html>