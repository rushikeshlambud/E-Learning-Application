<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DbConnect.DbConnect"%>
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
    
    
   <%  Connection con=DbConnect.con();
String q="select * from notifications where id=? ";
PreparedStatement ps=con.prepareStatement(q);
ps.setString(1,request.getParameter("wde"));
ResultSet rs=ps.executeQuery();
if(rs.next()){
%>    
<form method="post" id="notForm" role="" action="updatenotificationdb.jsp" >
  
    <div class="form-group"><label for="date">
    Date :
     <br><input id="date" name="Date" placeholder="date" class="form-control" type="date" value="<%=rs.getString(4) %>" required=""></label></div>
    
    <div class="form-group">
    <input name="id" type="hidden" value="<%=request.getParameter("wde")%>">
    <label for="title">Title :<input type="text" name="Title" class="form-control" id="title" value="<%=rs.getString(2) %>" required=""></label></div>
    
    <div class="form-group"><label for="notification">Notification Data :<textarea id="notification" name="Data" class="form-control" rows="10" cols="30" required="" autocomplete="off" spellcheck="false"><%=rs.getString(3) %></textarea></label></div>
    
    <input type="submit" name="submit" class="btn btn-success" value="Submit">
    </form>
    
<%}con.close(); %>
    
    
    
    </div>
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