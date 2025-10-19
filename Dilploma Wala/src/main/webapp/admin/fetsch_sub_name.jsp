<%@page import="DbConnect.DbConnect"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>

<%
								Connection con1 = DbConnect.con();
								String subject_id = request.getParameter("subject_id");
								String sql1 = "SELECT bn.*,s.* FROM batch_name as bn inner join subject as s on bn.subject_id=s.subject_id where bn.status='Activated' and bn.subject_id=?";
								PreparedStatement ps1 = con1.prepareStatement(sql1);
								ps1.setString(1, subject_id);
								ResultSet rs1 = ps1.executeQuery();
								while (rs1.next()) {
							%>
								<option value="<%=rs1.getString(1)%>"><%=rs1.getString(3)%></option>
							
							<%
								}
								con1.close();
							%>
