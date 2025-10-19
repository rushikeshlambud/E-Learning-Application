
 //Notes upload validation
 $('.upload-notes-db').click(function(){
	 alert();
	 var cnt=0;
	$('.input-n').each(function()
	{
		
		if($(this).val()=="")
			{
			
			$(this).css('border','1px solid red');
			cnt++;
			}
	});
	 if(cnt==0)
		 {
		 var form = $('#notesdata')[0];
		    var data = new FormData(form);
			 $.ajax({
			        type: "POST",
			        enctype: 'multipart/form-data',
			        url:"../NotesController",
			        data: data,
			        processData: false,
			        contentType: false,
			        cache: false,
			        timeout: 600000,
			        success: function (data) {
			          	 alert("Successfully Added !");
			            console.log("SUCCESS : ", data);
			            
			            $(".slimg").html(data);

			        }
			    });
			
		 }
 });