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

response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Cache-Control","no-store"); // HTTP 1.1
response.setDateHeader("Expires", 0);





if(session.getAttribute("username")==null){
	   
    response.sendRedirect("custLogin.jsp?Result=");       
}
else{




String username=session.getAttribute("username").toString();
String uid=session.getAttribute("id").toString();

Connection con;
%>

	<div class="container" style="margin-top: 70px; margin-left: 100px">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-1 col-md-11">
					<div class="form" style="background-color: white;">



						<h2>All PLANT BOOKING DETAILS</h2>
						
						<%
						con = ConnectionProvider.getConnection();
							String qur1 = "select *from plant_book where cust_id='"+uid+"' ";
							PreparedStatement ps1 = con.prepareStatement(qur1);
							ResultSet rs1 = ps1.executeQuery();
							
							
							String qur2 = "select *from pot_book where cust_id='"+uid+"' ";
							PreparedStatement ps2 = con.prepareStatement(qur2);
							ResultSet rs2 = ps2.executeQuery();
							
							
							String qur3 = "select *from seed_book where cust_id='"+uid+"' ";
							PreparedStatement ps3 = con.prepareStatement(qur3);
							ResultSet rs3 = ps3.executeQuery();
							
							
							String qur4 = "select *from pebbles_book where cust_id='"+uid+"' ";
							PreparedStatement ps4 = con.prepareStatement(qur4);
							ResultSet rs4 = ps4.executeQuery();
							
							
							
							
							
						%>
						<table border="1px solid black" style="text-align: center;">
							<tr>
								<th>Customer Name</th>

								<th>Plant Catagorys</th>
								<th>Item Name</th>
								<th>Item Quantity</th>
								<th>Total Cost</th>
								<th>Customer Address</th>
								<th>Cust Payment Type</th>
								<th>Payment Status</th>
							</tr>

							<%
								while (rs1.next()) {
							%>
							<tr>
								<td><%=rs1.getString("custname")%></td>
								<td><%=rs1.getString("plant_cat")%></td>
								<td><%=rs1.getString("item_name")%></td>
								<td><%=rs1.getString("item_quant")%></td>
								<td><%=rs1.getString("total_cost")%></td>
								<td><%=rs1.getString("address") %></td>
								<td><%=rs1.getString("payment_type") %></td>
								<td><%=rs1.getString("payment_status") %></td>
							</tr>


							<%
								}
							%>



<%
								while (rs2.next()) {
							%>
							<tr>
								<td><%=rs2.getString("custname")%></td>
								<td><%=rs2.getString("plant_cat")%></td>
								<td><%=rs2.getString("item_name")%></td>
								<td><%=rs2.getString("item_quant")%></td>
								<td><%=rs2.getString("total_cost")%></td>
								<td><%=rs2.getString("address") %></td>
								<td><%=rs2.getString("payment_type") %></td>
								<td><%=rs2.getString("payment_status") %></td>
							</tr>


							<%
								}
							%>


<%
								while (rs3.next()) {
							%>
							<tr>
								<td><%=rs3.getString("custname")%></td>
								<td><%=rs3.getString("plant_cat")%></td>
								<td><%=rs3.getString("item_name")%></td>
								<td><%=rs3.getString("item_quant")%></td>
								<td><%=rs3.getString("total_cost")%></td>
								<td><%=rs3.getString("address") %></td>
								<td><%=rs3.getString("payment_type") %></td>
								<td><%=rs3.getString("payment_status") %></td>
							</tr>


							<%
								}
							%>


<%
								while (rs4.next()) {
							%>
							<tr>
								<td><%=rs4.getString("custname")%></td>
								<td><%=rs4.getString("plant_cat")%></td>
								<td><%=rs4.getString("item_name")%></td>
								<td><%=rs4.getString("item_quant")%></td>
								<td><%=rs4.getString("total_cost")%></td>
								<td><%=rs4.getString("address") %></td>
								<td><%=rs4.getString("payment_type") %></td>
								<td><%=rs4.getString("payment_status") %></td>
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



<%} %>







</body>
</html>