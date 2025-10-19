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
				
	<script type="text/javascript"
    src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
       </script>
                <div class="table-responsive">
			    <table class="table tablemanager">
			    <thead>
				<tr>
					<th>Sr.No</th>
				    <th>Title</th>
					<th >Notification</th>
					<th>Date</th>
					<th>Edit</th>
				</tr>
			</thead>
			<tbody>
			    <tr>
			    <%
			        Connection con=DbConnect.con();
			        String sql="SELECT * FROM notifications order by id desc";
			        PreparedStatement ps=con.prepareStatement(sql);
			        ResultSet rs=ps.executeQuery();
			        while(rs.next()){
			    %>
			    <td><%=rs.getString(1) %></td>   
			    <td><%=rs.getString(2) %></td>
			    <td><%=rs.getString(3) %></td>
			    <td><%=rs.getString(4) %></td>
			     <td>
<%-- 			     <a href="delnotification.jsp?id=<%=rs.getString(1) %>" style="color:blue;">Edit</a> --%>
			     <a onclick="dol(<%=rs.getString(1) %>)"  style="color:red; cursor:pointer;">Delete</a>
			      <a href="upadatenotif.jsp?wde=<%=rs.getString(1)%>"  style="color:blue; cursor:pointer;">Update</a>
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





<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
		</script>
	<!-- <script type="text/javascript" src="./js/jquery-1.12.3.min.js"></script> -->
	<script type="text/javascript" src="plugin/tableManager.js"></script>
	<script type="text/javascript">
		// basic usage
		
		
		  function dol(rs)
  {
	  var r=confirm("Are you sure to delete this Notification Details?");
	  if(r==true)
		  {
		  location.href="delnotification.jsp?id="+rs;
		  }
  }
		$('.tablemanager').tablemanager({
			firstSort: [[3,0],[2,0],[1,'asc']],
			disable: ["last"],
			appendFilterby: true,
			dateFormat: [[4,"mm-dd-yyyy"]],
			debug: true,
			vocabulary: {
    voc_filter_by: 'Filter By',
    voc_type_here_filter: 'Filter...',
    voc_show_rows: 'Rows Per Page'
  },
			pagination: true,
			showrows: [5,10,20,50,100],
			disableFilterBy: [1]
		});
		// $('.tablemanager').tablemanager();
	</script>
	<script>
try {
  fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", { method: 'HEAD', mode: 'no-cors' })).then(function(response) {
    return true;
  }).catch(function(e) {
    var carbonScript = document.createElement("script");
    carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CK7DKKQU&placement=wwwjqueryscriptnet";
    carbonScript.id = "_carbonads_js";
    document.getElementById("carbon-block").appendChild(carbonScript);
  });
} catch (error) {
  console.log(error);
}
</script>
	<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();


</script>



</body>
</html>