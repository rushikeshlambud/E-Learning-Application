
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
				<br>
				<br>
				<br>
				<form action="add_batch_nameDB.jsp" method="post">
				
					<div class="form-group">
        			<label>Select Standard</label>
        			<select class="combobox input-large form-control bor getsub" name="std" required="">
        			<option value="0">Select a Std</option>
        			<option value="First Year">First Year</option>
        			<option value="Second Year">Second Year</option>
        			<option value="Third Year">Third Year</option>
        			</select>
        			</div>
        			
        			
        			
					<div class="form-group">
						<label>Select Subject</label> <select class=" sub form-control"
							name="sub_id">
							<option value="0">Select Subject</option>
							
						</select>
					</div>

					<div class="form-group">
						<label>Branch Name</label> <input type="text" class="form-control"
							name="batch_name" placeholder="Enter Batch name" required>
					</div>

					<input type="submit" class="btn btn-primary">
				</form>



				<div class="col-md-8 offset-md-1">
					<br> <br>
					<table class="table table-bordered">
						<tr>
							<th>Sr.No</th>
							<th>Standard</th>
							<th>Subject</th>
							<th>Batch</th>
							<th>Status</th>
						</tr>
						<tr>
													<%
								Connection con = DbConnect.con();
								String sql = "SELECT * FROM subject order by subject_id desc";
								
							
							%>
						
							<%
								String sql1 = "SELECT bn.*,s.* FROM batch_name as bn inner join subject as s on bn.subject_id=s.subject_id";
								PreparedStatement ps1 = con.prepareStatement(sql1);
								ResultSet rs1 = ps1.executeQuery();
								int cnt = 1;
								while (rs1.next()) {
							%>
							<td><%=cnt%></td>
							<td><%=rs1.getString(8) %></td>
							<td><%=rs1.getString(6)%></td>
							<td><%=rs1.getString(3)%></td>
							<%
								if (rs1.getString(4).equals("deactivate")) {
							%>
							<td><a
								href="batch_statusDB.jsp?batch_id=<%=rs1.getString(1)%>&&staus=deactivate"
										class="btn btn-danger btn-sm">Deactivated</a></td>
							<%
								} else {
							%>
							<td><a
								href="batch_statusDB.jsp?batch_id=<%=rs1.getString(1)%>&&staus=Activated"
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
	<jsp:include page="footer.jsp"></jsp:include>
	<script>
	
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
	</script>
</body>
</html>