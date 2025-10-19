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
int maxsiz=10024*10024;

//String newpath="E:/arise/ariselatur/WebContent/exam_pannel/admin/test//";
//String tempath="E:/arise/ariselatur/WebContent/exam_pannel/admin/temp//";
String newpath="C://Users//A//eclipse-workspace//Elearning//src//main//webapp//exam_pannel//admin//test//";

String tempath="C://Users//A//eclipse-workspace//Elearning//src//main//webapp//exam_pannel//admin//temp//";
MultipartRequest m=new MultipartRequest(request,tempath,1048*1048*1048);

int count=Integer.parseInt(m.getParameter("count").toString());
int i=0;
for(i=1;i<=count;i++){
String image=m.getFilesystemName("image"+i);
String filepath=qImages.setPath(image, m, newpath, tempath);
String answer=m.getParameter("answer"+i);
String question_id=m.getParameter("question_id");
String question=m.getParameter("question");
String count1=m.getParameter("remain_ques");
Connection con=DbConnect.con();
String sql="insert into question(image, answer, quiz_id, quiz_ques, remain_ques)values(?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, filepath);
ps.setString(2, answer);
ps.setString(3, question_id);
ps.setString(4, question);
ps.setString(5, count1);
int done=ps.executeUpdate();
if(done>0){
%>
<script type="text/javascript">
alert("Added Success!!");
location.href="add_ques.jsp?ques_id=<%=question_id%>&ques=<%=question%>";
</script>
<%}else{ %>
<script type="text/javascript">
alert("Faild!! Try Again!!");
location.href="add_ques.jsp?ques_id=<%=question_id%>&ques=<%=question%>";
</script>
<%}} %>
</body>
</html>