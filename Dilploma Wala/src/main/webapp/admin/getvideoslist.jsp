<%@page import="Batch.Batch"%>
<%@page import="org.json.JSONObject"%>
<%@page import="Subjects.Subjects"%>
<%@page import="javax.security.auth.Subject"%>
<%@page import="DbConnect.Query"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
        		<h3><%=Subjects.getsubjectsbyId(request.getParameter("xsb")).getString("sub_Name")%> Videos (<%=request.getParameter("cls") %>  <%=Batch.getBatchbyId(Batch.getBatchIdbyname(request.getParameter("xsb"), request.getParameter("btc")).getString("batch_id")).getString("batch_Name") %>)</h3><hr>
       <table class="table table-bordered">
       			<thead class="bg-white">
       				<tr><th>Sr.no</th><th>Video Name</th><th>Class</th><th>Batch Details</th><th>Platform</th><th>Embed Id</th><th>Date</th><th>Time</th><th>Operations</th></tr>
       			</thead>
       			<tbody>
       			<%
       			JSONObject obj1=Batch.getBatchIdbyname(request.getParameter("xsb"), request.getParameter("btc"));
       			Connection con=DbConnect.con();
       			PreparedStatement ps=con.prepareStatement("select * from videos where v_standard=? and subject_id=? and batch_id=?;");
       			ps.setString(1,request.getParameter("cls"));
       			ps.setString(2,request.getParameter("xsb"));
       			ps.setString(3,obj1.getString("batch_id"));
       			ResultSet rs=ps.executeQuery();
       			int i=0;
       			while(rs.next()){i++;%>
       			<tr class="bg-white t<%=i%>">
       				<td class="sr"><%=i %></td>
       				<td><%=rs.getString(2) %></td>
       				<td><%=rs.getString(4) %></td>
       				<td><% JSONObject obj= Subjects.getsubjectsbyId(rs.getString(8)); %>
       				<label>Subject Name : <%if(obj.length()!=0){%><%=obj.getString("sub_Name") %><%} %></label>
					<%  obj= Batch.getBatchbyId(rs.getString(9));%>
					<br>
       				<label> <%if(obj.length()!=0){%><%=obj.getString("batch_Name") %><%} %></label>
       				</td>
       				<td><%=rs.getString(5) %></td>
       				<td><%=rs.getString(3) %></td>
       				
       				<td><p><%=rs.getString(6) %></p></td><td>
       				<p><label>Time :</label><%=rs.getString(7) %></p></td>
       				<td>
       					<button title="view" class="btn btn-primary"><span class="fa fa-eye vview"></span></button>
       					<button title="Update" class="btn btn-success" onclick="updatevideo(<%=rs.getString(1)%>,<%=i%>)"><span class="fa fa-edit"></span></button>
       					<button title="Delete" class="btn btn-danger" onclick="delete_video(<%=rs.getString(1)%>,<%=i%>)"><span class="fa fa-trash"></span></button></td>
       			</tr>
       			<%}con.close(); %>
       			</tbody>
       </table>
       </div>
        </div>
        <!-- /sidebar menu -->

      </div>
      
      <div class="video-pop-up">
		<div class="video-update-content">
		<span class="vclose">X</span>
		<h3>Update Video Details</h3>
		
			<form class="form-horizontal" id="form">
        			<div class="form-group">
        			<label>Video Title</label>
        				<input id="title" class="form-control bor" name="videoTitle" placeholder="title" type="text" value="" required="" autocomplete="off">
        			</div>
        			
        			
        			<div class="form-group">
        			<label>Embed Id</label>
        				<input id="title" class="form-control bor" name="embedid" placeholder="embeded id" type="text" value="" required="" autocomplete="off">
        			</div>
        			
        			
        				<div class="form-group">
        			<label>Uploading Date</label>
        				<input id="title" class="form-control bor" name="videoDate" placeholder="uploading Date" type="date" value="" required="" autocomplete="off">
        			</div>
        			
        			<div class="form-group">
        			<label>Select Video Platfrom</label>
        			<select class="combobox input-large form-control bor" name="platform" required="">
        			<option value="" selected="selected">Select a platform</option>
        			<option value="youtube">Youtube</option><option value="vimeo">Vimeo</option>
        			</select> 
        			</div>
        			
        			<div class="form-group hidden">
        			<label>Select Standard</label>
        			<select class="combobox input-large form-control bor" name="std" required="">
        			<option value="">Select a Std</option>
        			<option value="11th">11th</option>
        			<option value="12th">12th</option>
        			<option value="Repeater">Repeater</option>
        			</select>
        			<input name="vid" type="hidden" value="">
        			</div>
        			
        			<div class="form-group hidden">

						<label>Subject</label> 
						
						<select class="combobox input-large form-control bor sub" name="sub" required="">
        				<option value="">Select a Subject</option>
        				
        			</select>
					</div>
					<div class="form-group hidden">
						<label>Batch</label> 
						<select class="combobox input-large form-control bor batch" name="batch" required="">
						<option value="0">Select Batch</option>
						</select>
					</div>
        			
        			
        			
        			<div class="form-group">
        			<button class="btn btn-success" onclick="update_evideo()" type="button">Submit</button>
        			</div>
        		</form>
	
		</div>
	</div>

<div class="view-video">
<span class="video-close ">x</span>
<iframe class="video-link" src="" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>      
      <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>