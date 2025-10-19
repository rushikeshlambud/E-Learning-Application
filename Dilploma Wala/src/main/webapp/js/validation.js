 function sname()
 {
        	
        	var studentname=$("#studentname").val();
        	var text="";
        	if(studentname==""){
        		text="Please Enter Your Name";
        		$("#text1").html(text);
        		$("#studentname").css({'border-color':'red'});
        		$("#text1").css({'color':'red'});
        		return false;
        	}else{
        		
        		$('#studentname').keypress(function (e) {
        			
        		    var regex = new RegExp("^[a-zA-Z ]+$");
        		    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
        		    if (regex.test(str)) {
        		        return true;
        		    }
        		    else
        		    {
        		    e.preventDefault();
        		    text="Please Enter Only Character..";
            		$("#text1").html(text);
            		$("#studentname").css({'border-color':'red'});
            		$("#text1").css({'color':'red'});
        
        		    return false;
        		    }
        		});
        		
        		
        		text="";
        		$("#text1").html(text);
        		$("#studentname").css({'border-color':'blue'});
        		return true;
        	}
 }
  
 function fname()
 {
        	
        	var fathername=$("#fathername").val();
        	var text="";
        	if(fathername==""){
        		text="Please Enter Father Name";
        		$("#text2").html(text);
        		$("#fathername").css({'border-color':'red'});
        		$("#text2").css({'color':'red'});
        		return false;
        	}else{
        		
        		$('#fathername').keypress(function (e) {
        			
        		    var regex = new RegExp("^[a-zA-Z ]+$");
        		    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
        		    if (regex.test(str)) {
        		        return true;
        		    }
        		    else
        		    {
        		    e.preventDefault();
        		    text="Please Enter Only Character..";
            		$("#text2").html(text);
            		$("#fathername").css({'border-color':'red'});
            		$("#text2").css({'color':'red'});
            		
        		    return false;
        		    }
        		});
        		
        		text="";
        		$("#text2").html(text);
        		$("#fathername").css({'border-color':'blue'});
        		return true;
        	}
 }
 
 function lname()
 {
        	
        	var surname=$("#surname").val();
        	var text="";
        	if(surname==""){
        		text="Please Enter Surname Name";
        		$("#text3").html(text);
        		$("#surname").css({'border-color':'red'});
        		$("#text3").css({'color':'red'});
        		return false;
        	}else{
        		
        		$('#surname').keypress(function (e) {
        		
        		    var regex = new RegExp("^[a-zA-Z ]+$");
        		    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
        		    if (regex.test(str)) {
        		        return true;
        		    }
        		    else
        		    {
        		    e.preventDefault();
        		    text="Please Enter Only Character..";
            		$("#text3").html(text);
            		$("#surname").css({'border-color':'red'});
            		$("#text3").css({'color':'red'});
            		
        		    return false;
        		    }
        		});
        		text="";
        		$("#text3").html(text);
        		$("#surname").css({'border-color':'blue'});
        		return true;
        	}
 }
 
 
 function std()
 {
	 var stdd=$("#class").val();
	 var text="";
	 if(stdd=="Select Class"){
		 text="Please Select Class";
 		$("#text12").html(text);
 		$("#class").css({'border-color':'red'});
 		$("#text12").css({'color':'red'});
 		return false;
 	}else{
 		text="";
 		$("#text12").html(text);
 		$("#class").css({'border-color':'blue'});
 		return true;
 	}
}

function sub()
 {
	 var subj=$("#subject").val();
	 var text="";
	 if(subj=="0"){
		 text="Please Select Subject";
 		$("#text12").html(text);
 		$("#subject").css({'border-color':'red'});
 		$("#text12").css({'color':'red'});
 		return false;
 	}else{
 		text="";
 		$("#text12").html(text);
 		$("#subject").css({'border-color':'blue'});
 		return true;
 	}
}


function batch()
 {
	 var batch=$("#batch").val();
	 var text="";
	 if(batch==""){
		 text="Please Select Subject";
 		$("#text12").html(text);
 		$("#batch").css({'border-color':'red'});
 		$("#text12").css({'color':'red'});
 		return false;
 	}else{
 		text="";
 		$("#text12").html(text);
 		$("#batch").css({'border-color':'blue'});
 		return true;
 	}
}
 
 
 
 
 function phonenumber()
 {
 	
 	var stdnumber=$("#stdnumber").val();
 	var text="";
 	if(stdnumber.length!=10){
 		text="Please Enter 10 digit Mobile Number";
 		$("#text4").html(text);
 		$("#stdnumber").css({'border-color':'red'});
 		$("#text4").css({'color':'red'});
 		return false;
 	}else{
 		text="";
 		$("#text4").html(text);
 		$("#stdnumber").css({'border-color':'blue'});
 		return true;
 	}
}

 
 function passwordd()
 {
 	
 	var password=$("#password").val();
 	var text="";
 	if(password.length<=5){
 		text="Please Enter atleast 6 digit Charecter";
 		$("#text5").html(text);
 		$("#password").css({'border-color':'red'});
 		$("#text5").css({'color':'red'});
 		return false;
 	}else{
 		text="";
 		$("#text5").html(text);
 		$("#password").css({'border-color':'blue'});
 		return true;
 	}
}
 
 function cpasswordd()
 {
	 var password=$("#password").val();
 	var cpassword=$("#confirmpassword").val();
 	var text="";
 	if(cpassword!=password || cpassword==""){
 		text="Password Does not match";
 		$("#text6").html(text);
 		$("#confirmpassword").css({'border-color':'red'});
 		$("#text6").css({'color':'red'});
 		return false;
 	}else{
 		text="";
 		$("#text6").html(text);
 		$("#confirmpassword").css({'border-color':'blue'});
 		return true;
 	}
}
 
 
 
 function emaill()
 {
 	var email=$("#email").val();
 	var text="";
 	if(email==""){
 		text="Please Enter Email";
 		$("#text7").html(text);
 		$("#email").css({'border-color':'red'});
 		$("#text7").css({'color':'red'});
 		return false;
 	}else{
 		var validateEmail = function(elementValue) {
 		    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
 		    return emailPattern.test(elementValue);
 		}
 		
 		$('#email').keyup(function() {

 		    var value = $(this).val();
 		    var valid = validateEmail(value);

 		    if (!valid) {


 		    	text="Please Enter Correct Email ";
 		 		$("#text7").html(text);
 		 		$("#email").css({'border-color':'red'});
 		 		$("#text7").css({'color':'red'});
 		 		return false;

 		    } else {


 		       return true;

 		    }
 		});

 		
 		text="";
 		$("#text7").html(text);
 		$("#email").css({'border-color':'blue'});
 		return true;
 	}
}
 

 function addresss()
 {
 	var address=$("#address").val();
 	var text="";
 	if(address==""){
 		text="Please Enter Correct Address";
 		$("#text8").html(text);
 		$("#address").css({'border-color':'red'});
 		$("#text8").css({'color':'red'});
 		return false;
 	}else{
 		text="";
 		$("#text8").html(text);
 		$("#address").css({'border-color':'blue'});
 		return true;
 	}
}
 
 
 function phonenumberr()
 {
 	
 	var prtnumber=$("#prtnumber").val();
 	var text="";
 	if(prtnumber.length!=10){
 		text="Please Enter 10 digit Mobile Number";
 		$("#text9").html(text);
 		$("#prtnumber").css({'border-color':'red'});
 		$("#text9").css({'color':'red'});
 		return false;
 	}else{
 		
 		
 		text="";
 		$("#text9").html(text);
 		$("#prtnumber").css({'border-color':'blue'});
 		return true;
 	}
}
 
 
 function gender()
 {
	 var genderr=$("#gender").val();
	 var text="";
	 if(genderr=="Select Gender"){
		 text="Please Select Gender";
 		$("#text10").html(text);
 		$("#gender").css({'border-color':'red'});
 		$("#text10").css({'color':'red'});
 		return false;
 	}else{
 		text="";
 		$("#text10").html(text);
 		$("#gender").css({'border-color':'blue'});
 		return true;
 	}
}
 
 
 function mothernamee()
 {
 	
 	var mothername=$("#mothername").val();
 	var text="";
 	if(mothername==""){
 		text="Please Enter Mother Name";
 		$("#text11").html(text);
 		$("#mothername").css({'border-color':'red'});
 		$("#text11").css({'color':'red'});
 		return false;
 	}else{
 		
 		$('#mothername').keypress(function (e) {
 			
 		    var regex = new RegExp("^[a-zA-Z ]+$");
 		    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
 		    if (regex.test(str)) {
 		        return true;
 		    }
 		    else
 		    {
 		    e.preventDefault();
 			text="Please Enter Only Character";
 	 		$("#text11").html(text);
 	 		$("#mothername").css({'border-color':'red'});
 	 		$("#text11").css({'color':'red'});
 		    return false;
 		    }
 		});
 		text="";
 		$("#text11").html(text);
 		$("#mothername").css({'border-color':'blue'});
 		return true;
 	}
}
 
 
 function validate(){
	 if(sname()==false || fname()==false || lname()==false  || phonenumber()==false || passwordd()==false || cpasswordd()==false || emaill()==false || addresss()==false || phonenumberr()==false || mothernamee()==false || sub()==false){
		sname();fname();lname();std();phonenumber();passwordd();passwordd();cpasswordd();emaill();addresss();phonenumberr();gender();mothernamee();
		return false;
	 }else{
		 return true;
	 }
 }
 
 $("#submit").click(function(){
	 if(sname()==false || fname()==false || lname()==false  || phonenumber()==false || passwordd()==false || cpasswordd()==false || emaill()==false || addresss()==false || phonenumberr()==false || mothernamee()==false || sub()==false){
			sname();fname();lname();std();phonenumber();passwordd();passwordd();cpasswordd();emaill();addresss();phonenumberr();gender();mothernamee();
			return false;
			
		 }else{
			
			 $.ajax({
					type:"POST",
					  /*dataType: 'json/text',*/
					/* encoding:"UTF-8",
					  dataType:"html", 
					    contentType: "text/plain; charset=UTF-8",*/
					data:{studentName:$("#studentname").val(),fatherName:$("#fathername").val(),surname:$("#surname").val(),className:$("#class").val(),stdnumber:$("#stdnumber").val(),password:$("#password").val(),email:$("#email").val(),address:$("#address").val(),prtnumber:$("#prtnumber").val(),gender:$("#gender").val(),mothername:$("#mothername").val()},
					url:"Register?method=addRegister",
					 success: function (data) {
						console.log("Displsy js"+data);
						if(data=="true"){
							alert("you are not registration Sucessfull...");
							location.href="index.jsp";

						}else{
							alert("You are registration Sucessfull...");
							location.href="index.jsp";
													}
					}
				});
			 
			 return true;
		 }
 });
 
 $("button .btn-default").click(function(){
	 if(sname()==false || fname()==false || lname()==false  || phonenumber()==false || passwordd()==false || cpasswordd()==false || emaill()==false || addresss()==false || phonenumberr()==false || mothernamee()==false || sub()==false ){
			sname();fname();lname();std();phonenumber();passwordd();passwordd();cpasswordd();emaill();addresss();phonenumberr();gender();mothernamee();
			return false;
		 }else{
			 return true;
		 }
 });
 
 
 
 function sendQueryEmail(to,message) {
    Email.send({
    Host: "smtp.gmail.com",
    Username : 'www.ariseacademylatur@gmail.com',
    Password : 'ari$e@123',
    To : to,
    From : 'www.ariseacademylatur@gmail.com',
    Subject :"Arise Academy Latur", 
    Body : message,
        }).then(
        message => console.log("sent")
    );
  }
 
 
 
 
 