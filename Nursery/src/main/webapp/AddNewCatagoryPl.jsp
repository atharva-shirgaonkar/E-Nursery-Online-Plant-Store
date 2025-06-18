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


%>

	<div class="container" style="margin-top: 70px; margin-left: 250px">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-3 col-md-5">




					<div class="form">
						<h2>Add New Plants Catagory</h2>
						<form action="./AddNewPlants" method="post" name="ureg" enctype="multipart/form-data">

							<table>
<tr>
<td>Item</td>
<td><input type="text" name="item" value="plant"> </td>
</tr>

								</tr>


								<tr>
									<td>Add New Catagory</td>
									<td><input type="text" name="plname"
										placeholder="Enter Plant Name" required></td>
								</tr>

								
								
								

							</table>

<button type="submit">Add New Catagory</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>