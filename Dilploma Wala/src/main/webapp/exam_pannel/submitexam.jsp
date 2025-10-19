<%@page import="JSONpack.JsonExample1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>'
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
<%
if(session.getAttribute("user_id")==null){
%>
<script>
location.href="exams.jsp";
</script>
<%}
else{
%>

<%
String user_id=session.getAttribute("user_id").toString();
String data=request.getParameter("data");
String qquiz_id=request.getParameter("qquiz_id");
try{
	JsonExample1.fetchData(data, user_id,qquiz_id);
	response.sendRedirect("exams.jsp");
	//response.sendRedirect("result_detail.jsp");
}catch(Exception e)
{
	
}
/* mydata.getjsondata(data); */

%>
<b id="">User_Id : <%=user_id%></b><br><br>
<b id="">Quiz_id : <%=qquiz_id%></b><br><br>
<b id="data"><%=data%></b><br><br>
<b id="data1"></b><br><br>
<b id="data2"></b>

<script>

var x=$("#data").text();
document.getElementById("data1").innerHTML=window.atob(x);
</script>
<%}%>
</body>
</html>