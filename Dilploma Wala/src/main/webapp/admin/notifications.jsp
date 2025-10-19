<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="Subjects.Subjects"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container-fluid ">
<div class="row " style="min-height:600px;">
	<div class="col-md-2">
        <!-- sidebar menu -->
     	<jsp:include page="leftsidebar.jsp"></jsp:include> 
        </div>
        <div class="col-md-9 body-pannel">
        		<!-- page content -->
        			<h3>Add Notifications</h3>
        		
    <div class="" role="main" id="" style="min-height: 657px;">
    <form method="post" id="notForm" role="" action="notificationdb.jsp" >
  
    <div class="form-group"><label for="date">
    Date<input id="date" name="Date" placeholder="date" class="form-control" type="date" value="" required=""></label></div>
    
    <div class="form-group"><label for="title">Title :<input type="text" name="Title" class="form-control" id="title" value="" required=""></label></div>
    
    <div class="form-group"><label for="notification">Notification Data :<textarea id="notification" name="Data" class="form-control" rows="10" cols="30" required="" autocomplete="off" spellcheck="false"></textarea></label></div>
    
    <input type="submit" name="submit" class="btn btn-success" value="Submit">
    </form></div>
    <!-- /page content -->
        		
        </div>
        <!-- /sidebar menu -->

      </div>
      <jsp:include page="footer.jsp"></jsp:include>
      <script>
	
	$('.getsub').change(function(){
		
		if($(this).val()!=0)
		{
		$.ajax({
		url:'getsubject1.jsp',
		data:'std='+$(this).val(),
		type:'post',
		success:function(r)
		{
			$('.sub').html(r);
		}
		});
		}
	});
	
$('.sub').change(function(){
		
		if($(this).val()!=0)
		{
		$.ajax({
		url:'getbatch.jsp',
		data:'sub='+$(this).val(),
		type:'post',
		success:function(r)
		{
			$('.batch').html(r);
		}
		});
		}
	});
	</script>
</body>
</html>