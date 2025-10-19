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

<%if(session.getAttribute("User")!=null){ %>
 <section id="page-title" class="text-light" data-parallax-image="Images/parallax/17.jpg">
 <%JSONObject objsub=Subjects.getsubjectsbyId(session.getAttribute("subid").toString());
 String subject=objsub.getString("sub_Name"); %> 
<div class="container">
<div class="page-title">
                    <h1><%=BatchName.getName(session.getAttribute("class").toString(), subject,objsub.getString("combine")) %> - <%=session.getAttribute("class").toString() %> Batch</h1>
                		<h3><%=Subjects.getsubjectsbyId(request.getParameter("xsb")).getString("sub_Name")%> Videos</h3>
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
         
          <%String query="select * from videos  where v_standard=? and subject_id=? and batch_id=?   ";
          PreparedStatement ps=con.prepareStatement(query);
          ps.setString(1,session.getAttribute("class").toString());
		  ps.setString(2,request.getParameter("xsb"));
		  ps.setString(3,batchid);
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
          <!-- <span class="post-meta-category">
        <a href="http://ariseacademynanded.com/demofor11th.php">Video</a> 
          </span> -->
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
    <%}else{ %>
     <section id="page-content">
            <div class="container">
                <div class="row">
                    <div class="content col-lg-12 mx-auto">

                  
                        <div class="text-center">
                            <h2 class="text-medium">Log in Now</h2>
                            <p class="lead m-b-40">For More Information Connect with us</p>

                            <button type="button" class="btn btn-dark btn-lg"><a href="login.jsp">Log in</a></button>
                            
                        </div>

                        
               
                </div>
            </div>
        </section>
    <%}%>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>