
<%@page import="DbConnect.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<jsp:include page="head.jsp"></jsp:include>
</head>
<body style="background: gray;">
 <jsp:include page="header.jsp"></jsp:include>
 <div class="container" style="margin-top: 6%;">
 <div class="row">
 <div class="col-md-12 table-responsive">
 <table class="table table-striped table-dark" style="background:;">

 <tr>
 <th>Sr.No</th> <th>Class</th> <th>Name</th> <th>Total Question</th> <th>Marks</th> <th>Time</th> <th>Status</th> <th>Action</th> <th>Result</th>
 </tr>
 
 <tr>
 <%
 Class.forName("com.mysql.jdbc.Driver");
 Connection con=DbConnect.con();
 String sql="select *from quiz_detail order by id desc";
 PreparedStatement ps=con.prepareStatement(sql);
 ResultSet rs=ps.executeQuery();
 int i=1;
 while(rs.next()){
 %>
 <td><%=i %></td>
  <td><%=rs.getString(9) %></td>
 <td><%=rs.getString(2) %></td>
 <td><%=rs.getString(3) %></td>
  <td><%=(Integer.parseInt(rs.getString(3))*Integer.parseInt(rs.getString(4)))%></td>
 <td><%=rs.getString(6) %>h : <%=rs.getString(7) %>m</td>

<%if(rs.getString(11).equals("Active")){ %>
   <td style="color:red;"><b><%=rs.getString(11) %></b></td>
  <%}else{ %>
   <td><%=rs.getString(11) %></td>
  <%} %>

 
 
 <%if(rs.getString(11).equals("Active")){ %>
  <td><a href="exam_status.jsp?quiz_id=<%=rs.getString(1)%>&status=Active" class="btn btn-danger btn-sm">Deactivate</a></td>
  <%}else{ %>
  <td><a href="exam_status.jsp?quiz_id=<%=rs.getString(1)%>&status=Deactive" class="btn btn-primary btn-sm">Active</a></td>
  <%} %>
 
 
 <td><a href="topper_student.jsp?quiz_id=<%=rs.getString(1) %>" class="btn btn-primary btn-sm">Result</a></td>
 </tr>
 <%i++;} %>
 
 
 
 </table>
 </div>
 </div>
 </div>
</body>
</html>