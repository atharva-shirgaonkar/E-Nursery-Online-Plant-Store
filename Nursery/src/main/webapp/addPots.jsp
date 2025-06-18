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
String add=request.getParameter("add");
if(add!=null)
{
	out.print("<script>alert('Plant Add Successfully..!')</script>");
}

response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Cache-Control","no-store"); // HTTP 1.1
response.setDateHeader("Expires", 0);

if(session.getAttribute("username")==null){
	   
    response.sendRedirect("adminLogin.jsp?Result=");       
}
else{
	
%>

	<div class="container" style="margin-top: 70px; margin-left: 250px">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-3 col-md-5">




					<div class="form">
						<h2>Add Pots</h2>
						<form action="./AddPlants" method="post" name="ureg" enctype="multipart/form-data">

							<table>
<tr>
<td>Item</td>
<td><input type="text" name="item" value="pots"> </td>
</tr>
								<tr>
									<td>Select Catagory</td>
									<td><select name="pltype">
											<option name="0" value="0">-- Select --</option>
											<%
												Connection con = ConnectionProvider.getConnection();
												String qur = "select *from dataset";
												PreparedStatement ps = con.prepareStatement(qur);
												ResultSet rs = ps.executeQuery();
												while (rs.next()) {
											%>
											<option name="<%=rs.getString("pots")%>"
												value="<%=rs.getString("pots")%>"><%=rs.getString("pots")%></option>
											<%
												}
											%>


									</select></td>



								</tr>


								<tr>
									<td>Pot Name</td>
									<td><input type="text" name="plname"
										placeholder="Enter Pot Name" required></td>
								</tr>

								<tr>
									<td>Quantity</td>
									<td><input type="text" name="plqnt"
										placeholder="Enter pot quantity" required></td>
								</tr>
								
								
								
								
								<tr>
									<td>Price Per pot</td>
									<td><input type="text" name="price"
										placeholder="Enter price" required></td>
								</tr>
								<tr>
									<td>Description</td>
									<td><input type="text" name="description"
										placeholder="Enter description" required></td>
								</tr>

								<tr>
									<td>Pot Image</td>
									<td><input type="file" name="plimage" required></td>
								</tr>


							</table>

<button type="submit">Add Plant</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



<% 	
	
	
	
}







%>
</body>
</html>