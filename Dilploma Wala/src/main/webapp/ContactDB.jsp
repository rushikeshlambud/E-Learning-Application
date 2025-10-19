<%@page import="java.sql.PreparedStatement"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String name = request.getParameter("widget-contact-form-name");
String email = request.getParameter("widget-contact-form-email");
String subject = request.getParameter("widget-contact-form-subject");
String message = request.getParameter("widget-contact-form-message");

Connection con = DbConnect.con();
String query ="insert into feedback(name ,email,subject , message) values (?,?,?,?)";
PreparedStatement ps = con.prepareStatement(query);
ps.setString(1, name);
ps.setString(2,email );
ps.setString(3,subject );
ps.setString(4,message );

int result = ps.executeUpdate();

if(result >0 )
{
	   %> 
	     <script type="text/javascript">
         alert("thak you for visiting the page..!");
         location.href="contact.jsp"
    </script>
	   <%
}
else {
	   %> 
	      <script type="text/javascript">
         alert("Please enter a valid message");
         location.href="contact.jsp"

    </script>
	   <%
	   
}

%>>