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

	<jsp:include page="header/custheader.jsp" />

	<%
	

response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Cache-Control","no-store"); // HTTP 1.1
response.setDateHeader("Expires", 0);

if(session.getAttribute("username")==null){
	   
    response.sendRedirect("custLogin.jsp?Result=");       
}
else{

	String stock=request.getParameter("stock");
	if(stock!=null)
	{
		out.print("<script>alert('Stock is not available')</script>");
	}
	
	String plantname=session.getAttribute("plantname").toString();
		String username = session.getAttribute("username").toString();
		String uid = session.getAttribute("id").toString();

		String type = request.getParameter("type");
		String pic = request.getParameter("pic");
		String price = request.getParameter("price");
		String item_qnt = request.getParameter("item_qnt");
		String description = request.getParameter("description");
		String item_name = request.getParameter("item_name");
		String cat_plant = request.getParameter("cat_plant");
		String fid = request.getParameter("fid");
		

		//convert string into integer

		int price1 = Integer.parseInt(price);

		int quantity = Integer.parseInt(item_qnt);
	%>


	<div class="container" style="margin-top: 70px;">
		<div class="row">
			<div class="col-md-12">

				<div class="col-md-offset-3 col-md-5" style="margin-left: 160px">
					<div class="form" style="background-color: white;">

						<h5 style="color: red; font-size: 20px">
							Item Price:<%=price1%></h5>

						<form action="custSeedPayment.jsp" method="post">

							<h5>Customer Name</h5>
							<h5><%=username%></h5>
							<br>
							<h5>
								Item Name:<%=item_name%></h5>



 
							<input type="hidden" name="type" value="<%=type%>"> <input
								type="hidden" name="pic" value="<%=pic%>"> <input
								type="hidden" name="price" value="<%=price1%>"> <input
								type="hidden" name="item_qnt" value="<%=quantity%>"> <input
								type="hidden" name="description" value="<%=description%>">
							<input type="hidden" name="item_name" value="<%=item_name%>">
							<input type="hidden" name="cat_plant" value="<%=cat_plant%>">
							<input type="hidden" name="fid" value="<%=fid%>">
 


							<table>
							<%-- <%
session.setAttribute("type", type);
session.setAttribute("pic", pic);
session.setAttribute("price", price1);
session.setAttribute("item_qnt", quantity);
session.setAttribute("description", description);
session.setAttribute("item_name", item_name);

%> --%>
								<tr>
									<td><input type="text" name="iqnt"
										placeholder="Enter Quantity"></td>
								</tr>
								<tr>
									<td><button type="submit">Confirm Plant</button></td>

								</tr>



							</table>




						</form>
						
						<%
						if(plantname.equals("english"))
						{
							%>
							<button type="submit"
							onclick="location.href='englishPlants.jsp?cancel=done'">Cancel</button>
							<%
						}
						else if(plantname.equals("indian"))
						{
							%>
							<button type="submit"
							onclick="location.href='indianPlants.jsp?cancel=done'">Cancel</button>
							<%
						}
						
						else{
							%>
							<button type="submit"
							onclick="location.href='vegtableSeeds.jsp?cancel=done'">Cancel</button>
							<%
						}
						%>
						
						










					</div>

				</div>



			</div>
		</div>

	</div>








	
<% }%>



	
	
	




</body>
</html>