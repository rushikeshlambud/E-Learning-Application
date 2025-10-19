<%@page import="Batch.Batch"%>
<%@page import="Subjects.Subjects"%>
<%@page import="javax.security.auth.Subject"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="head.jsp"></jsp:include>

<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
	<!-- Include Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- Style -->
	<link rel="stylesheet" type="text/css" href="../js/datatables.min.css"/>

<style type="text/css">
		a {

			text-decoration: none;
		}
		table {
			width: 100%;
			border-collapse: collapse;
			margin-top: 20px;
			margin-bottom: 20px;
		}
		table, th, td {
		   border: 1px solid #bbb;
		   text-align: left;
		}
		tr:nth-child(even) {
			background-color: #f2f2f2;
		}
		th {
			background-color: #ddd;
		}
		th,td {
			padding: 5px;
		}
		button {
			cursor: pointer;
		}
		/*Initial style sort*/
		.tablemanager th.sorterHeader {
			cursor: pointer;
		}
		.tablemanager th.sorterHeader:after {
			content: " \f0dc";
			font-family: "FontAwesome";
		}
		/*Style sort desc*/
		.tablemanager th.sortingDesc:after {
			content: " \f0dd";
			font-family: "FontAwesome";
		}
		/*Style sort asc*/
		.tablemanager th.sortingAsc:after {
			content: " \f0de";
			font-family: "FontAwesome";
		}
		/*Style disabled*/
		.tablemanager th.disableSort {

		}
		#for_numrows {
			padding: 10px;
			float: left;
		}
		#for_filter_by {
			padding: 10px;
			float: right;
		}
		#pagesControllers {
			display: block;
			text-align: center;
			
		}
		.pagecontroller-num,.pagecontroller-p,.pagecontroller-f,.pagecontroller-n,.pagecontroller-l{
		padding: 5px;
		}
		
	</style>


</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	
	
	<div class="container-fluid ">
		<div class="row">

			<div class="col-md-2 mt-5">
				<!-- sidebar menu -->
				<jsp:include page="leftsidebar.jsp"></jsp:include>
			</div>
			<div class="col-md-10 body-pannel">
				
				
                <div class="" style="margin-top: 20px;">
                
			    <table id="dataTableExample" class="table table-hover table-responsive" style="max-height: 600px;">
			    <thead class="">
				<tr>
					<th>Sr.No</th>
					<th>Registraiton Date</th>
				    <th>Student Id</th>
					<th class="">Name</th>
					<th>Class</th>
					<th>Subject Name</th>
					<th>Batch Id</th>
					<th>Student Mobile</th>
					<th>Password</th>
					<th>Email</th>
					<th>Address</th>
					<th>Parent Number</th>
					<th>Gender</th>
					
					<th>Profile</th>
					<th>Transaction Id</th>
					<th>Paid Amount</th>
					<th>Screenshot</th>
										<th class="disableFilterBy">Controls</th>
					
				</tr>
			</thead>
			  <tbody class="menuresult">
			    <tr>
			    <%
			        Connection con=DbConnect.con();
			        String sql="select *from register order by student_id desc";
			        PreparedStatement ps=con.prepareStatement(sql);
					ResultSet rs=ps.executeQuery();
					int i=0;
			        while(rs.next()){
						i++;
				%>
				<td><%=i %></td>   
				<td><%=rs.getString(16)%></td> 
				<td><%=rs.getString(1) %></td>  
				
			    <td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<%try{%>
			    <td><%=Subjects.getsubjectsbyId(rs.getString(4)).getString("sub_Name")%></td>
				<%}catch(Exception e){
					%><td>-</td><%
				}%>
				<%try{%>
				<td><%=Batch.getBatchbyId(rs.getString(5)).getString("batch_Name") %></td>
				<%}catch(Exception e){%>
					<td>-</td>

				<%}%>
				<td><%=rs.getString(6) %></td>
			    <td><%=rs.getString(7) %></td>
			    <td><%=rs.getString(8) %></td>
			    <td><%=rs.getString(9) %></td>
			    <td><%=rs.getString(10) %></td>
			    <td><%=rs.getString(11) %></td>
			    <td><%=rs.getString(12) %></td> 
				<td><%=rs.getString(14) %></td>
				<td><%=rs.getString(15) %> Rs.</td>
			    <td><a href="viewscreenshot.jsp?id=<%=rs.getString(1)%>"><i class="fa fa-eye" > view</i></a></td>
			     <td><a href="student_edit.jsp?id=<%=rs.getString(1) %>" style="color:blue;">Edit</a>
			     <a onclick="dol(<%=rs.getString(1) %>)"  style="color:red; cursor:pointer;">Delete</a>
			     </td> 
			     
			    </tr>
			    <%}con.close(); %>
			   
			    </tbody>
			    </table>
			    </div>
			</div>
		</div>
	</div>


<jsp:include page="footer.jsp"></jsp:include>

<script	src="js/jquery.dataTables.min.js">
		</script>
				 <!-- <script src="../assets/vendors/datatables.net/jquery.dataTables.js"></script> -->

				 <script type="text/javascript" src="../js/datatables.min.js"></script>
  <script src="../js/dataTables.bootstrap4.js"></script>
  <script src="../js/data-table.js"></script>
  
	<!-- <script type="text/javascript" src="./js/jquery-1.12.3.min.js"></script> -->
	

	<script type="text/javascript">

		// basic usage
		
		
		  function dol(rs)
  {
	  var r=confirm("Are you sure to delete this student Details?");
	  if(r==true)
		  {
		  location.href="delstud.jsp?id="+rs;
		  }
  }
</script>
	
	
</body>
</html>