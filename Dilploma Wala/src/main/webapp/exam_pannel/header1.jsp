<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>
</head>
<body  class="breakpoint-xl">
 <!-- Header -->
        <header id="header">
            <div class="header-inner">
                <div class="container">
                    <!--Logo-->
                    <div id="logo">
                        <a href="../index.jsp" class="logo" data-src-dark="../images/logo-dark.png">
                            <img src="../Images/logo/logo.png" alt="Arise Academy"  style="height: 70px;">
                        </a>
                    </div>
                    <!--End: Logo-->

                 


                    <!--Navigation Resposnive Trigger-->
                    <div id="mainMenu-trigger">
                        <button class="lines-button x"> <span class="lines"></span> </button>
                    </div>
                    <!--end: Navigation Resposnive Trigger-->

                    <!--Navigation-->
                    <div id="mainMenu" class="light">
                        <div class="container">
                            <nav>
                                <ul>

                                    
                                    <li><a href="../index.jsp">HOME</a></li>
<!--                                      <li><a href="about.jsp">ABOUT US</a></li> -->
                                      <li><a href="../courses.jsp">COURSES</a></li>
<!--                                        <li><a href="feesstructure.jsp">Fees Structure</a></li> -->
<!--                                         <li class=""> <a href="../feesstructure.jsp">Fees Structure</a>
 --><!--                                         <ul class="dropdown-menu"> -->
<!--                                         <li><a href="feesstructure.jsp">Fees Structure</a></li> -->
<!--                                           		<li> -->
                                          		
<!--                                           		<a href="scholarship.jsp">Arise Scholarship</a></li> -->
<!--                                         </ul> -->
                                    </li>
                                       <li><a href="../videos.jsp">VIDEOS</a></li>

                                       <li class="dropdown"> <a href="#">STUDENT CORNER</a>
                                        <ul class="dropdown-menu">
                                          
                                             <li><a href="../downloads.jsp">DOWNLOADS</a></li>
                                             <!--  <li><a href="#">NOTES</a></li> -->
                                           <!-- <li><a href="../demo.jsp">DEMO</a></li> -->
                                        <!-- <li><a href="../videos.jsp">VIDEOS</a></li> -->
                                         
<!--                                                <li><a href="#">TESTIMONIALS</a></li> -->
<!--                                                 <li><a href="#">ENTREANCE EXAM</a></li> -->
                                           
                                           
                                           
                                           
                                        </ul>
                                    </li>
                                    <li class="dropdown"> <a href="#">ONLINE TEST</a>
                                        <ul class="dropdown-menu">
                                          
                                            
                                             <!--  <li><a href="#">NOTES</a></li> -->
                                           <!-- <li><a href="../demo.jsp">DEMO</a></li> -->
                                        <!-- <li><a href="../videos.jsp">VIDEOS</a></li> -->
                                          <%if(session.getAttribute("User")==null){ %>
                                            <li><a href="login.jsp">Online Test</a></li>
                                            <%}else{%>
                                                <li><a href="../exam_pannel/exams.jsp">Online Test</a></li>
                                                <%}%>
<!--                                                <li><a href="#">TESTIMONIALS</a></li> -->
<!--                                                 <li><a href="#">ENTREANCE EXAM</a></li> -->
                                           
                                           
                                           
                                           
                                        </ul>
                                    </li>
                                        <!-- <li><a href="../exam_pannel/exams.jsp">Online Test</a></li> -->
                                        
                                        <li><a href="../notification.jsp">NOTIFICATIONS</a></li>
                                        <li><a href="../contact.jsp">CONTACT</a></li>
                                        
                                        <%if(session.getAttribute("User")==null){ %>
                                        <li><a href="../login.jsp">LOGIN</a></li>
                                        <%}else{if(session.getAttribute("User").toString().equals("admin")){
                                        	%>
                                        <li class="dropdown"> <a href="../admin/index.jsp">Admin<i class="fa fa-user"></i></a>
                                        <%}else{ %>
                                        <li class="dropdown"> <a href="#">Account<i class="fa fa-user"></i></a>
                                        <%} %> <ul class="dropdown-menu">
                                          		<li><a><%=session.getAttribute("User") %></a></li>
                                             <li><a href="../logout.jsp">Logout</a></li>
                                        
                                        </ul>
                                    </li>
                                       
                                        <%} %>
                                       
                                  
                                    
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <!--end: Navigation-->
                </div>
            </div>
        </header>
        <!-- end: Header -->

</body>
</html>