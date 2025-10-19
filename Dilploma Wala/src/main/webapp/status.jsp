<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import=" java.net.URLEncoder"%>
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
 <script src="https://smtpjs.com/v3/smtp.js"></script>
 <script>window.history.forward();</script>
</head>
<body>
 <div class="body-inner">
<jsp:include page="header.jsp"></jsp:include>

<!-- Page Content -->
        <section id="page-content">
            <div class="container">
                <div class="row">
                    <div class="content col-lg-12 mx-auto">

                        <div class="text-center" style="box-shadow:0px 0px 5px 2px gray">
                        	<img src="Images/logo/logo.png" height="100px;">
                         <h4 class="text-small" style="font-size: 24px;">Registration is successful !</h4>
                            <h5 style="font-size:25px;">Your Account Will Activate Soon !</h5>
                            <p class="lead m-b-40">For More Information Contact :<br> 
                            <a class="fas fa-phone-alt " href="tel:8263970081"> 8263970081</a>
                            &nbsp;&nbsp;
                       <!--   <a class="fas fa-phone-alt" href="tel:8379075790"> 8379075790</a>
                        -->     </p>
                            
                            <button type="button" class="btn btn-dark btn-lg"><a href="login.jsp">Thank You !</a></button>
                            
                        </div>
                </div>
            </div>
        </section>
        <!-- end: Page Content -->
                        <div class="line"></div>

<jsp:include page="footer.jsp"></jsp:include>
<script>

setInterval(myTimer,3000);
function myTimer()
{
    location.href="login.jsp";
}
</script>
</div>
</body>
</html>