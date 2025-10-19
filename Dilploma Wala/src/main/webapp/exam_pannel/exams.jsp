<%-- <%@page import="org.json.JSONString"%>
<%@page import="org.json.JSONStringer"%>
<%@page import="jd.ss"%>
 --%>
 <%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="BatchName.BatchName"%>
<%@page import="Batch.Batch"%>
<%@page import="Subjects.Subjects"%>
<%@page import="JSONpack.checkExam"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="JSONpack.JsonExample1"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.*" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Exams Page</title>
<style>
.rotet{
	margin-top:5%;
   margin-bottom:5%;
}

@media(max-width:900px) and (orientation:portrait){
.rotet{
            transform : rotate(-90deg);
            width:100%;
            position:absolute;
			margin-top:130%;
			margin-bottom:55%;
}
}
</style>
<script>
     //window.onbeforeunload = function() { return "Your work will be lost."; };
       //window.history.forward(); 
        //function noBack() { 
        //    window.history.forward(); 
        //} 
		

</script>
<jsp:include page="head1.jsp"></jsp:include>
</head>
<body>
<%
if(session.getAttribute("user_id")==null){
%>
<script type="text/javascript">
location.href="../login.jsp";
</script>
<%}else{
%>


    <%
 JSONObject objsub=Subjects.getsubjectsbyId(session.getAttribute("subid").toString());
 String subject=objsub.getString("sub_Name"); %>
    
 <%if(!objsub.getString("combine").equals("yes")){ %>
    <jsp:include page="header1.jsp"></jsp:include>
    <section>
    
    <div class="container rotet" style="">
<div class="row">
<div class="col-xs-12 col-sm-12  col-md-12 col-lg-12">
<table class="table table-bordered table-striped">
<tr class="info">
<th>Sr.No</th>
<th>Exam Name</th>
<th>Total Question</th>
<th>Right Answer</th>
<th>Wrong Answer</th>
<th>Total Mark</th>
<th>Time</th>
<th>Exam date</th>
<th>Standard</th>
</tr>
<tr>

<%
Connection con=DbConnect.con();
String user_idd="";
String quiz_id="";
String user_id=session.getAttribute("user_id").toString();
String sql1="SELECT user_id, quiz_id FROM arise.answerkey GROUP BY  user_id,quiz_id LIMIT 0, 1000;";
PreparedStatement ps1=con.prepareStatement(sql1);
ResultSet rs1=ps1.executeQuery();
while(rs1.next()){
	user_idd=rs1.getString(1);
	quiz_id=rs1.getString(2);
%>

<%} %>

<%
String class1=session.getAttribute("class").toString();
String subid=session.getAttribute("subid").toString();
String batchid=session.getAttribute("batchid").toString();
String sql="select *from quiz_detail where std=? and subject=? and batch=? and exam_status='Active' order by id desc";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, class1);
ps.setString(2, subid);
ps.setString(3, batchid);
ResultSet rs=ps.executeQuery();
int i=1;
while(rs.next()){
%>
<td><%=i %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td>+ <%=rs.getString(4) %></td>
<%if(rs.getString(10).equals("Yes")) {%>
<td style="color:red;" id="wrong">- <%=rs.getString(5) %></td>
<%}else{ %>
<td style="color:blue;" id="wrong">No Negative</td>
<%}%>
<td><%=(Integer.parseInt(rs.getString(3))*Integer.parseInt(rs.getString(4)))%></td>
<td><%=rs.getString(6) %> H : <%=rs.getString(7) %> min</td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(9) %></td>

<%if(checkExam.examStatus(user_id, rs.getString(1))){ %>
<td><a href="result.jsp?quiz_id=<%=rs.getString(1) %>" class="btn btn-primary btn-sm" id="">View Result</a></td>
<%}else{ %>
<td><a href="#" class="btn btn-info btn-sm" id="goFS" onclick="quiz_id(<%= rs.getString(1) %>,'<%= rs.getString(10) %>')">Start Exam</a></td>

<%-- <script>
$("#goFS").click(function(){
	var wrong=$("#wrong").text();
	location.href="instruction.jsp?quez_id="+window.btoa(<%= rs.getString(1) %>)+"&wrong="+window.btoa(wrong);
});
</script> --%>
<%} %>
</tr>
<%i++;}
%>
</table>

</div>

</div>
</div>
</section>
<%con.close();}else{
    JSONArray combarr=Subjects.getcombinesubjects(session.getAttribute("subid").toString());
    %>
    <jsp:include page="header1.jsp"></jsp:include>

    <section class="no-padding equalize" data-equalize-item=".text-box">
        <div class="row col-no-margin">
       
            <!--End: Box 1-->
            <!--Box 2-->
 <%for(int i=0;i<combarr.length();i++)
            {
             JSONObject subobj=combarr.getJSONObject(i);
             JSONObject obj=Subjects.getsubjectsbyId(subobj.getString("sub_Id"));
             
             
             
              %>
             <div class="col-lg-6">
                <div class="text-box hover-effect text-dark" >
                    <a href="exams2.jsp?xsb=<%=obj.getString("sub_Id")%>"> <i class="	fas  fa-chalkboard"></i>
                        <h2><%=obj.getString("sub_Name")%></h2>
<!--                           <a href="demo1.jsp">	<button class="btn btn-dark btn-rounded">Physics</button></a> -->
<!--                 	  		<a href="demo1.jsp">   <button class="btn btn-dark btn-rounded">Chemistry</button></a> -->
                    </a>
                </div>
            </div>
            <%
            } %>
            <!--End: Box 2-->
 
    
            <!--Box 4-->
          
            <!--End: Box 4-->
            
            
              
            <!--Box 4-->
           
            <!--End: Box 4-->
        </div>
    </section>
<%}}  %>


<jsp:include page="footer.jsp"></jsp:include>
<script>
 function quiz_id(x,i){
	var wrong=i;
	location.href="instruction.jsp?quez_id="+window.btoa(x)+"&wrong="+window.btoa(wrong);
 }
</script>



</body>
</html>