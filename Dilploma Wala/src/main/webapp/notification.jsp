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
  <section class="parallax text-light halfscreen" data-parallax-image="images/parallax/17.jpg" style="height: 438px;"><div class="parallax-container img-loaded" data-velocity="-.090" style="background: url(&quot;images/parallax/17.jpg&quot;) 0px;"></div>
            <div class="container">
                <div class="container-fullscreen">

                    <div class="text-middle text-center text-right">
                        <h1 class="text-uppercase text-medium animated fadeInDown visible" data-animate="fadeInDown" data-animate-delay="100">Notifications</h1>
                        
                    </div>

                </div>
            </div>
        </section>
        <!-- end: SECTION FULLSCREEN -->
  
        <!-- Content -->
        <section id="page-content">
            <div class="container">
            <div class="row">
            	<%Connection con=DbConnect.con();
            	PreparedStatement ps=con.prepareStatement(" SELECT * FROM notifications order by id desc");
            	ResultSet rs=ps.executeQuery();
            	while(rs.next()){%>
            	<div class="col-md-4">
                <div id="blog" class="grid-layout post-3-columns m-b-30 grid-loaded" data-item="post-item" style="margin: 0px -20px -20px 0px; position: relative; height: 262px;">
                <div class="post-item border" style="padding: 0px 20px 20px 0px; position: absolute; left: 0px; top: 0px;">
                <div class="post-item-wrap"><div class="post-item-description">
                <span class="post-meta-date"><i class="fa fa-calendar-o"></i><%=rs.getString(4)%></span>
                <h2><a href="http://ariseacademynanded.com/notification.php?batch=old#"><%=rs.getString(2) %></a></h2>
                <p><%=rs.getString(3) %></p>
                </div>
                </div>
                </div>
                </div>
                </div>
                <%}con.close(); %>
                </div>
                </div>
               
         
        </section>

<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>