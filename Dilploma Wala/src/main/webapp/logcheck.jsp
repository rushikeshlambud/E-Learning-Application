<%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.PreparedStatement"%>
        <%@page import="DbConnect.DbConnect"%>
            <%@page import="java.sql.Connection"%>
                <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
                    <%

if(request.getParameter("mob").equals("admin") && request.getParameter("password").equals("admin"))
{

	session.setAttribute("User","admin");
	session.setMaxInactiveInterval(3700); 
	%>
                        <script>
                            alert("Login Successfully!");
                            location.href = "admin/index.jsp";
                        </script>
                        <% }else{

Connection con=DbConnect.con();
String query="select * from register where stdnumber=? and password=? ";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1,request.getParameter("mob"));
ps.setString(2,request.getParameter("password"));
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	session.setAttribute("user_id",rs.getString(1));
	session.setAttribute("User",rs.getString(2));
	session.setAttribute("subid",rs.getString(4));
	session.setAttribute("batchid",rs.getString(5));
	session.setAttribute("class", rs.getString(3));	
	session.setAttribute("profile",rs.getString(12));	
	session.setMaxInactiveInterval(3700); 
	con.close();
	%>
                            <script>
                                alert("Login Successfully!");
                                location.href = "index.jsp";
                            </script>
                            <% }else{
	con.close();
	%>
                                <script>
                                    alert("Try Again!");
                                    location.href = "login.jsp";
                                </script>
                                <% }}%>