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
<body style="background-image: url('./img/intro-carousel/18.jpg');">

	<jsp:include page="header/adminheader.jsp" />


<%

String username=session.getAttribute("username").toString();


String fid=request.getParameter("fid");
String itemname=request.getParameter("itemname");
String item_type=request.getParameter("item_type");
String quant=request.getParameter("quant");
String price=request.getParameter("price");
String item=request.getParameter("item");

%>

	<div class="container" style="margin-top: 70px; margin-left: 250px">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-3 col-md-5">




					<div class="form">
						<h2>Update Plants Details</h2>
						<form action="./UpdateItem" method="post" name="ureg" >

							<table>
<tr>
<td><input type="hidden" name="item" value="<%=item%>"> </td>
<td><input type="hidden" name="fid" value="<%=fid%>"> </td>
</tr>
							


								<tr>
									<td>Plant Type</td>
									<td><input type="text" name="pltype" value="<%=item_type %>" readonly="readonly" required></td>
								</tr>
<tr>
									<td>Plant Name</td>
									<td><input type="text" name="plname" value="<%=itemname %>" readonly="readonly" required></td>
								</tr>


								<tr>
									<td>Quantity</td>
									<td><input type="text" name="quant"
										placeholder="Enter Plant quantity" value="<%=quant %>" required></td>
								</tr>
								
								
								
								
								<tr>
									<td>Price Per Plant</td>
									<td><input type="text" name="price" value="<%=price %>" required></td>
								</tr>
								
								
							

							</table>

<button type="submit">Update</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>