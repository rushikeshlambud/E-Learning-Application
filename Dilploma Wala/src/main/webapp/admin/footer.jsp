<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.dataTables.min.js"></script>
<script src="../js/vimeo-upload.js"></script>
<script src="../js/Dboperation.js" ></script>
<script src="../js/validation.js" ></script>
<script src="../js/notes.js" ></script>

<script>

$( document ).ready(function() {
   
var selector = '.child_menu li';

$(selector).on('click', function(){
	update(this.className);
	
});

});
</script>

<script>


$("#upload").empty();
$("#upload").append('<div class="right_col" role="main" id="upload"><h5> Welcome To Admin Panel !!!</h5></div>');
</script>
    