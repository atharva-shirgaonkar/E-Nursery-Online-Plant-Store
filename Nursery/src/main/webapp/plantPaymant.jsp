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


<script type="text/javascript">
function AllowNumbers() {
	
	var y = document.ureg.iqnt.value;
	if (!y.match(/^[0-9]+$/) && y != "") {
		y = "";
		
		ureg.iqnt.value = "";
		//ureg.mob.focus();
		alert("Enter only Digits");
	}
}

</script>


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

		String plantname=session.getAttribute("plantname").toString();
		
		String stock=request.getParameter("stock");
		if(stock!=null)
		{
			out.print("<script>alert('Stock is not available')</script>");
		}
		
			String username = session.getAttribute("username").toString();
			String uid = session.getAttribute("id").toString();

		%>


		<div class="container" style="margin-top: 70px;">
			<div class="row">
				<div class="col-md-12">

					<div class="col-md-offset-3 col-md-5" style="margin-left: 160px">
						<div class="form" style="background-color: white;">

							<h5 style="color: red; font-size: 20px">

							<form action="CashPayment" method="post" name="ureg">

								<h5>Customer Name</h5>
								<h5><%=username%></h5>
								<br>
								<h5>



	 


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
										<td><button type="submit">Get Order</button></td>

									</tr>



								</table>




							</form>
							
							<%
							if(plantname.equals("bamboo"))
							{
								%>
								<button type="submit"
								onclick="location.href='bambooPlants.jsp?cancel=done'">Cancel</button>
								<%
							}
							else if(plantname.equals("cactus"))
							{
								%>
								<button type="submit"
								onclick="location.href='cactusPlants.jsp?cancel=done'">Cancel</button>
								<%
							}
							
							
							else if(plantname.equals("Flowering Creepers"))
							{
								%>
								<button type="submit"
								onclick="location.href='flowersPlants.jsp?cancel=done'">Cancel</button>
								<%
							}

							else{
								%>
								<button type="submit" onclick="location.href='aquaticPlants.jsp?cancel=done'">Cancel</button>
								<%
							}
							%>
							
							
							










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