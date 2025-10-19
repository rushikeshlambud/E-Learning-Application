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
<style>
	.ani
	{
		font-size: 20px;
		margin-right: 10px;
		animation: zoom 1s ease-in-out infinite;
	}

	@keyframes zoom
	{
		0%{transform: rotate(20deg);}
		25%{transform: rotate(0deg);}
		50%{transform: rotate(-20deg);}
		100%{transform: rotate(0deg);}	
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="body-inner">
 <section id="page-title" class="text-light" data-parallax-image="Images/parallax/17.jpg">
<div class="container">
<div class="page-title">
                    <h1>Student Registration</h1>
                </div>
             
            </div>
        </section>
        <!-- end: Page title -->
        
        <section>
	<div class="container">
		<div class="row">

			 
<div class="col-lg-6">
                        <h4 class="text-center">Arise Academy Registration Process</h4>
                        <hr style="background-color: black;height: 2px;">
                       	<div style="padding-left:20px;">
                       
                       				<!-- <p style="color:red">Note : You can choose any online platform to make Payment.(Google Pay, Phone pe, Internet Banking etc)</p> -->
                       				
                       				<!-- <div style="border:2px solid black;padding:5px 10px;">
									   <h5>Bank Details</h5>
									<p><h5>Bank Name</h5> Unioin Bank Of India.</p>
                       				<p><b>Account Name :</b> ARISEN ACADEMY PRIVATE LTD.</p>
                       				<p><b>Account Number :</b>597201010050948</p>
                       				<p><b>IFSC No :</b> UBIN0559725</p>
                       				
                       				<p style="padding:12px 16px;background-color:#f86d4a; color:white;"> <i class="fas fa-exclamation-circle ani"></i>After Payment Process take a screenshot of Payment Transaction Id and Upload this screenshot on Registration form is necessary . </p>
                  					</div> -->
                       				<!-- <div style="border:2px solid black;padding:5px 10px;">
									   <h5>Bank Details</h5>
									<p><h5>Bank Name</h5> CENTRAL BANK OF INDIA</p>
                       				<p><b>Account Name :</b> ARISEN ACADEMY PRIVATE LTD LATUR.</p>
                       				<p><b>Account Number :</b>3876002851</p>
                       				<p><b>IFSC No :</b> CBIN0284929</p>
                       				 -->
                  					
                       	<h5>Step 1: Enter Your Full Name. eg :- Surname - First Name - Father Name </h5>
                       		<h5>Step 2: Select Class. (11th or  12th or Repeater)</h5>
                       			<h5>Step 3: Select Subject.</h5>
                       			<p>Here You can Select One Subject at a Time ( physics or Chemistry ). <br>If u want Join both Subject Select Combine(Physics and Chemistry) Option</p>
                       				<h5>Step 4: Select Batch Option. </h5>
                       				<h5>Step 5: Enter your contact Number. </h5>
                       				<h5>Step 6: Enter password. </h5>
                       				<h5>Step 7: Enter your Mail ID. </h5>
                       				<h5>Step 8: Enter your Address Details. </h5>
                       				<h5>Step 9: Enter Your Parents Contact Number. </h5>
                       				<h5>Step 10: Select Gender. </h5>
									 <h5>Step 11: Enter Paid Registration Amount.(Minimum 6000 Rs.) </h5>	
									 <h5>Step 12: Click on Submit Button</h5>

									 <h5>Step 13: Make Online Payment To Arise Academy </h5>
									 <p style="padding:12px 16px;background-color:#f86d4a; color:white;"> <i class="fas fa-exclamation-circle ani"></i>After Payment Process take a screenshot of Payment Transaction.</p>

<!-- 									   
                  					<h5>Step 13 : Enter Transaction  Number </h5>
                  					<h5>Step 14 : Upload Transaction Screenshot in (jpg or Png format). </h5> -->
                  				<h4 style="color:green">After Registration Process ! Your Account will verify !Then it will Activate soon!</h4>
                  				<p><b>  For Any Queries ?, Contact with Us</b> </p>
                  				<p><i class="fas fa-phone-alt"></i><a href="tel:8263970081"> 8080548904</a>
                  				<!-- <p><i class="fas fa-phone-alt"></i><a href="tel:8378975780"> 8378975780</a>	 -->
									<img src="Images/img/v3.png" class="img-fluid">
                        </div>
                        </div>
			<div class="col-lg-6 center " style="border:1px solid black;padding:10px 25px;">
						<h4 class="text-center">Arise Academy Registration Form</h4>
                         <form method="post" action=registerDb.jsp id="regform" enctype="multipart/form-data" >
					
					<div class="form-group">
						<label for="studentname"> Name:</label> <input type="text"
							class="form-control" name="studentname" id="studentname"
							required="required" maxlength="80" value="">

					</div>x
					
					<div class="form-group ">
						<label for="inputState">class :</label> <select id="class"
							name="class" class="form-control getsub">
							<option value="0">Select a Std</option>
        			<option value="First Year">First Year</option>
        			<option value="Second Year">Second Year</option>
        			<option value="Third Year">Third Year</option>
        			

						</select>
					</div>
				
					<div class="form-group ">
						<label for="inputSubject">Subject :</label> <select id="subject"
							name="subject_id" class="form-control sub">

							
							<option value="0">Select Subject</option>
							

						</select>
					</div>
					<div class="form-group ">
						<label for="inputBatch">Batch :</label> <select id="batch"
							name="batch_id" class="form-control batch">

						</select>
					</div>
					<div class="form-group">
						<label for="stdnumber">Student Mobile Number:</label> <input
							type="tel"  pattern="[0-9]{10}" class="form-control checknum" name="stdnumber"
							id="stdnumber" required="required" maxlength="10" value="" onblur="phonenumber()" >
					</div>


					<div class="form-group">
						<label for="password">Password:</label> <input type="password"
							class="form-control" name="password" id="password"
							required="required" maxlength="80">
					</div>
					<div class="form-group">
						<label for="pwd">Confirm Password:</label> <input type="password"
							class="form-control checknum" name="confirmpassword" id="confirmpassword"
							required="required" maxlength="80">
					</div>

					<div class="form-group">
						<label for="surname">Email:</label> <input type="email"
							class="form-control" name="email" id="email" required="required"
							maxlength="80" value="">
					</div>
					<div class="form-group">
						<label for="address">Address:</label> <input type="text"
							class="form-control" name="address" id="address"
							required="required" maxlength="80" value="">
					</div>

					<div class="form-group">
						<label for="surname">Parents Number:</label> <input 
							class="form-control" name="prtnumber" id="prtnumber"
							required="required" type="tel"  pattern="[0-9]{10}" maxlength="10" value=""  onblur="phonenumberr()" autocomplete="off">
					</div>


					<div class="form-group ">
						<label for="inputState">Gender</label> <select id="gender"
							name="gender" class="form-control">

							<option>Male</option>
							<option>Female</option>

						</select>
					</div>

					<div class="form-group">
						<label for="ramount">Registration Amount : </label> <input
							type="number" class="form-control" name="ramount"
							id="Registration" required="required" maxlength="80"
							value="" placehoder="Minimum 6000 Rs">
					</div>
					<!-- <div class="form-group">
						<label for="ramount">Transaction Id:  </label> <input
							type="text" class="form-control" name="transactid"
							id="Registration Amount" required="required" maxlength="80"
							value="" placehoder="Minimum 6000 Rs">
					</div>
					<div class="form-group">
						<label for="ramount">Upload Screenshot : </label> <input
							type="file" class="form-control" name="file"
							id="Registration Amount" required="required" maxlength="80"
							value="" placehoder="Minimum 6000 Rs">
					</div> -->

					<button type="submit" name="btnsignup" id="submit"
						class="btn btn-info">Submit</button>

				</form>
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
		
		

		$('.getsub').change(function(){
			
			if($(this).val()!=0)
			{
			
			$.ajax({
			url:'getsubjects.jsp',
			data:'std='+$(this).val(),
			type:'post',
			success:function(r)
			{
				$('.sub').html(r);
			}
			});
			}
		});
		
	$('.sub').change(function(){
			
		
			if($(this).val()!=0)
			{
			$.ajax({
			url:'getbatch.jsp',
			data:'sub='+$(this).val(),
			type:'post',
			success:function(r)
			{
				$('.batch').html(r);
			}
			});
			}
		});
	
		$('#regform').click(function(){
		
		if($(".sub").val()==0)
			{
				$('.sub').css("border","solid 1px red");
				event.preventDefault();
			}
			else{
				$('.sub').css("border","solid 1px gray");
			}
	});

	$("#Registration").blur(function(){
		if(Number($(this).val())>=6000)
		{
			$('#Registration').css("border","solid 1px gray");
			$(this).next().remove("span");
		}
		else{
			$('#Registration').css("border","solid 1px red");
			$(this).next().remove("span");
			$("<span style='color:red;'>Minimum Fees Amount must be greater than or equal to 6000 Rs.</span>").insertAfter(this);

		}
	});


	$("#regform").submit(function(){

		if(Number($("#Registration").val())>=6000)
		{
			return true;
		}
		else{
			$('#Registration').css("border","solid 1px gray");
			event.preventDefault();
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