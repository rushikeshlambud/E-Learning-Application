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
 
 
 <%
 JSONObject objsub=Subjects.getsubjectsbyId(session.getAttribute("subid").toString());
 String subject=objsub.getString("sub_Name"); %>

<div class="container">
<div class="page-title">
                    <h1><%=BatchName.getName(session.getAttribute("class").toString(), subject,objsub.getString("combine")) %> - <%=subject %>  <%=session.getAttribute("class").toString() %> Batch</h1>
                     <%if(!objsub.getString("combine").equals("yes")){ %> <h3><%=subject%> Videos</h3>
                <%} %>
                </div>
            </div>
        </section>
        <%if(!session.getAttribute("class").toString().equals("Repeater")) {%>
        <%if(!objsub.getString("combine").equals("yes")){ %>
         <section id="page-content">
    <div class="container"> 
      <!-- post content --> 
      <!-- Blog -->
      <div id="blog" class="grid-layout post-2-columns m-b-30 grid-loaded" data-item="post-item">
        
          <%Connection con=DbConnect.con(); %>
          <%String query="select * from videos  where v_standard=? and subject_id=? and batch_id=?  ";
          PreparedStatement ps=con.prepareStatement(query);
          ps.setString(1,session.getAttribute("class").toString());
		  ps.setString(2,session.getAttribute("subid").toString());
		  ps.setString(3,session.getAttribute("batchid").toString());
		  ResultSet rs=ps.executeQuery();
		  while(rs.next()){
          %>
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
          
          </div>
          <div class="post-item-description">
          <strong> <i class="fas fa-calendar text-primary" style="float: right;"> <%=rs.getString(6) %></i></strong>
           <h4 style=""><%=rs.getString(2) %></h4>
          			
 </div>
 </div>
 </div>
          <% } %>
          </div>
          </div>
   
      
      <!-- end: Blog --> 
      
      <!-- Pagination -->      
     
      <!-- end: Pagination --> 
      
    </section>
    <%}
   else{
   			
	   JSONArray combarr=Subjects.getcombinesubjects(session.getAttribute("subid").toString());
   %>
   		
   	
   		<section class="no-padding equalize" data-equalize-item=".text-box">
            <div class="row col-no-margin">
           
                <!--End: Box 1-->
                <!--Box 2-->
     <%for(int i=0;i<combarr.length();i++)
                {
             	JSONObject subobj=combarr.getJSONObject(i);
             	JSONObject obj=Subjects.getsubjectsbyId(subobj.getString("sub_Id"));
             	
             	
             	
          		%>
                 <div class="col-lg-6">
                    <div class="text-box hover-effect text-dark" >
                        <a href="myvideos.jsp?xsb=<%=obj.getString("sub_Id")%>"> <i class="	fas fa-play-circle"></i>
                            <h2><%=obj.getString("sub_Name")%></h2>
<!--                           <a href="demo1.jsp">	<button class="btn btn-dark btn-rounded">Physics</button></a> -->
<!--                 	  		<a href="demo1.jsp">   <button class="btn btn-dark btn-rounded">Chemistry</button></a> -->
                        </a>
                    </div>
                </div>
                <%
                } %>
                <!--End: Box 2-->
     
        
                <!--Box 4-->
              
                <!--End: Box 4-->
                
                
                  
                <!--Box 4-->
               
                <!--End: Box 4-->
            </div>
        </section>
   		 	
   <%}
    
    }else{
	   
    if(!objsub.getString("combine").equals("yes")){ %>
   <section class="no-padding equalize" data-equalize-item=".text-box">
            <div class="row col-no-margin">
            <div class="col-lg-6">
                    <div class="text-box hover-effect text-dark" >
                        <a href="repvideos.jsp?xtd=11th"> <i class="	fas fa-play-circle"></i>
                            <h2><%=objsub.getString("sub_Name")%></h2>
                             <h2>Track 1</h2>
                            <br>
                          <a href="repvideos.jsp?xtd=11th&sxj=<%=objsub.getString("sub_Id")%>">	<button class="btn btn-dark btn-rounded">Watch Videos</button></a>
                          </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="text-box hover-effect text-dark" >
                        <a href="repvideos.jsp?xtd=12th"> <i class="	fas fa-play-circle"></i>
                            <h2><%=objsub.getString("sub_Name")%></h2>
                             <h2>Track 2</h2>
                            <br>
                          <a href="repvideos.jsp?xtd=12th&sxj=<%=objsub.getString("sub_Id")%>">	<button class="btn btn-dark btn-rounded">Watch Videos</button></a>
                        </a>
                    </div>
                </div>
          
          </div>
          </section>
          
          
   
      
      <!-- end: Blog --> 
      
      <!-- Pagination -->      
     
      <!-- end: Pagination --> 
      
 
    <%}
   else{
   			
	   JSONArray combarr=Subjects.getcombinesubjects(session.getAttribute("subid").toString());
	   %>
	   		
	   	
	   	
   		
   	
   		<section class="no-padding equalize" data-equalize-item=".text-box">
            <div class="row col-no-margin">
           
                <!--End: Box 1-->
                <!--Box 2-->
                	
        
                 <div class="col-lg-6">
                    <div class="text-box hover-effect text-dark" >
                        <a > <i class="	fas fa-play-circle"></i>
                            <h2>Track 1</h2><br>
                            <%Connection con=DbConnect.con();
                            PreparedStatement ps=con.prepareStatement("select distinct subject_id from rep_videos where rep_id ='repeater' and std='11th';");
                           	ResultSet rs=ps.executeQuery();
                           	while(rs.next())
                           	{
                            %>
                             <a href="repvideos.jsp?xtd=11th&sxj=<%=rs.getString(1)%>">	<button class="btn btn-dark btn-rounded"><%=Subjects.getsubjectsbyId(rs.getString(1)).getString("sub_Name") %></button></a>
                             <%} %> 
                        
<!--                 	  		<a href="repvideos.jsp?xtd=12th&sxj=">   <button class="btn btn-dark btn-rounded">Track-2</button></a> -->
                        </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="text-box hover-effect text-dark" >
                        <a > <i class="	fas fa-play-circle"></i>
                            <h2>Track 2</h2><br>
                            <%
                            ps=con.prepareStatement("select distinct subject_id from rep_videos where rep_id ='repeater' and std='12th';");
                           	rs=ps.executeQuery();
                           	while(rs.next())
                           	{
                            %>
                             <a href="repvideos.jsp?xtd=12th&sxj=<%=rs.getString(1)%>">	<button class="btn btn-dark btn-rounded"><%=Subjects.getsubjectsbyId(rs.getString(1)).getString("sub_Name") %></button></a>
                             <%} %> 
                        
<!--                 	  		<a href="repvideos.jsp?xtd=12th&sxj=">   <button class="btn btn-dark btn-rounded">Track-2</button></a> -->
                        </a>
                    </div>
                </div>
              
                <!--End: Box 2-->
     
        
                <!--Box 4-->
              
                <!--End: Box 4-->
                
                
                  
                <!--Box 4-->
               
                <!--End: Box 4-->
            </div>
        </section>
        
        
        
   		 	
   <%  }
	   
	   
   }
    	%>
    
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
    <%} %>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>