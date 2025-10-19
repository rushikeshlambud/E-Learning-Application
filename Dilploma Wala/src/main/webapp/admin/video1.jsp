<%@page import="org.json.JSONArray"%>
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
        
        <%
        int kj=0;
        Connection con=DbConnect.con();
        String query="select distinct ";
        PreparedStatement ps=con.prepareStatement("SELECT distinct b.batch_name FROM batch_name as b inner join subject as s on b.subject_id=s.subject_id where s.standard='First Year'");
       ResultSet rs=ps.executeQuery();
        %>
        
        <div class="col-md-9 body-pannel">
        		<h3>Uploaded Notes</h3><hr style="background: green; height: 2px;">
        		
        		<h4>First Year Notes</h4>
			<div class="row">
			
			<%while(rs.next()){ 
				kj=0;
			%>
			<div class="col-md-4 ad-batches">
        		<div class="batch-sub">
        		<h1><%=rs.getString(1)%></h1>
        		<%JSONArray arr=Subjects.getsubjectbyClassName("First Year",rs.getString(1)); %>
        		
        		<%
        	
        		for(int i=0;i<arr.length();i++){
        			kj=1;
        		JSONObject obj=arr.getJSONObject(i);
        		if(!obj.getString("combine").equals("yes")){
        		%>
        		<a href="getvideoslist.jsp?xsb=<%=obj.getString("sub_Id")%>&cls=First Year&btc=<%=rs.getString(1)%>" style="color:white"><%=obj.getString("sub_Name")%></a>
        		<%}
        		}
        		if(kj==0)
        		{%>
        			<a href="uploadvideo.jsp"><i class="fa fa-plus"></i> Add Videos</a>
        		<%}
        		%>
        		</div>
        	</div>
        	<%} %>

     		</div>
  <hr style="background: green; height: 2px;">
     <h4>Second Year Notes</h4>
     <div class="row">
     <%
     ps=con.prepareStatement("SELECT distinct b.batch_name FROM batch_name as b inner join subject as s on b.subject_id=s.subject_id where s.standard='Second Year'");
     rs=ps.executeQuery();
    %>
			<%while(rs.next()){ 
				 kj=0;
			%>
			<div class="col-md-4 ad-batches">
        		<div class="batch-sub">
        		<h1><%=rs.getString(1)%></h1>
        		<%JSONArray arr=Subjects.getsubjectbyClassName("Second Year",rs.getString(1)); %>
        	
        		<%for(int i=0;i<arr.length();i++){
        			kj=1;
        		JSONObject obj=arr.getJSONObject(i);
        		if(!obj.getString("combine").equals("yes")){
        		%>
        		<a href="getvideoslist.jsp?xsb=<%=obj.getString("sub_Id")%>&cls=Second Year&btc=<%=rs.getString(1)%>" style="color:white"><%=obj.getString("sub_Name")%></a>
        		<%}
        		} if(kj==0)
        		{%>
        			<a href="uploadvideo.jsp"><i class="fa fa-plus"></i> Add Videos</a>
        		<%}
        		%>
        		</div>
        	</div>
        	<%} %>
     		</div>
     		<hr style="background: green; height: 2px;">
     		 <h4>Third Years </h4>
     <div class="row">
         <%
     ps=con.prepareStatement("SELECT distinct b.batch_name FROM batch_name as b inner join subject as s on b.subject_id=s.subject_id where s.standard='Third Year'");
     rs=ps.executeQuery();
     
     %>	<%while(rs.next()){
    	 kj=0;
    	 %>
			<div class="col-md-4 ad-batches">
        		<div class="batch-sub">
        		<h1><%=rs.getString(1)%></h1>
        		<%JSONArray arr=Subjects.getsubjectbyClassName("Third Year",rs.getString(1)); %>
        	
        		<%for(int i=0;i<arr.length();i++){
        			kj=1;
        		JSONObject obj=arr.getJSONObject(i);
        		if(!obj.getString("combine").equals("yes")){
        		%>
       <a href="rgetvideoslist.jsp?xsb=<%=obj.getString("sub_Id")%>&cls=Third Year&btc=<%=rs.getString(1)%>" style="color:white"><%=obj.getString("sub_Name")%></a>

        		<%}}if(kj==0)
        		{%>
    			<a href="uploadvideo.jsp"><i class="fa fa-plus"></i> Add Videos</a>
    		<%}
    		%>
        		</div>
        	</div>
        	<%} %>
     
    
			
        	
     		</div>
     		
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
        			<option value="First Year">First Year</option>
        			<option value="Second Year">Second Year</option>
        			<option value="Third Year">Third Year</option>
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