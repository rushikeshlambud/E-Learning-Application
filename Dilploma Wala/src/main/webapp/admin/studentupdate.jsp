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
                    .user {
                        width: auto;
                        border-radius: 5px;
                        padding: 20px;
                        position: absolute;
                        top: 50%;
                        left: 50%;
                        text-align: center;
                        transform: translate(-50%, -50%);
                        background-color: #696767;
                    }
                    
                    .user h3 {
                        font-size: 25px;
                        color: white;
                    }
                    
                    p {
                        color: white;
                    }
                    
                    a {
                        margin: 15px 10px;
                        text-decoration: none;
                        padding: 10px 5px;
                        background-color: white;
                        color: black;
                        border: 2px solid black;
                        border-radius: 20em;
                        transition: 1s;
                    }
                    
                    a:hover {
                        color: black;
                        background-color: white;
                        border: 1px solid black;
                        border-radius: 20em;
                    }
                    
                    @media(max-width:800px) {
                        .user {
                            width: 80%;
                        }
                    }
                </style>
            </head>

            <body>
                <%
try{
Connection con=DbConnect.con();
String studentname=request.getParameter("studentname");
String classs=request.getParameter("class");
String subject_id=request.getParameter("subject_id");
String batch_id=request.getParameter("batch_id");
String stdnumber=request.getParameter("stdnumber");
String password=request.getParameter("password");
String email=request.getParameter("email");
String address=request.getParameter("address");
String prtnumber=request.getParameter("prtnumber");
String gender=request.getParameter("gender");
String ramount=request.getParameter("ramount");

String sql="update register set studentname=?, class=?, subject_id=?, batch_id=?, stdnumber=?, password=?, email=?, address=?, prtnumber=?, gender=?, profile=?,regamount=? where student_id=?";
PreparedStatement ps=con.prepareStatement(sql);
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
ps.setString(11, request.getParameter("profile"));
ps.setString(12, ramount);
ps.setString(13,request.getParameter("id"));
int done=ps.executeUpdate();
con.close();
if(done>0){ %>
                    <script type="text/javascript">
                        alert("Updated Successfully !");
                        location.href = "student_edit.jsp?id=<%=request.getParameter("id")%>";
                    </script>
                    <%

}else{%>
                        <script type="text/javascript">
                            alert("Faild!! Try Again..");
                            location.href = "register.jsp";
                        </script>
                        <%}}
catch(Exception e){%>
                            <div class="user">
                                <h3>Try Again!</h3>
                                <p>User already Register with given Details!</p>
                                <bR>
                            </div>
                            <%} %>
            </body>

            </html>