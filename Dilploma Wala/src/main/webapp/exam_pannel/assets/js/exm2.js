
$(".col-md-8").hide();
$(".hide1").show(); 
//var i=$("#count").length;
var i=1;
var a=$("#count").val();
var k=0;

//Its a for store question and answer variables
var v=0;
var myObj;
var data;
var rate_value;
var val;
var user_id=$('#user_id').val();
var qquiz_id=$("#qquiz_id").val();
//End


$("#next").click(function(){
	k++;
	i++;
		if(i>a){
		alert("Question End, Go Back Or Submit Exam")
		k--;
		i--;
		alert(i+" "+k);
		return false;	  	
	}
		alert(i);
	$(".col-md-8").hide();
	$(".hide"+i+"").show(); 
	$(".legend"+k+"").css({"background-color":"white","color":"black"});
	return true;
	 
});


$("#mark").click(function(){
	k++;
	i++;
	if(i>a){
		alert("Question End, Go Back Or Submit Exam");
		k--;
		i--;
		alert(i+" "+k);
		$(".legend"+k+"").css({"background-color":"#9068c1","color":"white"});
		return false;	  	
	}else{
	$(".col-md-8").hide();
	$(".hide"+i+"").show(); 
	$(".legend"+k+"").css({"background-color":"#9068c1","color":"white"});
	return true;
	}
});




$("#quiz_id").click(function(){
		i++;	
		k++;
		if($("#radio"+k+"").find("input:checked").val()==null){
			k--;
			i--;
			alert("Select Answer"+k);
			return false;
		}else{
			v++;
		$(".col-md-8").hide();
		$(".hide"+i+"").show(); 
		
		//Start for question and answer
		
		
		if(v==1){
		myObj={
		
		"qa":[
	    	{"question_id":$("#qquestion_id"+k+"").val(),"answer":$("#radio"+k+"").find("input:checked").val()}
	    	]
		
		
		};
	 }
		
		if(i>a){
			 i--;
			alert(k+" "+i);
			myObj.qa.push(
					 
					 {	
				     "question_id":$("#qquestion_id"+k+"").val(),
					 
					  "answer":$("#radio"+k+"").find("input:checked").val()
					  }
					 
					 )
			alert("Question End, Go Back Or Submit Exam");
			$(".legend"+k+"").css({"background-color":"green"});
			$(".col-md-8").hide();
			$(".hide"+i+"").show();
			return false;
		  	
		}

		else{
		 
		 myObj.qa.push(
				 
				 {	
			     "question_id":$("#qquestion_id"+k+"").val(),
				 
				  "answer":$("#radio"+k+"").find("input:checked").val()
				  }
				 
				 )
				 
				 
	 }
	 	localStorage.setItem('myDataKey',JSON.stringify(myObj.qa));

		//End question and answer
	 	$(".legend"+k+"").css({"background-color":"green"});
		return true;
		
		}	
		
});  
$("#back").click(function(){
	i--;	
	k--;
	if(i<1){
		alert("Question End, Go Next Or Submit Exam");
		alert(i+" "+k);
		return false;
		
	}
	$(".col-md-8").hide();
	$(".hide"+i+"").show(); 
		
}); 
function on_submit(){
		//var t=localStorage.getItem("myDataKey");
	//submit_data(myObj)
	//console.log(t);
	}  
	
function submit_data(){	
	var n;
	var m;
	var j;
	var data1;
	 data1=localStorage.getItem("myDataKey");
     window.location="exams.jsp?user_id="+user_id+
     "&&data="+window.btoa(data1)+
     "&&qquiz_id="+qquiz_id+"";
    
	 
} 

/*function on_submit(){
	v++;
	$(".hide"+v+":visible").each(function(){
		  if($(this).hasClass(".hide"+v+":visible")){
		    alert("ok j")
		  } else {
		    alert("not ok")
		  }
	});
}*/