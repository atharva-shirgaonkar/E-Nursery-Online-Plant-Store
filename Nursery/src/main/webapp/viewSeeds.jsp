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
<body style="background-image: url('./img/intro-carousel/15.jpg');">

	<jsp:include page="header/custheader.jsp" />


	<div class="container" style="margin-top: 70px; margin-left: 250px">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-3 col-md-8">
<div class="form">

<%

String imagename="";
String filepath="";
Connection con;
%>

					
						<h2>All Seeds Details</h2>
						<h2>All Vegetable Seeds</h2>
						<%
					 con=ConnectionProvider.getConnection();
						String qur1="select *from nursery_items where item_type='All Vegetable Seeds'"; 
						PreparedStatement ps1=con.prepareStatement(qur1);
						ResultSet rs1=ps1.executeQuery();
						
					%>
					<table border="1px solid black" style="text-align: center;">
					<tr>
					<th>Photo</th>
						<th>Plant Name</th>
						<th>Remaining Items</th>
						<th>Price Per item</th>
						<th>Buy</th>
						
					
					
					</tr>
					
					<%	
						while(rs1.next())
						{
					imagename=rs1.getString("item_image");		
					
						filepath="./allimages/"+imagename;
						%>
						
						
						<tr>
						<td><img src="<%=filepath%>" width="100" height="100"></td>
						
						<td><%=imagename %> </td>
						<td><%=rs1.getString("item_qnt")%></td>
						
<td><%=rs1.getString("item_price")%></td>
						<td><button type="submit" style="margin: 20px">Buy</button> </td>
						
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
	
	
	
	
	
	
	<div class="container" style="margin-top: 30px; margin-left: 250px">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-3 col-md-8" style="width: 100%">
<div class="form">

					
					
						<h2>English Vegetable Seeds</h2>
						<%
						con=ConnectionProvider.getConnection();
						String qur2="select *from nursery_items where item_type='English Vegetable Seeds'"; 
						PreparedStatement ps2=con.prepareStatement(qur2);
						ResultSet rs2=ps2.executeQuery();
						
					%>
					<table border="1px solid black" style="text-align: center;">
					<tr>
					<th>Photo</th>
						<th>Plant Name</th>
						<th>Remaining Items</th>
						<th>Price Per item</th>
						<th>Buy</th>
						
					
					
					</tr>
					
					<%	
						while(rs2.next())
						{
					imagename=rs2.getString("item_image");		
					
						filepath="./allimages/"+imagename;
						%>
						
						
						<tr>
						<td><img src="<%=filepath%>" width="100" height="100"></td>
						
						<td><%=imagename %> </td>
						<td><%=rs2.getString("item_qnt")%></td>
						
<td><%=rs2.getString("item_price")%></td>
						<td><button type="submit" style="margin: 20px">Buy</button> </td>
						
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
	
	
	
	
	
	
	<div class="container" style="margin-top: 30px; margin-left: 250px">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-3 col-md-8" style="width: 100%">
<div class="form">

					
					
						<h2>Herb Seeds</h2>
						<%
						con=ConnectionProvider.getConnection();
						String qur3="select *from nursery_items where item_type='Herb Seeds'"; 
						PreparedStatement ps3=con.prepareStatement(qur3);
						ResultSet rs3=ps3.executeQuery();
						
					%>
					<table border="1px solid black" style="text-align: center;">
					<tr>
					<th>Photo</th>
						<th>Plant Name</th>
						<th>Remaining Items</th>
						<th>Price Per item</th>
						<th>Buy</th>
						
					
					
					</tr>
					
					<%	
						while(rs3.next())
						{
					imagename=rs3.getString("item_image");		
					
						filepath="./allimages/"+imagename;
						%>
						
						
						<tr>
						<td><img src="<%=filepath%>" width="100" height="100"></td>
						
						<td><%=imagename %> </td>
						<td><%=rs3.getString("item_qnt")%></td>
						
<td><%=rs3.getString("item_price")%></td>
						<td><button type="submit" style="margin: 20px">Buy</button> </td>
						
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
	
	
	

	
	<div class="container" style="margin-top: 30px; margin-left: 250px">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-3 col-md-8" style="width: 100%">
<div class="form">
	
	
					
					
						<h2>Indian Vegetable Seeds</h2>
						<%
						con=ConnectionProvider.getConnection();
						String qur4="select *from nursery_items where item_type='Indian Vegetable Seeds'"; 
						PreparedStatement ps4=con.prepareStatement(qur4);
						ResultSet rs4=ps4.executeQuery();
						
					%>
					<table border="1px solid black" style="text-align: center;">
					<tr>
					<th>Photo</th>
						<th>Plant Name</th>
						<th>Remaining Items</th>
						<th>Price Per item</th>
						<th>Buy</th>
					
					
					</tr>
					
					<%	
						while(rs4.next())
						{
					imagename=rs4.getString("item_image");		
					
						filepath="./allimages/"+imagename;
						%>
						
						
						<tr>
						<td><img src="<%=filepath%>" width="100" height="100"></td>
						
						<td><%=imagename %> </td>
						<td><%=rs4.getString("item_qnt")%></td>
						
<td><%=rs4.getString("item_price")%></td>
						<td><button type="submit" style="margin: 20px">Buy</button> </td>
						
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