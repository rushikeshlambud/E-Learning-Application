<%@page import="java.sql.PreparedStatement"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="Notes.Notes"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
try{
int maxsiz=10024*10024;

//String newpath="E:/project/AriseAcademyLatur/WebContent/notes/";
//String tempath="E:/project/AriseAcademyLatur/WebContent/temporary/";
String newpath="C://Users//A//eclipse-workspace//Elearning//src//main//webapp//notes//";
String tempath="C://Users//A//eclipse-workspace//Elearning//src//main//webapp//temporary//";
MultipartRequest m=new MultipartRequest(request,"C://Users//A//eclipse-workspace//Elearning//src//main//webapp//temporary//",maxsiz);
String imagename=m.getFilesystemName("file");
String filepath=Notes.setPath(imagename, m, newpath, tempath);

Connection con=DbConnect.con();
String query="insert into notes (title, path, standard, subject, batch)values(?,?,?,?,?)";
String std=m.getParameter("std");
String subject=m.getParameter("sub");
String batch=m.getParameter("batch");
String title=m.getParameter("Title");

PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,title);
ps.setString(2,filepath);
ps.setString(3,std);
ps.setString(4,subject);
ps.setString(5,batch);
int i=ps.executeUpdate();
con.close();
if(i>0){
%>
<script>
alert("File Upload Successfully!");
location.href="uploadnotes.jsp";
</script>
<%}else{%>
<script>
alert("Please Try Again");
location.href="uploadnotes.jsp";
</script>
<%}}
catch(Exception e){%>
<script>
console.log(<%=e%>);
alert("System Error !");
location.href="uploadnotes.jsp";
</script>
<%}%>