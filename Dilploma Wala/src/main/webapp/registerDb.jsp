
<%@page import="transaction.transaction"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="DbConnect.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.user
{
width:auto;
border-radius:5px;
padding:20px;
position: absolute;
top:50%;
left:50%;
text-align:center;
transform:translate(-50%,-50%);
background-color: #696767;
}
.user h3
{
font-size: 25px;
color:white;
}
p
{
color:white;
}
a
{
margin:15px 10px;
text-decoration:none;
padding:10px 5px;
background-color:white;
color:black;
border:2px solid black;
border-radius:20em;
transition:1s;
}
a:hover
{
color:black;
background-color: white;
border:1px solid black;
border-radius: 20em;
}

@media(max-width:800px)
{
.user
{
width:80%;
}
}
</style>
</head>
<body>
<%
try{
	String newpath="C://Users//A//eclipse-workspace//Elearning//src//main//webapp//Images//transaction//";
	String tempath="C://Users//A//eclipse-workspace//Elearning//src//main//webapp//Images//trans//";
MultipartRequest m=new MultipartRequest(request,tempath,10024*1024);



String screenshot=m.getFilesystemName("file");
String filepath=transaction.setPath(screenshot, m, newpath, tempath);

Connection con=DbConnect.con();
String studentname=m.getParameter("studentname");
String classs=m.getParameter("class");
String subject_id=m.getParameter("subject_id");
String batch_id=m.getParameter("batch_id");
String stdnumber=m.getParameter("stdnumber");
String password=m.getParameter("password");
String email=m.getParameter("email");
String address=m.getParameter("address");
String prtnumber=m.getParameter("prtnumber");
String gender=m.getParameter("gender");
String ramount=m.getParameter("ramount");
String transact=m.getParameter("transactid");

String sql="insert into register(studentname, class, subject_id, batch_id, stdnumber, password, email, address, prtnumber, gender, profile,screenshot, trasaction, regamount,regdate,regtime)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,curdate(),curtime())";
PreparedStatement ps=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
ps.setString(1, studentname);
ps.setString(2, classs);
ps.setString(3, subject_id);
ps.setString(4, batch_id);
ps.setString(5, stdnumber);
ps.setString(6, password);
ps.setString(7, email);
ps.setString(8, address);
ps.setString(9, prtnumber);
ps.setString(10, gender);
ps.setString(11, "unpaid");
ps.setString(12,filepath);
ps.setString(13,"");
ps.setString(14,ramount);
int done=ps.executeUpdate();
if(done>0)
{
ResultSet rs=ps.getGeneratedKeys();
if(rs.next()){
response.sendRedirect("status.jsp?id="+rs.getString(1));
}}else{%>
<script type="text/javascript">
alert("Faild!! Try Again..");
location.href="register.jsp";
</script>
<%}}
catch(Exception e){%>
   
<div class="user">
<h3>User Already Exist!</h3>
<p>User already Register with given Details!</p>
<bR>
<a href="register.jsp"> Back to Registration</a> <a href="login.jsp"> Login</a>
</div>
<% System.out.println(e);} %>
</body>
</html>