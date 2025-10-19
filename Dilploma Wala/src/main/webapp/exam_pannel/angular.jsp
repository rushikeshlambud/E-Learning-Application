<%
try{
response.setHeader("Access-Control-Allow-Origin","*");
response.setHeader("Access-Control-Allow-Credentials","true");
response.setHeader("Access-Control-Allow-Methods","PUT, GET, POST, DELETE");
response.setHeader("Access-Control-Allow-Headers","Origin, X-Requested-With, Content-Type, Accept");
response.setHeader("Content-Type: application/json;","charset=UTF-8");


Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_pannel","root","root");

%>
<%@page import="java.sql.*" %>
<%
String name=request.getParameter("Name");
String mobile=request.getParameter("Mobile");
String city=request.getParameter("City");
String address=request.getParameter("Address");
String email=request.getParameter("Email");
String password=request.getParameter("Password");
String CPassword=request.getParameter("CPassword");
String sql="insert into user(name,mobile,city,address,email,password,cpass)values(?,?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, mobile);
ps.setString(3, city);
ps.setString(4, address);
ps.setString(5, email);
ps.setString(6, password);
ps.setString(7, CPassword);
ps.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
}
%>
