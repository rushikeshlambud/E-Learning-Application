<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>

<%@page import="BatchName.BatchName"%>
<%@page import="Batch.Batch"%>
<%@page import="Subjects.Subjects"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="JSONpack.checkExam"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
<style>
    .rotet{
        margin-top:5%;
       margin-bottom:5%;
    }
    
    @media(max-width:900px) and (orientation:portrait){
    .rotet{
                transform : rotate(-270deg);
                width:100%;
             
                margin-top:40%;
                margin-bottom:120%;
    }
    }
    </style>
<jsp:include page="head1.jsp"></jsp:include>
</head>
<body>
 <div class="body-inner">
<jsp:include page="header1.jsp"></jsp:include>

<%if(session.getAttribute("User")!=null){ %>
 <%JSONObject objsub=Subjects.getsubjectsbyId(session.getAttribute("subid").toString());
 String subject=objsub.getString("sub_Name"); %> 
      
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
        String batchname=Batch.getBatchNamebysubid(request.getParameter("xsb"));
        String batchid=Batch.getBatch(request.getParameter("xsb"),batchname);

        Connection con=DbConnect.con();
        String user_idd="";
        String quiz_id="";
        String user_id=session.getAttribute("user_id").toString();
        String sql1="select user_id,quiz_id from answerkey group by quiz_id";
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
        String sql="select *from quiz_detail where std=? and subject=? and batch=? and exam_status='Active' order by id desc";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, class1);
        ps.setString(2, request.getParameter("xsb"));
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
        <td><%=rs.getString(6) %> : <%=rs.getString(7) %></td>
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
    
    <%con.close();}else{ %>
     <section id="page-content">
            <div class="container">
                <div class="row">
                    <div class="content col-lg-12 mx-auto">

                  
                        <div class="text-center">
                            <h2 class="text-medium">Log in Now</h2>
                            <p class="lead m-b-40">For More Information Connect with us</p>

                            <button type="button" class="btn btn-dark btn-lg"><a href="login.jsp">Log in</a></button>
                            
                        </div>

                        
               
                </div>
            </div>
        </section>
    <%}%>
<jsp:include page="footer.jsp"></jsp:include>
<script>
 function quiz_id(x,i){
	var wrong=i;
	location.href="instruction.jsp?quez_id="+window.btoa(x)+"&wrong="+window.btoa(wrong);
 }
</script>
</div>
</body>
</html>