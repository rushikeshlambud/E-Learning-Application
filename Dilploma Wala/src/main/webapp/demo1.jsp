<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="BatchName.BatchName"%>
<%@page import="Batch.Batch"%>
<%@page import="Subjects.Subjects"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
 <div class="body-inner">
<jsp:include page="header.jsp"></jsp:include>


 <section id="page-title" class="text-light" data-parallax-image="Images/parallax/17.jpg">

<div class="container">
<div class="page-title">
                    <h1></h1>
                		<h3><%=Subjects.getsubjectsbyId(request.getParameter("xsb")).getString("sub_Name")%> Demo Videos</h3>
                </div>
            </div>
        </section>
     
         <section id="page-content">
    <div class="container"> 
      <!-- post content --> 
      <!-- Blog -->
      <div id="blog" class="grid-layout post-2-columns m-b-30 grid-loaded" data-item="post-item" >
       
          <%Connection con=DbConnect.con();
         	String batchname=Batch.getBatchNamebysubid(request.getParameter("xsb"));
         	String batchid=Batch.getBatch(request.getParameter("xsb"),batchname);
          %>
         
          <%String query="select * from demovideos  where v_standard=? and subject_id=? ";
          PreparedStatement ps=con.prepareStatement(query);
          ps.setString(1,request.getParameter("std"));
		  ps.setString(2,request.getParameter("xsb"));
		
		  ResultSet rs=ps.executeQuery();
		  int i=0;
		  while(rs.next()){
          i++;%>
        
         <div class="col-md-4 post-item border" >
          <div class="post-item-wrap"> 
          <div class="post-video">
          <div class="fluid-width-video-wrapper" style="padding-top: 67.1429%;">
          <%if(rs.getString(5).equals("youtube")){ %>
          <iframe src="https://www.youtube.com/embed/<%=rs.getString(3) %>" frameborder="0" allowfullscreen="" id="fitvid0"></iframe>
          <%}else if(rs.getString(5).equals("vimeo")){ %>
           <iframe src="https://player.vimeo.com/video/<%=rs.getString(3) %>" frameborder="0" allowfullscreen="" id="fitvid0"></iframe>
          <%} %>
          </div>
          <span class="post-meta-category">
          <a href="http://ariseacademynanded.com/demofor11th.php">Video</a>
          </span>
          </div>
          <div class="post-item-description">
          <strong> <i class="fas fa-calendar text-primary" style="float: right;"> <%=rs.getString(6) %></i></strong>
           <h5 style=""><%=rs.getString(2) %></h5>  			
 </div>
 </div>
 </div>
 
          <%}con.close();%>
          
          </div>
       
        
      </div>
      <!-- end: Blog --> 
      
      <!-- Pagination -->      
     
      <!-- end: Pagination --> 
      
    </section>
    
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>