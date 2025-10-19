$('.upload-db').click(function(){
var cnt=0;
	$('input').each(function(){
	if($(this).val()=="")
		{
		$(this).css('border','1px solid red');
		event.preventDefault();
		cnt++;
		}
	});
	
	$('.combobox').each(function(){
		$(this).each(function(){
			if($(this).val()=="")
				{
				$(this).css('border','1px solid red');
				event.preventDefault();
				cnt++;
				}
	});
	
});
	if(cnt==0)
		{
	
		$.ajax({url:'uploaddb.jsp',
				data:$('form').serialize(),
				type:'post',
				success:function(r)
				{
					var get=r.trim();
					if(get=="1")
						{
						alert('successfully inserted');
						$('.bor').val("");
						}
					else{
						alert('please try again');
					}
				}
		});
		}
});


$('.rupload-db').click(function(){
var cnt=0;
	$('input').each(function(){
	if($(this).val()=="")
		{
		$(this).css('border','1px solid red');
		event.preventDefault();
		cnt++;
		}
	});
	
	$('.combobox').each(function(){
		$(this).each(function(){
			if($(this).val()=="")
				{
				$(this).css('border','1px solid red');
				event.preventDefault();
				cnt++;
				}
	});
	
});
	if(cnt==0)
		{
		$.ajax({url:'ruploaddb.jsp',
				data:$('form').serialize(),
				type:'post',
				success:function(r)
				{
					var get=r.trim();
					if(get=="1")
						{
						alert('successfully inserted');
						$('.bor').val("");
						}
					else{
						alert('please try again');
					}
				}
		});
		}
});




$('.bor').click(function(){
	$(this).css('border','0.5px solid buttonface');
});

function updatevideo(id,index)
{
	$('.video-pop-up').show();
	var data=$('.t'+index).find('td');
	$("form input[name='videoTitle']").val(data.eq("1").text());
	$("form input[name='embedid']").val(data.eq("5").text());
	$("form input[name='videoDate']").val(data.eq("6").text());
	$("form select[name='platform']").val(data.eq("4").text());
	$("form select[name='std']").val(data.eq("2").text());
	$("form input[name='vid']").val(id);
}


function rupdatevideo(id,index)
{
	$('.video-pop-up').show();
	var data=$('.rt'+index).find('td');
	$("form input[name='videoTitle']").val(data.eq("1").text());
	$("form input[name='videoDate']").val(data.eq("6").text());
	$("form input[name='embedid']").val(data.eq("5").text());
	$("form select[name='platform']").val(data.eq("4").text());
	$("form select[name='std']").val(data.eq("2").text());
	$("form input[name='vid']").val(id);
}


$('.vclose').click(function(){
	$('.video-pop-up ').hide();
});

function update_evideo()
{
	$.ajax({url:'updatevideo.jsp',
		data:$('#form').serialize(),
		type:'post',
		success:function(r)
		{
			var get=r.trim();
			if(get=="1")
				{
				alert('successfully Updated');
				$('.bor').val("");
				$('.video-pop-up').hide();
				location.reload(true);
				}
			else{
				alert('please try again');
			}	
			
		}
	});
		
}


function rupdate_evideo()
{
	$.ajax({url:'rupdatevideodb.jsp',
		data:$('#form').serialize(),
		type:'post',
		success:function(r)
		{
			var get=r.trim();
			if(get=="1")
				{
				alert('successfully Updated');
				$('.bor').val("");
				$('.video-pop-up').hide();
				location.reload(true);
				}
			else{
				alert('please try again');
			}	
			
		}
	});
		
}


function update_evideodemo()
{
	$.ajax({url:'updatedemovideo.jsp',
		data:$('#form').serialize(),
		type:'post',
		success:function(r)
		{
			var get=r.trim();
			if(get=="1")
				{
				alert('successfully Updated');
				$('.bor').val("");
				$('.video-pop-up').hide();
				location.reload(true);
				}
			else{
				alert('please try again sdss'+r.trim());
			}	
			
		}
	});
		
}

$('.vview').click(function(){
	
	$('.view-video').show();
	var data=$(this).closest("tr").find("td");
	
	var vl=data.eq('4').text();
	if(vl=='youtube')
		{
		$('.video-link').attr('src','https://www.youtube.com/embed/'+data.eq(5).text()+'');
		//
		}
	else if(vl=="vimeo")
		{
		$('.video-link').attr('src','https://player.vimeo.com/video/'+data.eq(5).text()+'');
		}
});



$('.video-close').click(function(){
	$('.view-video').hide();
	$('.video-link').attr('src','');
});


function delete_video(id,index)
{
	$.ajax({url:'delete_video.jsp',
		data:"id="+id,
		type:'post',
		success:function(r)
		{
			var get=r.trim();
			if(get=="1")
				{
				alert('successfully inserted');
				$('.t'+index).remove();
				var count=0;
				$('.sr').each(function(){
					count++;
					$(this).text(count);
					
				})
				}
			else{
				alert('please try again');
			}	
			
		}
	});
		
}


function rdelete_video(id,index)
{
	$.ajax({url:'rdelete_video.jsp',
		data:"id="+id,
		type:'post',
		success:function(r)
		{
			var get=r.trim();
			if(get=="1")
				{
				alert('successfully Deleted');
				$('.t'+index).remove();
				var count=0;
				$('.sr').each(function(){
					count++;
					$(this).text(count);
					
				})
				}
			else{
				alert('please try again');
			}	
			
		}
	});
		
}

function r1delete_video(id,index)
{
	$.ajax({url:'rdelete_video.jsp',
		data:"id="+id,
		type:'post',
		success:function(r)
		{
			var get=r.trim();
			if(get=="1")
				{
				alert('Successfully Deleted !');
				$('.rt'+index).remove();
				var count=0;
				$('.sr').each(function(){
					count++;
					$(this).text(count);
					
				})
				}
			else{
				alert('please try again');
			}	
			
		}
	});
		
}





