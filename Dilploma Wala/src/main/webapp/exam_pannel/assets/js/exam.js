$(".q-dis").hide();
$(".hide1").show();
// var i=$("#count").length;
var i = 1;
var a = $("#count").val();
var k = 0;
var cquid, cqa; //update saved question time 
// Its a for store question and answer variables
var v = 0;
//var myObj=[];
var data;
var rate_value;
var val;
var user_id = $('#user_id').val();
var qquiz_id = $("#qquiz_id").val();
// End

if(k==0){
	$("#back").attr("disabled", "disabled");
	}

	
$("#next").click(function() {
	$("#back").removeAttr("disabled");
	i++;
	k++;
	/*alert(k);*/
	if (i > a) {
		
		alert("Question End, Go Back Or Submit Exam")
		
		/* alert(i+" "+k); */
		
		$(".legend" + k + "").css({
			"background-color" : "white",
			"color" : "black",
			"border-color":"black",
			"border-radius": "50px 50px"
		});
		i--;
		k=a;
		//alert(i+"  "+k+" ds=>"+a);
		return false;
	}
	$(".q-dis").hide();
	$(".hide" + i + "").show();
	
	if ($(".legend" + k + "").css('background-color')=="rgb(255, 0, 0)")
		{
		$(".legend" + k + "").css({
			"background-color" : "white",
			"color" : "black",
			"border-color":"black",
			"border-radius": "50px 50px"
		});
		}
	
	
	return true;

});


$("#back").click(function() {
	if(k==1){
		$("#back").attr("disabled", "disabled");
		}
	if(k==a){
		k--;
		}
	i--;
	k--;
	if (i<1) {
		k=1;
		i=1;
		alert("Question End, Go Next Or Submit Exam");
		//alert(i + " " + k);
		if(i==1){
		$("#back").attr("disabled", "disabled");
		}
		return false;
		
	}

	$(".q-dis").hide();
	$(".hide" + i + "").show();

});

$("#quiz_id").click(function() {
	
	$("#back").removeAttr("disabled");
	//alert(i+"  "+a);
	if(i==a)
		{
		k=a;
		i=a;
		//alert("=>>>"+ i+" "+k);
		}
	else{
	i++;
	k++;
	}
	
	
	
	
	if ($("#radio" + Number(k) + "").find("input:checked").val() == null) {
		k--;
		i--;
		alert("Select Answer" + (k+1));
		return false;
	} else {
		v++;
		
		if (i >a) {
		
			alert("Question End, Go Back Or Submit Exam");
			
			$(".q-dis").hide();
			$(".hide" + i + "").show();
			$(".legend" + k + "").css({
				"background-color" : "green",
				"color":"white"
			});
			i=a;
			k=a;
		}
		
		//alert(i);
		$(".q-dis").hide();
		$(".hide" + i + "").show();
		
		// Start for question and answer
		//alert(k+"--->");
		if (k == 1) {
			
			if(myObj.length==0){
				myObj = {
						
						"qa" : [ {
							"question_id" : $("#qquestion_id" + k + "").val(),
							"answer" : $("#radio" + k + "").find("input:checked").val()
						} ]

					};
				}else{
			//alert("alo itha !");
			var status='false';
			for (var q = 0; q < myObj.qa.length; q++) {
				//alert(myObj.qa.length);
				  if (myObj.qa[q].question_id == k) {
				 myObj.qa[q].answer = $("#radio" + k + "").find("input:checked").val();			
					  status='true';
				    break;
				  }
				}
			if(status=='false')
				{
				myObj.qa.push({"question_id" : $("#qquestion_id" + k + "").val(),"answer" : $("#radio" + k + "").find("input:checked").val()});
			}
			
			
		} 
		}
		else{
			
			if(myObj.length==0){
				myObj = {
						
						"qa" : [ {
							"question_id" : $("#qquestion_id" + k + "").val(),
							"answer" : $("#radio" + k + "").find("input:checked").val()
						} ]

					};
			}else{
				status='false';
			for (var r = 0; r < myObj.qa.length; r++) {
				  //alert(myObj.qa[r].question_id); 
			
				if (myObj.qa[r].question_id == k) {
					 myObj.qa[r].answer = $("#radio" + k + "").find("input:checked").val();
					 status='true';
				    break;
				    
				    return false;
				  }}
			if(status=='false'){ 
				
			
			myObj.qa.push(

			{
				"question_id" : $("#qquestion_id" + k + "").val(),

				"answer" : $("#radio" + k + "").find("input:checked").val()
			}

			)
			
			
		}}}
		
	
		localStorage.setItem('myDataKey', JSON.stringify(myObj.qa));
		
		// End question and answer
		$(".legend" + k + "").css({
			"background-color" : "green",
			"color":"white"
		});
		return true;

	}

});




$("#mark").click(function() {
	$("#back").removeAttr("disabled");
	
	//alert(i+"  "+a);
	if(i==a)
		{
		k=a;
		i=a;
		//alert("=>>>"+ i+" "+k);
		}
	else{
	i++;
	k++;
	}
	
	
	
	
	if ($("#radio" + Number(k) + "").find("input:checked").val() == null) {
		k--;
		i--;
		alert("Select Answer" + (k+1));
		return false;
	} else {
		v++;
		
		if (i >a) {
		
			alert("Question End, Go Back Or Submit Exam");
			
			$(".q-dis").hide();
			$(".hide" + i + "").show();
			$(".legend" + k + "").css({
				"background-color" : "#9068c1",
				"color":"white"
			});
			i=a;
			k=a;
		}
		
		//alert(i);
		$(".q-dis").hide();
		$(".hide" + i + "").show();
		
		// Start for question and answer
		//alert(k+"--->");
		if (k == 1) {
			
			if(myObj.length==0){
				myObj = {
						
						"qa" : [ {
							"question_id" : $("#qquestion_id" + k + "").val(),
							"answer" : $("#radio" + k + "").find("input:checked").val()
						} ]

					};
			}else{
			//alert("alo itha !");
			var status='false';
			for (var q = 0; q < myObj.qa.length; q++) {
				//alert(myObj.qa.length);
				  if (myObj.qa[q].question_id == k) {
				 myObj.qa[q].answer = $("#radio" + k + "").find("input:checked").val();			
					  status='true';
				    break;
				  }
				}
			if(status=='false')
				{
				myObj.qa.push({"question_id" : $("#qquestion_id" + k + "").val(),"answer" : $("#radio" + k + "").find("input:checked").val()});
			}
			
			
		} 
		}
		else{
			
			if(myObj.length==0){
				myObj = {
						
						"qa" : [ {
							"question_id" : $("#qquestion_id" + k + "").val(),
							"answer" : $("#radio" + k + "").find("input:checked").val()
						} ]

					};
			}else{
				status='false';
			for (var r = 0; r < myObj.qa.length; r++) {
				  //alert(myObj.qa[r].question_id); 
			
				if (myObj.qa[r].question_id == k) {
					 myObj.qa[r].answer = $("#radio" + k + "").find("input:checked").val();
					 status='true';
				    break;
				    
				    return false;
				  }}
			if(status=='false'){ 
				
			
			myObj.qa.push(

			{
				"question_id" : $("#qquestion_id" + k + "").val(),

				"answer" : $("#radio" + k + "").find("input:checked").val()
			}

			)
			
			
		}}}
		
	
		localStorage.setItem('myDataKey', JSON.stringify(myObj.qa));
		
		// End question and answer
		$(".legend" + k + "").css({
			"background-color" : "#9068c1",
			"color":"white"
		});
		return true;

	} 

});



var legend=$(".tt");
legend.each(function(){
	var serial=$(this).text();
	$(".legend" + serial + "").click(function(){
		$(".q-dis").hide();
		$(".hide" + serial + "").show();
		if ($(".legend" + serial + "").css('background-color')=="rgb(255, 0, 0)")
		{
		$(".legend" + serial + "").css({
			"background-color" : "white",
			"color" : "black",
			"border-color":"black",
			"border-radius": "50px 50px"
		});
		}
		k=serial-1;
		i=serial;
		//alert(k);	
	});
	
});


var data1;

function submit_data() {
	
	
	data1 = localStorage.getItem("myDataKey");
	if(data1==null){
		alert("Solove Minimum One question");
		return false;
	}else{
	
		localStorage.clear();
		 var r = confirm("Are You Sure to Submit Exam !");
		  if (r == true) {
			  localStorage.clear();
			  window.location = "submitexam.jsp?user_id=" + user_id + "&&data="
				+ window.btoa(data1) + "&&qquiz_id=" + qquiz_id + "";
		   localStorage.removeItem('myDataKey');
		return true;
		  } else {
		    return false;
		  }
	
	}
}




//After Time End
function submit_dataa() {
	
	data1 = localStorage.getItem("myDataKey");
	if(data1==null){
		//myObj = {
				
				//"qa" : [ {
				//	"question_id" : "1",
				//	"answer" :"Not"
				//} ]

			//};
		
		//localStorage.setItem('myDataKey', JSON.stringify(myObj.qa));
		//data1 = "Not Answered";
		localStorage.clear();
		 window.location = "submitexam.jsp?user_id=" + user_id + "&&data="
			+ window.btoa(data1) + "&&qquiz_id=" + qquiz_id + "";
	   
	}else{
		localStorage.clear();
			  window.location = "submitexam.jsp?user_id=" + user_id + "&&data="
				+ window.btoa(data1) + "&&qquiz_id=" + qquiz_id + "";
		   localStorage.removeItem('myDataKey');
		 
		return true;
		  } 
	
	}


	
function deleteItem(key) {

    delete myObj[key];

    return myObj

}

$("#clear").click(function(){
    var radioButton=$(".ok"+i+"");
    radioButton.each(function() {
    this.checked = false;
   });
    $(".legend" + i + "").css({
		"background-color" : "white",
		"color" : "black",
		"border-color":"black",
		"border-radius": "50px 50px"
	});
  });
  


$("#clear").click(function(){
var answerkey=JSON.parse(localStorage.getItem("myDataKey"));
	
	const index = answerkey.findIndex(x => x.question_id == i);
   
	if (index !== undefined) {
		//answerkey.splice(index, 1);
		answerkey[index].answer = "Not Attempt";
		myObj.qa[index].answer="Not Attempt";
		localStorage.setItem('myDataKey', JSON.stringify(answerkey)); 
	}
	
	
	
	 
});

var data=JSON.parse(localStorage.getItem("myDataKey"));

for(var dk in data) {
	   
	if(data[dk].answer!="Not Attempt"){
		//console.log(dk, data[dk].answer);
		//"question_id" : $("#qquestion_id" + k + "").val(),
        //"question_Number" : $(".question_Number"+k+"").val(),
		//"answer" : $("#radio" + k + "").find("input:checked").val()
		$(".legend"+data[dk].question_id+"").css({"background-color" : "green",
		"color":"white"});
		var fans=$("#radio"+data[dk].question_id).find(".ok"+data[dk].question_id);
		//alert(fans.length)
		fans.each(function(){
			
			if($(this).val()==data[dk].answer){
			$(this).prop("checked", true );	
			}
		});
	//var qanswer=$("#radio" +data[dk].question_id+"").find(".ok"+data[dk].question_id+"]").val(""+data[dk].answer+"");
	//console.log(fans);
	//qanswer.prop("checked", true );
	}
	}


//localStorage.removeItem('myDataKey');