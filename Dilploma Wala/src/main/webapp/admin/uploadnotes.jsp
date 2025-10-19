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
        		<h3>Upload Notes</h3>
        		
        		
        		<form class="form-horizontal" action="uploadnotesdb.jsp" method="post" enctype="multipart/form-data">
        			<div class="form-group">
        			<label>Select Standard</label>
        			<select class="combobox input-large form-control bor getsub" name="std" required="">
        			<option value="0">Select a Std</option>
        			<option value="First Year">First Year</option>
        			<option value="Second Year">Second Year</option>
        			<option value="Third Year">Third Year</option>

        			</select>
        			</div>
        			<div class="form-group">

						<label>Subject</label> 
						
						<select class="combobox input-large form-control bor sub" name="sub" required="">
        				<option value="">Select a Subject</option>
        				
        			</select>
					</div>
 					<div class="form-group">
 						<label>Batch</label>  
 						<select class="combobox input-large form-control bor batch" name="batch" required="">
 						<option value="0">Select Batch</option>
 						</select> 
 					</div>
        			<div class="form-group">
        			<label>Title of File</label>
        				<input id="title" class="form-control bor" name="Title" placeholder="title" type="text" value="" required="" autocomplete="off">
        			</div>
        			
        			
        			<div class="form-group">
        			<label>Choose File</label>
        				<input id="file" class="form-control-file bor" name="file" placeholder="embeded id" type="file" value="" required="" autocomplete="off">
        			</div>
        		
        			
        			<div class="form-group">
        			<button class="btn btn-success upload-db" type="submit">Submit</button>
        			</div>
        		</form>
        </div>
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