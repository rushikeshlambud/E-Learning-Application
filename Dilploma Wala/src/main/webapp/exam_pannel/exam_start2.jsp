<%@page import="DbConnect.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<jsp:include page="head.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css"> 
<style>

 @media screen and (max-width:900px) and (orientation:portrait){
        html{
            transform : rotate(-90deg);
            transform-origin:left top;
            width:100%;
            position:absolute;
            top:100%;
            left:0;
        }
          #student_name{
          margin-bottom: -20px;
        }
        #subject_name{
          margin-top: -70px;
        }
       #quiz_id{
          margin-left: 13px;border-radius: 25px 25px 25px 25px;margin-top: 5%;float: left;
    } 
    #mark{
	      border-radius: 25px 25px 25px 25px;background:  #9068c1;margin-top:5%;margin-left: 10px;
      }
      .sub_exam{
       border-radius: 25px 25px 25px 25px;background:  #9068c1;margin-top: 5%;float: right;
      }
    }
   
</style>
</head>
<body style="">
<jsp:include page="header.jsp"></jsp:include>
	
<div class="container-fluid">
<div class="row">
<div class="top">
<div class="col-md-12">
<div class="row">
<div class="col-md-2 col-sm-2">
<img alt="logo.png" src="logo/logo.png" class="imgg" style="">
</div>
<%
String quiz_id=request.getParameter("quez_id");
sql="select *from quiz_detail where id=?";
 ps=con.prepareStatement(sql);
 ps.setString(1, quiz_id);
 rs=ps.executeQuery();
 while(rs.next()){
%>

<div class="col-md-3 col-sm-4">
<p id="student_name">Name : <%=session.getAttribute("User") %></p>
<p id="subject_name"style="">Test : <span style="color:red;"><%=rs.getString(2) %></span></p>

</div>
<div class="col-md-3 col-sm-2">
<br><br>	
<%-- <span id="marks" style="">Question : <%=rs.getString(3)%></span><br> --%>
<span id="marks" style="">Mark : <span style="color:red;"><%=(Integer.parseInt(rs.getString(3))*Integer.parseInt(rs.getString(4)))%></span></span> 
</div>

<div class="col-md-3 col-sm-3">

<div class="counter" id="counter">
<span style="margin-left: 19px;">Time : <span class="hours"><%=rs.getString(6) %></span> : <span class="minutes"><%=rs.getString(7) %></span> : <span class="second">0</span></span>
</div>
</div> 
<%} %>
</div>
</div>
</div>
</div>
</div>
<br><br><br><br>
<p style="font-size:30px;cursor:pointer;width:25%;" class="openNav" onclick="openNav()">&#9776; open</p>

<div class="container-fluid">

<div class="row">


<form method="post" action="database.jsp">
<%-- <div class="col-sm-8" style="width:68%;background: #e4edf7;margin-top:2%;;height: 38px;position:absolute;">
<button style="padding: 6px;background-color:red;color:white;letter-spacing: 2px;"><%=request.getParameter("exam_name") %></button>
</div> --%>

<%
//String quiz_id=request.getParameter("quez_id");
sql="select *from question where quiz_id=?";
 ps=con.prepareStatement(sql);
 ps.setString(1, quiz_id);
 rs=ps.executeQuery();
int i=1;
int count=0;
while(rs.next()){
	count++;
%>
<div class="col-md-8 hide<%=i%>" id="chal<%=i%>">
<input type="hidden" name="user_id" id="user_id" value="<%=session.getAttribute("id") %>">
<input type="hidden" name="question_id<%=i%>" id="qquestion_id<%=i %>" value="<%=rs.getString(1) %>">
<input type="hidden" name="quiz_id" id="qquiz_id" value="<%=quiz_id %>">
<br><br>
<div id="question_pannel">
<div class="active" id="question_pannel_child" style="">
 &nbsp;<b style="color:red;">Question <%=i%></b> <img src="admin/test/<%=rs.getString(2) %>" class="ques_img" id="image<%=i%>" style="height: auto;width:100%;">
</div>
<div class="container">
<div class="row">
<br>      
<div class="col-md-2 col-sm-2" style=""> 
<b style="font-size: 18px;">Options : </b>
</div>

<div id="radio<%=i %>">

<div class="col-md-1 col-sm-1 radio-inline" style=""> 
<input type="radio" class="ok<%=i %>" value="A" id="option<%=i %>" name="answer<%=i %>">&nbsp;&nbsp; <b>A</b><br><br>
<span></span>
</div>
<div class="col-md-1 col-sm-1 radio-inline">
<input type="radio" class="ok<%=i %>" value="B" id="option<%=i %>" name="answer<%=i %>">&nbsp;&nbsp; <b>B</b><br><br>
<span></span>
</div>
<div class="col-md-1 col-sm-1 radio-inline" style="">
<input type="radio" class="ok<%=i %>" value="C" id="option<%=i %>" name="answer<%=i %>">&nbsp;&nbsp; <b>C</b><br><br>
<span></span>
</div>

<div class="col-md-1 col-sm-1 radio-inline">
<input type="radio" class="ok<%=i %>" value="D" id="option<%=i %>" name="answer<%=i %>">&nbsp;&nbsp; <b>D</b><br><br>
<span></span>
</div>
</div>

</div>
</div>
</div>
</div>

<%i++;} %>


<input type="hidden" value="<%=count %>" id="count">
<br>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
<div class="col-md-4" style="background-attachment: fixed;background-position: right top;">
	
<div class="ques" style="background: #dcdada;border-radious:15px;">
<h4 style="text-align: center;">Question Palette</h4>

<%-- <b style="text-align: center;">Time Left:<%=request.getParameter("time") %></b> --%>
<br>
<input type="hidden" id="time" value="<%=request.getParameter("time") %>">
<hr style="border-color:white;width: 100%;">

<div class="ques1" style="height: 300px;overflow: scroll;">
<br>

<%
String quiz_id1=request.getParameter("quez_id");
 sql="select *from question where quiz_id=?";
 ps=con.prepareStatement(sql);
 ps.setString(1, quiz_id1);
 rs=ps.executeQuery();
int i1=1;
while(rs.next()){
%>

<div class="col-md-2 col-sm-1">

<div id="legend1" class="legend<%=i1 %> tt" style="border-radius: 50px 50px;border-color: white;background-color: red;"><%=i1 %></div>

 
<br><br>
</div>

<script type="text/javascript">

 var myObj;

if(<%=i1 %>==1){
myObj = {
		
		"qa" : [ {
			"question_id" :<%=i1 %>,
			"answer" : "Not Attempt"
		} ]

	};
}else{
	myObj.qa.push({"question_id" : <%=i1 %>,"answer" : "Not Attempt"});
}

localStorage.setItem('myDataKey', JSON.stringify(myObj.qa));


</script>


<%i1++;} %>
<script type="text/javascript">

</script>
</div>


<b>Legend:</b><br><br>
<div class="row">

<div class="col-md-6 col-sm-3">
<span style="color:black;">
<div id="legend" style="border-color: white;background: red;"></div>
Not Visited
</span> 
<br><br>
</div>
<div class="col-md-6 col-sm-3">
<span style="color:black;">
<div id="legend" style="border-color: black;background: white;"></div>
Not Answered
</span>
<br><br>
</div>
<div class="col-md-6 col-sm-3">
<span style="color:black;">
<div id="legend" style="border-color: white;background: #9068c1;"></div>
Bookmark
</span>
</div>
<div class="col-md-6 col-sm-3">
<span style="color:black;">
<div id="legend" style="border-color: white;background: green;"></div>
Answered
</span>

</div>
</div>
<br><br>
<button type="button" class="btn btn-success form-control" onclick="submit_data()">Submit Exam</button>
</div>
</div>
</div>

<div class="col-md-7 all_button" style="">
<br>
<div type="button" id="back" type="button" class="btn btn-success"> << Back </div>&nbsp;&nbsp;&nbsp;&nbsp;
<div id="next" type="button" class="btn btn-success nextt"> Next >> </div>

<div id="clear" type="button" class="btn btn-success clear">Clear Answer </div>

<div type="button" id="quiz_id" class="btn btn-success next"> Save & Next</div>
<div type="button" id="mark" class="btn btn-primary mark"> Bookmark</div>
<button type="button" class="btn btn-success sub_exam" onclick="submit_data()">Submit Exam</button>
</div>
<br><br>
</form>
</div>
</div>







<script type="text/javascript">
$(function() {
	  function getCounterData(obj) {
	  
	    var hours = parseInt($('.hours', obj).text());
	    var minutes = parseInt($('.minutes', obj).text());
	    var seconds = parseInt($('.second', obj).text());
	    return seconds + (minutes * 60) + (hours * 3600);
	  }

	  function setCounterData(s, obj) {
	   
	    var hours = Math.floor((s % (60 * 60 * 24)) / (3600));
	    var minutes = Math.floor((s % (60 * 60)) / 60);
	    var seconds = Math.floor(s % 60);

	    /* console.log( hours, minutes, seconds); */

	   
	    $('.hours', obj).html(hours);
	    $('.minutes', obj).html(minutes);
	    $('.second', obj).html(seconds);
	  }

	  var count = getCounterData($(".counter"));

	  var timer = setInterval(function() {
	    count--;
	    if (count == 0) {
	      clearInterval(timer);
	      //submit_dataa();
	      return;
	    }
	   
		var minutes1=Number($(".minutes").text());
		/* if(minutes1<="10"){
			$("#counter").css({"color":"red"});
		} */
		
	    setCounterData(count, $(".counter"));
	  }, 1000);
	});
	

</script>

<script type="text/javascript" src="assets/js/exam.js"></script>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}



/* document.addEventListener("keypress", function(e) {
	  if (e.keyCode === 13) {
	    toggleFullScreen();
	  }
	}, false); 

function disableF5(e) { if ((e.which || e.keyCode) == 116 || (e.which || e.keyCode) == 82) e.preventDefault(); };

$(document).ready(function(){
     $(document).on("keydown", disableF5);
}); */
window.addEventListener("load", function() { window.scrollTo(0, 1); });

</script>


</body>
</html>