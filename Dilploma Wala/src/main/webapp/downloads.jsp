<%@page import="Batch.Batch"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="Subjects.Subjects"%>
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
                    <h1>Downloads</h1>
                </div>
             
            </div>
        </section>
        <!-- end: Page Content -->

                 <!-- Content -->
          <% 
          try{
          if(session.getAttribute("User")!=null){ 
          
        	  if(!session.getAttribute("profile").equals("paid"))
        	  {
        		  response.sendRedirect("Activation.jsp");
        	  }
          
          %>
          
         <%String subject=Subjects.getsubjectsbyId(session.getAttribute("subid").toString()).getString("sub_Name");%>
            <section id="page-content">
            <div class="container">
            <div class="row">
           
           <%String combine= Subjects.getsubjectsbyId(session.getAttribute("subid").toString()).getString("combine");%>
            <%if(combine.equals("no")){ %>
           <div class="col-md-6"></div>
            <div class="col-md-6">
             <h3><i class="fas fa-file-alt"></i> <%=subject%> Notes</h3>
                <!-- post content -->
                <table class="table table-bordered table-hover">
                	<thead>
                			<tr><th>Sr.No</th><th>Name</th><th>Download</th></tr>               			
                	</thead>
                	<tbody>
                		<%Connection con=DbConnect.con();
                		String sql="select * from notes where standard=? and subject=? and batch=?";
                		  PreparedStatement ps=con.prepareStatement(sql);
                		  ps.setString(1,session.getAttribute("class").toString());
                		  ps.setString(2,session.getAttribute("subid").toString());
                		  ps.setString(3,session.getAttribute("batchid").toString());
                		  ResultSet rs=ps.executeQuery();
                		  int i=0;
                		  while(rs.next())
                		  {i++;%>
                			<tr><td><%=i %></td><th><%=rs.getString(2)%></th><td><a href="notes/<%=rs.getString(3)%>" download><i class="fa fa-download"></i>download</a></td></tr>      
                          <% }
                          con.close();
                		%>
                	</tbody>
                </table>
            </div>
            </div>
            <%}else{ %>
             <%
             JSONArray combarr=Subjects.getcombinesubjects(session.getAttribute("subid").toString());
             for(int i=0;i<combarr.length();i++)
                {
             	JSONObject subobj=combarr.getJSONObject(i);
             	JSONObject obj=Subjects.getsubjectsbyId(subobj.getString("sub_Id"));
          		%>
                 <div class="col-lg-6">
                  <h4><i class="fas fa-file-alt"></i> <%=obj.getString("sub_Name")%> Notes</h4>
                   <table class="table table-bordred ">
                   	<thead>
                   		<tr><th>Sr.No</th><th colspan="2">Documents File</th></tr>
                   	</thead>
                   	<tbody>
                   		
                   		<%
                   		String batchname=Batch.getBatchNamebysubid(obj.getString("sub_Id"));
                     	String batchid=Batch.getBatch(obj.getString("sub_Id"),batchname);
                   		Connection con=DbConnect.con(); 
                   		PreparedStatement ps=con.prepareStatement("select * from notes where standard=? and subject=? and  batch=?");
                   		ps.setString(1,session.getAttribute("class").toString());
                   		ps.setString(2,obj.getString("sub_Id"));
                   		ps.setString(3,batchid );
                   		ResultSet rs=ps.executeQuery();
                   		int j=0;
                   		while(rs.next())
                   		{j++;%>
                   		<tr><td><%=j++ %></td>
                   		
                   		<th><%=rs.getString(2)%></th><td><a href="notes/<%=rs.getString(3)%>" download><i class="fa fa-download"></i>download</a></td></tr> 
                   		</tr>
                           <%}con.close();
                           if(j==0){%>
                   		<tr><td colspan="3"><h4>No Files Available</h4></td></tr>
                   		<%} %>
                   	</tbody>
                   </table>
                </div>
                <%
                } %>
                 <%} %>
            </div>
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
        <%}}catch(Exception e){
            %>
            <section id="page-content">
                <div class="container">
                    <div class="row">
                        <div class="content col-lg-12 mx-auto">
    
                      
                            <div class="text-center">
                                <h2 class="text-medium">Login as student Account</h2>
                                <p class="lead m-b-40">For More Information Connect with us</p>
    
                                <button type="button" class="btn btn-dark btn-lg"><a href="login.jsp">Log in</a></button>
                                
                            </div>
    
                            
                   
                    </div>
                </div>
            </section>
        <%} %>
        <!-- end: Content -->

        <!-- Text Boxes -->
       
        <!-- end: Text Boxes --

 <!--end: Inspiro Slider -->
     
<!--          <div class="heading-text heading-section text-center"> -->
<!--                     <h2>An Innovative & Integrated Approach</h2> -->
                    
<!--                 </div> -->

                


       


    

<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>