<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.Connection"%>
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
        <%
        Connection con=DbConnect.con();
        PreparedStatement ps=con.prepareStatement("select * from notes where notes_id=?");
        ps.setString(1,request.getParameter("ndt"));
        ResultSet rs=ps.executeQuery();
        if(rs.next()){
        %>
        <div class="col-md-9 body-pannel">
        		<h3>Update Notes</h3>
        		
        		
        		<form class="form-horizontal" action="updatenotesdb.jsp" method="post" enctype="multipart/form-data">
        			<div class="form-group">
<!--         			<label>Select Standard</label> -->
        			<input class=" input-large form-control bor getsub" type="hidden" name="std" value="<%=rs.getString(4)%>" required="">
        			<input class=" input-large form-control bor getsub" type="hidden" name="id" value="<%=request.getParameter("ndt")%>" required="">
        			</div>
        			<div class="form-group">

<!-- 						<label>Subject</label>  -->
						
						<input class=" input-large form-control bor getsub" type="hidden" name="sub" value="<%=rs.getString(5)%>" required="">
        			
					</div>
 					<div class="form-group">
<!--  						<label>Batch</label>   -->
 						<input class=" input-large form-control bor getsub" type="hidden" name="batch" value="<%=rs.getString(6	)%>" required="">
 						 
 					</div>
        			<div class="form-group">
        			<label>Title of File</label>
        				<input id="title" class="form-control bor" name="Title" placeholder="title" type="text" value="<%=rs.getString(2)%>"required="" autocomplete="off">
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
        <%}con.close(); %>
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