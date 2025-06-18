<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conn.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nursery</title>


</head>
<body style="background-image: url('./img/intro-carousel/21.jpg');">

	<jsp:include page="header/adminheader.jsp" />




<%


Connection con;
%>

	<div class="container" style="margin-top: 70px; margin-left: 250px">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-3 col-md-8">
					<div class="form" style="background-color: white;">



						<h2>CUSTOMER FEEDBACK</h2>
						
						<%
						con = ConnectionProvider.getConnection();
							String qur1 = "select *from feedback";
							PreparedStatement ps1 = con.prepareStatement(qur1);
							ResultSet rs1 = ps1.executeQuery();
						%>
						<table border="1px solid black" style="text-align: center;">
							<tr>
								<th>Customer Name</th>
<th>Customer Id</th>
								<th>feedback</th>
								
							</tr>

							<%
								while (rs1.next()) {
							%>
							<tr>
								<td><%=rs1.getString("username")%></td>
								<td><%=rs1.getString("uid")%></td>
								<td><%=rs1.getString("feedback")%></td>
								
							</tr>


							<%
								}
							%>







						</table>
					</div>
				</div>
			</div>
		</div>
	</div>





</body>
</html>