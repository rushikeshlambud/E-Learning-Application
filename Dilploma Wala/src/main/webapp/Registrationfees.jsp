<%@page import="DbConnect.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<jsp:include page="head.jsp"></jsp:include>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="body-inner">
 
 <%if(session.getAttribute("user_id")==null)
 {
	 response.sendRedirect("login.jsp");
 }
	 %>
 
 <!-- SECTION FULLSCREEN -->
        <section id="page-title" class="text-light" data-parallax-image="Images/parallax/17.jpg">
<div class="container">
<div class="page-title">
                    <h1>Registration Fee</h1>
                </div>
             
            </div>
        </section>
        <!-- end: SECTION FULLSCREEN -->
<!-- Section -->
<section>
	<div class="container">
		<div class="row">
			<div class="col-lg-4 offset-sm-4">
				<div class="panel ">
                    <div class="panel-body"><h3>Course Fees </h3>
                    <p id="error" style="display: block;"></p>
                  
					<form method="POST" action="feespay"  id="feesmode" >
					<div class="form-group">
						<label class="sr-only">Mobile Number</label>
						<input type="text" placeholder="Minimum 6000 Rs." class="form-control" name="fees" id="fees" required="" autofocus="">
					</div>
						<input type="submit" value="Submit" name="submit" id="login_submit">	
				</form>
				</div></div>
				<!-- <p class="small">Don't have an account yet? <a href="register.jsp">Register New Account</a></p>
				 -->	
					
			</div>

		</div>
	</div>
</section>
<!-- end: Section -->
        <jsp:include page="footer.jsp"></jsp:include>
        <script type="text/javascript" src="js/validation.js">	
        </script>
</div>


<script type="text/javascript">
		$("#subject").click(function() {
			var fd = $(this).val();
			$.ajax({
				url : 'fetsch_sub_name.jsp',
				type : 'POST',
				// data: fd,
				data : $(this).serialize(),
				success : function(data) {
					$("#batch").html(data.trim());
					//window.location.reload();

				}
			});
		});
		
		$("#feesmode").submit(function()
				{
				if(Number($("#fees").val())>=9)
					{
					return true;
					}
				else{
					return false;
				}
				});

	/* 	$("#submit").click(function() {
			var stdnumber = $("#stdnumber").val();
			var password = $("#password").val();
			var confirmpassword = $("#confirmpassword").val();
			var prtnumber = $("#prtnumber").val();
			if (stdnumber.length != 10) {
				alert("Entre 10 digit mobile number");
				return false;
			} else if (password == "") {
				alert("Entre Password");
				return false;
			} else if (password != confirmpassword) {
				alert("Password and confirm password not matched");
				return false;
			} else if (prtnumber.length != 10) {
				alert("Entre 10 digit Parant mobile number");
				return false;
			} else {
				return true;
			}
		}); */
	</script>
</body>
</html>