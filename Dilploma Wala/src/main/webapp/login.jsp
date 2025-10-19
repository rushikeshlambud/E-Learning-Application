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
 
 
 
 <!-- SECTION FULLSCREEN -->
        <section id="page-title" class="text-light" data-parallax-image="Images/parallax/17.jpg">
<div class="container">
<div class="page-title">
                    <h1>Login</h1>
                </div>
             
            </div>
        </section>
        <!-- end: SECTION FULLSCREEN -->
<!-- Section -->
<section>
	<div class="container">
		<div class="row">
			



			<div class="col-lg-4 offset-sm-1">
				<div class="panel ">
                    <div class="panel-body"><h3>Batch-2 Login</h3>
                    <p id="error" style="display: block;"></p>
                  
					<form method="POST" action="logcheck.jsp" role="form" >
					<div class="form-group">
						<label class="sr-only">Mobile Number</label>
						<input type="text" placeholder="Mobile Number" class="form-control" name="mob" id="user_name" required="" autofocus="">
					</div>
					<div class="form-group m-b-5">
						<label class="sr-only">Password</label>
						<input type="password" placeholder="Password" class="form-control" name="password" id="password1" required=""> 
						
					</div>
					<div class="form-group form-inline m-b-10 ">
						
						<div class="form-check">
							<label>
								<input type="checkbox"><small class="m-l-10"> Remember me</small>
							</label>
						</div>
					</div>
						<input type="submit" value="Submit" name="submit" id="login_submit">
					
				</form>
				</div></div><p class="small">Don't have an account yet? <a href="register.jsp">Register New Account</a></p>
					
					
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