<%@page import="DbConnect.DbConnect"%>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
            <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <jsp:include page="head.jsp"></jsp:include>
            </head>

            <body>
                <jsp:include page="header.jsp"></jsp:include>
                <%
Connection con = DbConnect.con();
String clid="";
%>


                    <div class="container-fluid ">
                        <div class="row">

                            <div class="col-md-2 mt-5">
                                <!-- sidebar menu -->
                                <jsp:include page="leftsidebar.jsp"></jsp:include>
                            </div>
                            <div class="col-md-10 body-pannel">
                                <H1>Student Details</H1>
                                <form method="post" action="studentupdate.jsp">
                                    <%
                String id=request.getParameter("id");
                String sql="SELECT reg.*,sub.*,batch.* from register as reg inner join subject as sub on reg.subject_id=sub.subject_id inner join batch_name as batch on reg.batch_id=batch.batch_id where reg.student_id=?";
                PreparedStatement ps=con.prepareStatement(sql);
                ps.setString(1, id);
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                %>
                                        <div class="form-group">
                                            <label for="studentname"> Name:</label> <input type="text" class="form-control" name="studentname" id="studentname" required="required" maxlength="80" value="<%=rs.getString(2) %>">

                                        </div>
                                        <div class="form-group ">
                                            <label for="inputState">class :</label> <select id="class" name="class" class="form-control getsub">
                             <option value="<%=rs.getString(3) %>"><%=rs.getString(3)%></option>
							<option value="11th">11th (Momentum)</option>
							<option value="12th">12th (Spectrum)</option>
							<option value="Repeater">Repeater (Focus)</option>
                            <%clid=rs.getString(3);%>
						</select>
                                        </div>
                                        <div class="form-group ">
                                            <label for="inputSubject">Subject :</label> <select id="subject" name="subject_id" class="form-control sub">

							<%
								
								String sql1 = "SELECT * FROM subject where standard=? and subject_status='Activated'";
								PreparedStatement ps1 = con.prepareStatement(sql1);
                                ps1.setString(1,clid);
								ResultSet rs1 = ps1.executeQuery();
								while (rs1.next()) {
									if(rs.getString(4).equals(rs1.getString(1))){
							%>
							<option value="<%=rs1.getString(1)%>" selected="selected"><%=rs1.getString(2)%></option>
							<%
								
								}else{
									%>
									<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
									<%
								}
								}
								
							%>

						</select>
                                        </div>
                                        <div class="form-group ">
                                            <label for="inputBatch">Batch :</label> <select id="batch" name="batch_id" class="form-control batch">
						<%
								
								 sql1 = "SELECT * FROM batch_name where subject_id=?";
								 ps1 = con.prepareStatement(sql1);
								 ps1.setString(1,rs.getString(4));
								 rs1 = ps1.executeQuery();
								while (rs1.next()) {
									if(rs.getString(5).equals(rs1.getString(1))){
							%>
							<option value="<%=rs1.getString(1)%>" selected="selected"><%=rs1.getString(3)%></option>
							<%
								
								}else{
									%>
									<option value="<%=rs1.getString(1)%>"><%=rs1.getString(3)%></option>
									<%
								}
								}
								
							%>
						</select>
                                        </div>
                                        <div class="form-group">
                                            <label for="stdnumber">Student Mobile Number:</label>



                                            <input type="number" class="form-control" name="stdnumber" id="stdnumber" required="required" maxlength="80" value="<%=rs.getString(6) %>">
                                        </div>


                                        <div class="form-group">
                                            <label for="password">Password:</label> <input type="text" class="form-control" name="password" id="password" required="required" maxlength="80" value="<%=rs.getString(7) %>">
                                        </div>

                                        <div class="form-group">
                                            <label for="surname">Email:</label> <input type="email" class="form-control" name="email" id="email" required="required" maxlength="80" value="<%=rs.getString(8) %>">
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Address:</label> <input type="text" class="form-control" name="address" id="address" required="required" maxlength="80" value="<%=rs.getString(9) %>">
                                        </div>

                                        <div class="form-group">
                                            <label for="surname">Parents Number:</label> <input type="number" class="form-control" name="prtnumber" id="prtnumber" required="required" maxlength="80" value="<%=rs.getString(10) %>" autocomplete="off">
                                        </div>


                                        <div class="form-group ">
                                            <label for="inputState">Gender</label> <select id="gender" name="gender" class="form-control">
                           <option value="<%=rs.getString(11) %>"><%=rs.getString(11) %></option>
							<option>Male</option>
							<option>Female</option>

						</select>
                                        </div>


                                        <div class="form-group">
                                            <label for="ramount">Paid Amount:</label>
                                            <input type="number" name="ramount" value="<%=rs.getString(15)%>">
                                        </div>

                                        <div class="form-group">
                                            <label for="ramount">Profile Status:</label>


                                            <select id="profile" name="profile" class="form-control">
                          	
							<option value="paid" <%if(rs.getString(12).equals("paid")){ %>selected<%} %>>Paid</option>
							<option value="unpaid"<%if(rs.getString(12).equals("unpaid")){ %>selected<%} %>>Unpaid</option>
							</select>

                                        </div>
                                        <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                                        <button type="submit" name="btnsignup" id="" class="btn btn-info">Update</button>
                                        <%}%>
                                </form>
                                <%con.close();%>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="footer.jsp"></jsp:include>


                    <script type="text/javascript">
                        $("#subject").click(function() {
                            var fd = $(this).val();
                            $.ajax({
                                url: 'fetsch_sub_name.jsp',
                                type: 'POST',
                                // data: fd,
                                data: $(this).serialize(),
                                success: function(data) {
                                    $("#batch").html(data.trim());
                                    //window.location.reload();

                                }
                            });
                        });


                        $('.getsub').change(function() {

                            if ($(this).val() != 0) {
                                $.ajax({
                                    url: 'getsubjects.jsp',
                                    data: 'std=' + $(this).val(),
                                    type: 'post',
                                    success: function(r) {
                                        $('.sub').html(r);
                                    }
                                });
                            }
                        });

                        $('.sub').change(function() {

                            if ($(this).val() != 0) {
                                $.ajax({
                                    url: 'admin/getbatch.jsp',
                                    data: 'sub=' + $(this).val(),
                                    type: 'post',
                                    success: function(r) {
                                        $('.batch').html(r);
                                    }
                                });
                            }
                        });
                    </script>
            </body>

            </html>