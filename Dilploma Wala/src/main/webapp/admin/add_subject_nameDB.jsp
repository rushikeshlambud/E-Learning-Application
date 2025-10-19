
<%@page import="DbConnect.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String sub_name=request.getParameter("sub_name");
Connection con= DbConnect.con();
String sql="insert into subject(sub_name, subject_status,standard,combine)values(?,'deactivate',?,?)";
PreparedStatement ps=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
ps.setString(1, sub_name);
ps.setString(2,request.getParameter("std"));
ps.setString(3,request.getParameter("combine"));
int done=ps.executeUpdate();
if(done>0){
	ResultSet rs=ps.getGeneratedKeys();
	if(rs.next()){
	String cnt=request.getParameter("count");
	int count;
	if(cnt!=null)
	{
		count=Integer.parseInt(cnt);
		for(int i=1;i<=count;i++)
		{
			
			String param=request.getParameter("sub"+i);
			
			
			 if(param!=null)
			{
				
				ps=con.prepareStatement("insert into combinesubjects(subject_id, c_subid)values(?,?)");
				ps.setString(1, rs.getString(1));
				ps.setString(2, param);
				ps.executeUpdate(); 
			} 
		}
	}
	}
	con.close();
	 response.sendRedirect("add_subject_name.jsp");
}else{
	con.close();
	%>
	<script type="text/javascript">
	alert("Try Again!!");
	location.href="add_subject_name.jsp";
	</script>
<%}
%>
</body>
</html>