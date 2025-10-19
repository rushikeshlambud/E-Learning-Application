
<%@page import="DbConnect.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
	<%@page import="JSONpack.wrong_ans"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<style type="text/css">
.mt-left{
padding-left: 20px;
}
#for_numrows {
			padding: 10px;
			float: left;
		}
		#for_filter_by {
			padding: 10px;
			float: right;
		}
		#pagesControllers {
			display: block;
			text-align: center;
		}
</style>
<jsp:include page="head.jsp"></jsp:include>
</head>
<body style="background: gray;">
<!--<jsp:include page="header.jsp"></jsp:include>-->
<div class="container"> 

<br>
 <p class="lead">
<!--  <button id="json" class="btn btn-primary">TO JSON</button>  -->
 <button id="csv" class="btn btn-info">TO CSV</button> 
<!--   <button id="pdf" class="btn btn-danger">TO PDF</button></p> -->
<br><br>
<div class="row">
<div class="col-md-12" style="background: white;padding: 10px;">

<!-- Quiz Detail for addition marks -->
<%
Connection con=DbConnect.con();
String quiz_id=request.getParameter("quiz_id");
int mark_correct_ans=0;
String sql2="select *from quiz_detail where id=?";
PreparedStatement ps2=con.prepareStatement(sql2);
ps2.setString(1, quiz_id);
ResultSet rs2=ps2.executeQuery();
while(rs2.next()){
	mark_correct_ans=rs2.getInt(4);
%>
 <br> <br>
<span class="mt-left">Subject : <b><%=rs2.getString(2) %></b></span>
<span class="mt-left">Total Question : <b><%=rs2.getString(3) %></b></span> 
<span class="mt-left">Right Answer Mark : <b><%=rs2.getString(4) %></b> </span>
<span class="mt-left">Wrong Answer mark :  <b><%=rs2.getString(5) %></b> </span>
<span class="mt-left">Negative Marking :  <b><%=rs2.getString(10) %></b>  </span>
<%} %>
<!--End  Quiz Detail for addition marks -->
<br><br>

<!-- Start Exam Result Fetching not Attempted -->
<table id="example" class="table table-striped tablemanager" id="example">
 <thead>
<tr>
<th>Sr.No</th>
<th>Contact Number</th>
<th>Student Name</th>
<th>Mark</th>
</tr>
</thead>
 <tbody>	
<tr class="demo">
<%
int not_attempt=0;
String sql1="select count(ans.user_id),ans.user_id from answerkey as ans inner join question as ques on ans.question_id=ques.id inner join register as ud on ans.user_id=ud.student_id inner join quiz_detail as qd on ans.quiz_id=qd.id where ques.quiz_id=? and not ans.answer=ques.answer and not ans.answer='Not Attempt' group by ans.user_id";
PreparedStatement ps1=con.prepareStatement(sql1);
ps1.setString(1, quiz_id);
ResultSet rs1=ps1.executeQuery();
while(rs1.next()){
	not_attempt=rs1.getInt(1);
%>
Not Attempt : <%=not_attempt%>
<% } %>
<!-- End Exam Result Fetching not Attempted -->


<!-- Start Result Display -->

<%
int correct_ans=0;
String sql="select count(ans.user_id),ans.user_id,qd.negative_marking,qd.right_ans_mark,qd.wrong_ans_mark,ud.stdnumber,ud.studentname,ud.student_id from answerkey as ans inner join question as ques on ans.question_id=ques.id inner join register as ud on ans.user_id=ud.student_id inner join quiz_detail as qd on ans.quiz_id=qd.id where ques.quiz_id=? and ans.answer=ques.answer group by ans.user_id,ans.quiz_id";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, quiz_id);
ResultSet rs=ps.executeQuery();
int i=1;
while(rs.next()){
%>
<td><%=i %></td>
<td class="number"><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<%if(rs.getString(3).equals("Yes")){ %>
<td><%=(Integer.parseInt(rs.getString(1)) * Integer.parseInt(rs.getString(4))-(wrong_ans.getCount(quiz_id,rs.getString(8)) * Integer.parseInt(rs.getString(5))))%></td>

<%}else{ %>
<td><%=(Integer.parseInt(rs.getString(1))*Integer.parseInt(rs.getString(4)))%></td>
<%} %>
</tr>
<%i++;} %>
</tbody>
</table>
<!-- End Result Display -->



</div>
</div>
</div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="js/tableManager.js"></script>
<script type="text/javascript">
		// basic usage
		$('.tablemanager').tablemanager({
			firstSort: [[3,0],[2,0],[1,'asc']],
			disable: ["first","last"],
			appendFilterby: true,
			dateFormat: [[4,"mm-dd-yyyy"]],
			debug: true,
			vocabulary: {
    voc_filter_by: 'Filter By',
    voc_type_here_filter: 'Filter...',
    voc_show_rows: 'Rows Per Page'
  },
			pagination: true,
			showrows: [10,20,50,100],
			disableFilterBy: [1]
		});
		// $('.tablemanager').tablemanager();
		
	</script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.5/jspdf.plugin.autotable.min.js"></script>   
   <script src="js/tableHTMLExport.js"></script>
   <script>
  $('#json').on('click',function(){
    $("#example").tableHTMLExport({type:'json',filename:'sample.json'});
  })
  $('#csv').on('click',function(){
    $("#example").tableHTMLExport({type:'csv',filename:'sample.csv'});
  })
  $('#pdf').on('click',function(){
    $("#example").tableHTMLExport({type:'pdf',filename:'sample.pdf'});
  })
  
   var xx,obj;
  var array=[];
  var xxx=$('tr');
 xxx.each(function(){
	 {
		  var x4={
			  Contact_Number:$(this).find("td").eq("1").text(),
			  Name:$(this).find("td").eq("2").text(),
			  Mark:$(this).find("td").eq("3").text(),
		  }
		 array.push(x4);
	 }  
 });
 console.log(array);
array.sort(function(a,b){return a[1] - b[1]});
array.reverse();
console.log(array);

$('tbody').html("");
for(var j=1;j<array.length;j++)
{
	
	$('tbody').append("<tr><td>"+j+"</td><td>"+array[j-1].Contact_Number+"</td><td>"+array[j-1].Name+"</td><td>"+array[j-1].Mark+"</td></tr>");
}



  </script>
   
</body>
</html>