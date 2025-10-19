<%@page import="DbConnect.DbConnect"%>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
            <%
   Connection con=DbConnect.con();
    String sql="";
    PreparedStatement ps=null;
    ResultSet rs=null;
    %>
                <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                <html>

                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                    <style type="text/css">
                        #div {
                            border: 2px solid black;
                            padding: 30px;
                        }
                    </style>
                    <title>Add Question</title>
                    <jsp:include page="head.jsp"></jsp:include>
                </head>

                <body>
                    <jsp:include page="header.jsp"></jsp:include>

                    <div class="container">
                        <form action="add_quesDB.jsp" method="post" enctype="multipart/form-data">
                            <%
String id=request.getParameter("ques_id");
 sql="select * from quiz_detail where id=?";

 ps=con.prepareStatement(sql);
 ps.setString(1,id);
 rs=ps.executeQuery();
int i=1;
if(rs.next()){
%>
                                Total Question: <b><%=rs.getString(3) %></b><br>
                                <input type="hidden" value="<%=rs.getString(3) %>" name="question" id="question">
                                <input type="hidden" value="<%=rs.getString(1) %>" name="question_id" id="question_id">
                                <input type="hidden" name="count" id="count">
                                <%} %>

                                    <%
String id1=request.getParameter("ques_id");
 sql="select count(id),quiz_id from question where quiz_id=?";
 ps=con.prepareStatement(sql);
 ps.setString(1, id1);
 rs=ps.executeQuery();
if(rs.next()){
%>
                                        <%if(rs.getString(1).equals("0")){ %>
                                            Added Question: <b>0</b>
                                            <input type="hidden" value="<%=rs.getString(1) %>" id="ques_id">
                                            <%}else{ %>
                                                <input type="hidden" value="<%=rs.getString(1) %>" name="remain_ques" id="remain_ques"> Added Question: <b><%=rs.getString(1) %></b><br>
                                                <input type="hidden" value="<%=rs.getString(1) %>" id="ques_id"> Remain Question: <b id="remain"></b>
                                                <%} %>
                                                    <%}
con.close();
%>
                                                        <div class="row" id="ques">

                                                        </div>
                                                        <br>
                                                        <input type="submit" value="Submit Quiz and Next" class="btn btn-info">
                                                        <div id="h-warn">

                                                            <h1>All Question are already added...!</h1>
                                                            <a href="quize_detail_view.jsp" class="btn btn-warning">Back</a>
                                                        </div>
                        </form>
                        <br><br><br>
                    </div>


                    <script type="text/javascript">
                        $("#h-warn").hide();
                        var no_of_ques = $("#question").val();
                        $("#remain_ques1").val(no_of_ques);
                        var count = 0;
                        var i = 0;
                        var ques_id = $("#ques_id").val()
                        var ques_no = 0;
                        if (ques_id == "0") {
                            ques_no = 0;
                        } else {
                            ques_no = ques_id;
                        }
                        for (i = 1; i <= no_of_ques; i++) {
                            for (i == 1; i <= 5; i++) {
                                count++;
                                ques_no++;
                                $("#ques").stop();

                                $("#ques").append("" +
                                    "<div id='div' class='col-md-6'>" +
                                    "<b>Question No:" + ques_no + "</b><br><br>" +
                                    "<h5>Upload Question Image</h5>" +
                                    "<input type='file' name='image" + i + "' class='form-control' required><br>" +
                                    "<h5>Select Answer</h5>" +
                                    "<select name='answer" + i + "' class='form-control'>" +
                                    "<option>A</option> <option>B</option>" +
                                    "<option>C</option>  <option>D</option>" +
                                    "</option>" +
                                    "</div><br>" +
                                    "");
                            }
                        }
                        $("#count").val(count);
                        remain_ques = $("#remain_ques").val();
                        remain = no_of_ques - remain_ques;
                        $("#remain").text(remain);

                        if (remain == 0) {
                            $("#ques,.btn-info").hide();
                            $("#h-warn").show();

                        }
                    </script>



                </body>

                </html>