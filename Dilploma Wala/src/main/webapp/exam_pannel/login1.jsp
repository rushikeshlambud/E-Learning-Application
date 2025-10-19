<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>User Login</title>
<style type="text/css">
.col-md-6{
padding: 25px;
margin-bottom: 20%;
}
 </style>
</head>
<body>

<div class="banner jarallax">

<div class="agileinfo-banner">
				<div class="container">
					<h2></h2>
				</div>
			</div>
</div>
<div class="container">
<div class="row">
<div class="col-md-6 col-md-offset-3 col-sm-12">
<form action="logincheckDB.jsp" method="post" id="login">
<h1>Login</h1>
<div class="form-group">
<label for="email">Email</label>
<input type="email" name="email" id="email" class="form-control" required>
</div>

<div class="form-group">
<label for="password">Password</label>
<input type="password" name="password" id="password" class="form-control" required>
</div>
<input type="submit" class="form-control btn btn-success"><br><br>
<button type="button" id="btn" class="btn btn-info">New User?</button>
</form>


<form action="registerDB.jsp" method="post" id="reg">
<h1>Register</h1>

<div class="form-group">
<label for="name">Name</label>
<input type="text" name="name" id="name" class="form-control">
</div>

<div class="form-group">
<label for="mobile">Mobile</label>
<input type="number" name="mobile" id="mobile" class="form-control">
</div>

<div class="form-group">
<label for="address">Address</label>
<textarea rows="2" cols="3" name="address" id="address" class="form-control"></textarea>
</div>

<div class="form-group">
<label for="address">Select Class</label>
<select name="class" class="form-control">
<option>11th</option>
<option>12th</option>
<option>Repeater</option>
</select>
</div>


<div class="form-group">
<label for="email1">Email</label>
<input type="email" name="email" id="email1" class="form-control">
</div>

<div class="form-group">
<label for="password1">Password</label>
<input type="password" name="password" id="password1" class="form-control">
</div>

<div class="form-group">
<label for="cpassword">Re-enter Password</label>
<input type="password" name="cpassword" id="cpassword" class="form-control">
</div>
<input type="submit" id="submit" class="form-control btn btn-success">
<br><br>
<button type="button" id="btn1" class="btn btn-info">Already user? Login Here</button>
</form>
</div>

</div>
</div>
	

<script type="text/javascript">
$("#reg").hide();
$("#btn").click(function(){
	$("#reg").slideDown("slow");
	$("#login").slideUp("slow");
});
$("#btn1").click(function(){
	$("#reg").slideUp("slow");
	$("#login").slideDown("slow");
});
</script>


<script type="text/javascript">
$("#submit").click(function(){
	var name=$("#name").val();
	var mobile=$("#mobile").val();
	var address=$("#address").val();
	var email1=$("#email1").val();
	var password1=$("#password1").val();
	var cpassword=$("#cpassword").val();
	if(name==""){
		alert("Enter Name");
		return false;
	}else if(mobile.length!=10){
		alert("Enter 10 digit mobile number");
		return false;
	}else if(address==""){
		alert("Enter Address");
		return false;
	}else if(email1==""){
		alert("Enter Email");
		return false;
	}else if(password1.length<=5){
		alert("6 charecter or greter of password");
		return false;
	}else if(cpassword!=password1){
		alert("password and Re-enter password not match");
		return false;
	}else{
		return true;
	}
});
</script>

</body>
</html>