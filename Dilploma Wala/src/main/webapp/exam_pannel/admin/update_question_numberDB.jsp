<%@page import="setPath.qImages"%>
<%@page import="DbConnect.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String newpath="C://Users//A//eclipse-workspace//Elearning//src//main//webapp//exam_pannel//admin//test//";

String tempath="C://Users//A//eclipse-workspace//Elearning//src//main//webapp//exam_pannel//admin//temp//";
MultipartRequest m=new MultipartRequest(request,tempath,1048*1048*1048);
String image=m.getFilesystemName("image");

String filepath=qImages.setPath(image, m, newpath, tempath);


String image1=m.getFilesystemName("image");
String answer=m.getParameter("answer");
String id=m.getParameter("id");
String quiz_id=m.getParameter("quiz_id");
Connection con=DbConnect.con();
String sql="";
PreparedStatement ps=null;
if(image1!=null){
	sql="update question set image=?,answer=? where id=?";
	ps=con.prepareStatement(sql);
	ps.setString(1, filepath);
	ps.setString(2, answer);
	ps.setString(3, id);
}else{
	
	sql="update question set answer=? where id=?";
	ps=con.prepareStatement(sql);
	ps.setString(1, answer);
	ps.setString(2, id);
}
int done=ps.executeUpdate();
if(done>0){
%>
<script type="text/javascript">
alert("Update Success!!");
location.href="update_question.jsp?quiz_id=<%=quiz_id%>";
</script>
<%}else{ %>
<script type="text/javascript">
alert("Try Again!!");
location.href="update_question.jsp?quiz_id=<%=quiz_id%>";
</script>
<%} %>
</body>
</html>