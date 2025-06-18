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

	<jsp:include page="header/custheader.jsp" />




<%
String username=session.getAttribute("username").toString();
String uid=session.getAttribute("id").toString();

response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Cache-Control","no-store"); // HTTP 1.1
response.setDateHeader("Expires", 0);





if(session.getAttribute("username")==null){
	   
    response.sendRedirect("custLogin.jsp?Result=");       
}
else{





Connection con;
%>

	<div class="container" style="margin-top: 70px; margin-left: 100px">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-1 col-md-11">
					<div class="form" style="background-color: white;">



						<h2>View Cart</h2>
						
						<%
						con = ConnectionProvider.getConnection();
						int i=0;	
						String qur1 = "select *from cart where custname='"+username+"' AND payment_status='not done'";
							PreparedStatement ps1 = con.prepareStatement(qur1);
							ResultSet rs1 = ps1.executeQuery();
																	
							
							
						%>
						<form action="plantPaymant.jsp" method="post">
						<table border="1px solid black" style="text-align: center;">
							<tr>
								<th>Sr. No</th>

								<th>Item Type</th>
								<th>Item Name</th>
								<th>Plant Catagory</th>
								<th>Total Cost</th>
								<th>Payment Status</th>
								<th>Date</th>
							</tr>

							<%
								while (rs1.next()) {
									i++;
							%>
							<tr>
							<td><%=i %></td>
								<td><%=rs1.getString("itemtype")%></td>
								<td><%=rs1.getString("itemname")%></td>
								<td><%=rs1.getString("plant_cat")%></td>
								<td><%=rs1.getString("total_cost")%></td>
								<td><%=rs1.getString("payment_status")%></td>
								<td><%=rs1.getString("date") %></td>
							</tr>


							<%
								}
							%>


<tr>
<td>
<input type="submit" value="Make Payment">
</td></tr>
						</table>
						
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



<%} %>







</body>
</html>