<%@page import="DbConnect.DbConnect"%>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
            <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <title>quiz view</title>
                <jsp:include page="head.jsp"></jsp:include>
            </head>

            <body style="background: gray;">
                <jsp:include page="header.jsp"></jsp:include>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12 table-responsive">
                            <table class="table table-striped table-dark" style="background:;">
                                <tr>
                                    <!-- <th>Sr.No</th> -->
                                    <th>Exam Name</th>
                                    <th>Total Question</th>
                                    <th>Right Answer</th>
                                    <th>Wrong Answer</th>
                                    <th>Time</th>
                                    <th>Exam date</th>
                                    <th>Standard</th>
                                    <th>Add Question</th>
                                </tr>
                                <tr>
                                    <%
Connection con=DbConnect.con();
String sql="select *from quiz_detail order by id desc";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
int i=1;
while(rs.next()){
%>
                                        <%-- <td><%=i %></td> --%>
                                            <td>
                                                <%=rs.getString(2) %>
                                            </td>
                                            <td>
                                                <%=rs.getString(3) %>
                                            </td>
                                            <td>
                                                <%=rs.getString(4) %>
                                            </td>

                                            <%if(rs.getString(10).equals("Yes")) {%>
                                                <td style="color:red;">-
                                                    <%=rs.getString(5) %>
                                                </td>
                                                <%}else{ %>
                                                    <td style="color:white;">No Negative</td>
                                                    <%}%>
                                                        <td>
                                                            <%=rs.getString(6) %>h:
                                                                <%=rs.getString(7) %>m</td>
                                                        <td>
                                                            <%=rs.getString(8) %>
                                                        </td>
                                                        <td>
                                                            <%=rs.getString(9) %>
                                                        </td>
                                                        <td><a href="add_ques.jsp?ques_id=<%= rs.getString(1) %>&&ques=<%=rs.getString(3) %>" class="btn btn-danger btn-sm">Add Question</a></td>
                                                        <td><a href="update_question.jsp?quiz_id=<%= rs.getString(1) %>" class="btn btn-info btn-sm">Update Question</a></td>
                                                        <!-- <td><a href="#" class="btn btn-primary btn-sm">Update Quiz</a></td> -->
                                </tr>
                                <%i++;} %>
                            </table>
                        </div>
                    </div>
                </div>
            </body>

            </html>