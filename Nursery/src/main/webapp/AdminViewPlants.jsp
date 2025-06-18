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


	<div class="container" style="margin-top: 70px; margin-left: 250px">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-3 col-md-8" style="background-color: white;">
				<div class="form">


<%


response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Cache-Control","no-store"); // HTTP 1.1
response.setDateHeader("Expires", 0);

//String username=session.getAttribute("username").toString();
String item=request.getParameter("item");
String items=request.getParameter("items");
if(item!=null)
{
	out.print("<script>alert('Item Deleted Successfully')</script>");
}



else if(items!=null)
{
	out.print("<script>alert('Item updated Successfully')</script>");
}



if(session.getAttribute("username")==null){
	   
    response.sendRedirect("adminLogin.jsp?Result=");       
}
else{
	String imagename="";
	String filepath="";
	Connection con;

	
	
%>


					
						<h2>All Plants Details</h2>
						<h2>Aquatic Plants</h2>
						<%
					 con=ConnectionProvider.getConnection();
						String qur1="select *from nursery_items where item_type='Aquatic Plants'"; 
						PreparedStatement ps1=con.prepareStatement(qur1);
						ResultSet rs1=ps1.executeQuery();
						
					%>
					<table border="1px solid black" style="text-align: center">
					<tr>
					<th>Photo</th>
						<th>Plant Name</th>
						<th>Remaining Items</th>
					<th>Delete Items</th>
					<th>Update</th>
					
					</tr>
					
					<%	
						while(rs1.next())
						{
							int fid=rs1.getInt(1);
							String itemname=rs1.getString("item");
					imagename=rs1.getString("item_image");		
					
						filepath="./allimages/"+imagename;
						%>
						
						
						<tr>
						<td><img src="<%=filepath%>" width="100" height="100"></td>
						
						<td><%=imagename %> </td>
						<td><%=rs1.getString("item_qnt")%></td>
						<td><button type="submit" onclick="location.href='DeleteItem?fid=<%=fid%>&itemname=<%= itemname %>'">Delete</button> </td>
						<td><button type="submit" onclick="location.href='UpdateItem.jsp?fid=<%=fid%>&itemname=<%= imagename %>&item_type=<%= rs1.getString("item_type") %>&quant=<%= rs1.getString("item_qnt") %>&price=<%= rs1.getString("item_price") %>&item=<%= rs1.getString("item") %>'">Update</button> </td>
						
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
			
				<div class="col-md-offset-3 col-md-8" style="background-color: white;">
<div class="form">

<%


%>

					
					
						<h2>Bamboos Plants</h2>
						<%
						con=ConnectionProvider.getConnection();
						String qur2="select *from nursery_items where item_type='Bamboos Plants'"; 
						PreparedStatement ps2=con.prepareStatement(qur2);
						ResultSet rs2=ps2.executeQuery();
						
					%>
					<table border="1px solid black" style="text-align: center;">
					<tr>
					<th>Photo</th>
						<th>Plant Name</th>
						<th>Remaining Items</th>
						<th>Delete Items</th>
						<th>Update Items</th>
					
					
					</tr>
					
					<%	
						while(rs2.next())
						{
							int fid=rs2.getInt(1);
							String itemname=rs2.getString("item");

					imagename=rs2.getString("item_image");		
					
						filepath="./allimages/"+imagename;
						%>
						
						
						<tr>
						<td><img src="<%=filepath%>" width="100" height="100"></td>
						
						<td><%=imagename %> </td>
						<td><%=rs2.getString("item_qnt")%></td>
						<td><button type="submit" onclick="location.href='DeleteItem?fid=<%=fid%>&itemname=<%= itemname %>'">Delete</button> </td>
						<td><button type="submit" onclick="location.href='UpdateItem.jsp?fid=<%=fid%>&itemname=<%= imagename %>&item_type=<%= rs2.getString("item_type") %>&quant=<%= rs2.getString("item_qnt") %>&price=<%= rs2.getString("item_price") %>&item=<%= rs2.getString("item") %>'">Update</button> </td>
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
				<div class="col-md-offset-3 col-md-8" style="width: 100%;background-color: white;">

<div class="form">
					
					
						<h2> Cactus Plants</h2>
						<%
						con=ConnectionProvider.getConnection();
						String qur3="select *from nursery_items where item_type=' Cactus'"; 
						PreparedStatement ps3=con.prepareStatement(qur3);
						ResultSet rs3=ps3.executeQuery();
						
					%>
					<table border="1px solid black" style="text-align: center;">
					<tr>
					<th>Photo</th>
						<th>Plant Name</th>
						<th>Remaining Items</th>
						<th>Delete Items</th>
						<th>Update Item</th>
					
					
					</tr>
					
					<%	
						while(rs3.next())
						{
					imagename=rs3.getString("item_image");	
					int fid=rs3.getInt(1);
					String itemname=rs3.getString("item");

					
						filepath="./allimages/"+imagename;
						%>
						
						
						<tr>
						<td><img src="<%=filepath%>" width="100" height="100"></td>
						
						<td><%=imagename %> </td>
						<td><%=rs3.getString("item_qnt")%></td>
						
<td><button type="submit" onclick="location.href='DeleteItem?fid=<%=fid%>&itemname=<%=itemname %>'">Delete</button> </td>
						<td><button type="submit" onclick="location.href='UpdateItem.jsp?fid=<%=fid%>&itemname=<%= imagename %>&item_type=<%= rs3.getString("item_type") %>&quant=<%= rs3.getString("item_qnt") %>&price=<%= rs3.getString("item_price") %>&item=<%= rs3.getString("item") %>'">Update</button> </td>
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
				<div class="col-md-offset-3 col-md-8" style="width: 100%;background-color: white;">

	<div class="form">
	
					
					
						<h2> Flowering Creepers Plants</h2>
						<%
						con=ConnectionProvider.getConnection();
						String qur4="select *from nursery_items where item_type='Flowering Creepers'"; 
						PreparedStatement ps4=con.prepareStatement(qur4);
						ResultSet rs4=ps4.executeQuery();
						
					%>
					<table border="1px solid black" style="text-align: center;">
					<tr>
					<th>Photo</th>
						<th>Plant Name</th>
						<th>Remaining Items</th>
						<th>Delete Items</th>
						<th>Update Items</th>
					
					
					</tr>
					
					<%	
						while(rs4.next())
						{
							
							int fid=rs4.getInt(1);
							String itemname=rs4.getString("item");

					imagename=rs4.getString("item_image");		
					
						filepath="./allimages/"+imagename;
						%>
						
						
						<tr>
						<td><img src="<%=filepath%>" width="100" height="100"></td>
						
						<td><%=imagename %> </td>
						<td><%=rs4.getString("item_qnt")%></td>
						
<td><button type="submit" onclick="location.href='DeleteItem?fid=<%=fid%>&itemname=<%= itemname %>'">Delete</button> </td>
						<td><button type="submit" onclick="location.href='UpdateItem.jsp?fid=<%=fid%>&itemname=<%= imagename %>&item_type=<%= rs4.getString("item_type") %>&quant=<%= rs4.getString("item_qnt") %>&price=<%= rs4.getString("item_price") %>&item=<%= rs4.getString("item") %>'">Update</button> </td>
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
	
	
		


<% 
}

%>


</body>
</html>