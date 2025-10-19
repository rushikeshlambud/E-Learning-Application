
<%@page import="DbConnect.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container-fluid ">
		<div class="row">

			<div class="col-md-2 mt-5">
				<!-- sidebar menu -->
				<jsp:include page="leftsidebar.jsp"></jsp:include>
			</div>
			<div class="col-md-10  body-pannel">
				<div class="row">
				<div class="col-md-12">
				<h3>Add Subjects</h3>
				<form class="form-horizontal" action="add_subject_nameDB.jsp" method="get">
					<div class="form-group">
        			<label>Select Standard</label>
        			<select class="combobox input-large form-control bor stndrd" name="std" required="">
        			<option value="0">Select a Std</option>
        			<option value="First Year">First Year</option>
        			<option value="Second Year">Second Year</option>
        			<option value="Third Year">Third Year</option>
        			</select>
        			</div>
        			<div class="form-group">
        			<label>Combine Subject ?</label>
        			<b>No</b> <input type="radio" class="form-control-radio nop" value="no" name="combine" checked="checked">
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Yes</b> <input type="radio" class="form-control-radio yup" value="yes" name="combine">
        			</div>
					<div class="form-group">
						<label>Subject Name</label> <input type="text"
							class="form-control" name="sub_name"
							placeholder="Enter Subject name" required>
					</div>
					<div id="viewsubject"></div>
					<input type="submit" class="btn btn-primary">
				</form>
				</div>
				</div>

				<div>
				<div class="col-md-8 offset-md-1">
					<br>
					<br>
					<table class="table table-bordered">
						<tr>
							<th>Sr.No</th>
							<th>Subject</th>
							<th>Status</th>
						</tr>
						<tr>
							<%
								Connection con = DbConnect.con();
								;
								String sql = "SELECT * FROM subject order by subject_id desc";
								PreparedStatement ps = con.prepareStatement(sql);
								ResultSet rs = ps.executeQuery();
								int cnt = 1;
								while (rs.next()) {
							%>
							<td><%=cnt%></td>
							<td><%=rs.getString(4) %> :- <%=rs.getString(2)%> </td>

							<%
								if (rs.getString(3).equals("deactivate")) {
							%>
							<td><a
								href="sub_statusDB.jsp?sub_id=<%=rs.getString(1)%>&&staus=deactivate"
								class="btn btn-danger btn-sm">Deactivated</a></td>
							<%
								} else {
							%>
							<td><a
								href="sub_statusDB.jsp?sub_id=<%=rs.getString(1)%>&&staus=Activated"
								class="btn btn-info btn-sm">Activated</a></td>
							<%
								}
							%>
						</tr>
						<%
							cnt++;
							}con.close();
						%>
					</table>
				</div>
				</div>
			</div>





		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script>
	$('.yup').click(function(){
		var std=$('.stndrd').val();
		if(std!=0){
		$.ajax({
			url:'getcombinesubject.jsp',
			data:'std='+std,
			type:'post',
			success:function(r)
			{
				$('#viewsubject').html(r);
			}
		});
		}
		else{
			alert("Please Select Standard First!");
			$('.nop').prop("checked",true);
		}
	});
	
	$('.nop').click(function(){
		$('#viewsubject').html("");
	});
	
	</script>
</body>
</html>