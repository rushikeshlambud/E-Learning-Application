<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import=" java.net.URLEncoder"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DbConnect.DbConnect"%>
<%@page import="java.sql.Connection"%>
<script>
wind window.history.forward();
</script>
    <%
    int iu=0;
    Connection con=DbConnect.con();
    PreparedStatement ps=con.prepareStatement("select * from register where student_id=?");
    ps.setString(1,request.getParameter("id"));
    ResultSet rs=ps.executeQuery();
    String message ="";

    String mobile="";
    String name="";
    String sendp="";
    String passw="";

    if(request.getParameter("payment_status").equals("Credit")){
    PreparedStatement ps1=con.prepareStatement("update register set profile='paid',trasaction=?,regamount=regamount+? where student_id=? and trasaction!=?");
    ps1.setString(1,request.getParameter("payment_id"));
    ps1.setString(2,request.getParameter("fees"));
    ps1.setString(3,request.getParameter("id"));
    ps1.setString(4,request.getParameter("payment_id"));
    iu=ps1.executeUpdate();
    }

	if(iu>0){
    if(rs.next()){
        name=rs.getString(2);
        mobile=rs.getString(6);
        passw=rs.getString(7);
        
    	message="<center><img src='http://ariseacademylatur.com/Images/logo/logo.png' style='height:80px;width:140px;'><h1>Welcome "+rs.getString(2)+"</h1><h4>Thanks for Registration!</h4><h5>Your Account Will activate soon!</h5></center><center><h5>Arise Login Details</h5><center><p>User-Id : "+rs.getString(6)+"</p><p>Password : "+rs.getString(7)+"</p>";
        
    	if(request.getParameter("payment_status").equals("Credit")){
    	sendp="Welcome "+name+" Thanks for Registration!  Your Account is activated!  Arise Login Details  User-Id : "+mobile+" Password : "+passw+" ";
    	}
    	else{
    		sendp="Welcome "+name+" Thanks for Registration!  Your Account Will activate after paying fee amount !  Arise Login Details  User-Id : "+mobile+" Password : "+passw+" ";

    	}
    }
con.close();
String apikey = "TTczP9jf0uKH4ogD";
String senderId = "ARISEN";
String route="4";
URLConnection myURLConnection=null;
URL myURL=null;
BufferedReader reader=null;
String encoded_message=URLEncoder.encode(sendp);
String mainUrl="http://mysmsshop.in/V2/http-api.php?";


StringBuilder sbPostData= new StringBuilder(mainUrl);
sbPostData.append("apikey="+apikey);
sbPostData.append("&senderid="+senderId);
sbPostData.append("&number="+mobile);
sbPostData.append("&message="+encoded_message);

mainUrl = sbPostData.toString();

try
{
//prepare connection
myURL = new URL(mainUrl);
myURLConnection = myURL.openConnection();
myURLConnection.connect();
reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
String success="Your message sent sucessfully";
reader.close();
response.sendRedirect("status.jsp");
}
catch (IOException e)
{
e.printStackTrace();
}
	}
	else{
		response.sendRedirect("login.jsp");
	}
    %>