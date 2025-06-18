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
function validuaernameandpass() {

	var pass = document.ureg.dcard.value;

	if (pass != "") {
		if (pass.length < 12) 
		{
			alert("Debit Card no  must be 12 diigts!");
			document.ureg.dcard.value="";
			return false;
		}
	}
}

function validuaernameandpass1() {

	var pass = document.ureg.cvv.value;

	if (pass != "") {
		if (pass.length < 3) 
		{
			alert("Pin must be 3 diigts!");
			document.ureg.cvv.value="";
			return false;
		}
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
	
	
	
	String payment=request.getParameter("payment");
	if(payment!=null)
	{
		out.print("<script>alert('Payment already done')</script>");
	}
	String plantname=session.getAttribute("plantname").toString();
		String username = session.getAttribute("username").toString();
		String uid = session.getAttribute("id").toString();

		/* String type=session.getAttribute("type").toString();
		 String pic=session.getAttribute("pic").toString();
		 String price=session.getAttribute("price").toString();
		 String item_qnt=session.getAttribute("item_qnt").toString();
		 String description=session.getAttribute("description").toString();
		 String item_name=session.getAttribute("item_name").toString(); */

		String type = request.getParameter("type");
		String pic = request.getParameter("pic");
		String price = request.getParameter("price");
		String item_qnt = request.getParameter("item_qnt");
		String description = request.getParameter("description");
		String item_name = request.getParameter("item_name");
		String iqnt = request.getParameter("iqnt");
		String cat_plant = request.getParameter("cat_plant");
		String fid = request.getParameter("fid");
		// customer quantity
		int cust_qunt = Integer.parseInt(iqnt);
		//total item quantity
		int item_quntity = Integer.parseInt(item_qnt);
		//price convert
		int price1 = Integer.parseInt(price);

		//customer item into price
		int totalcost = cust_qunt * price1;
		
		System.out.println("custmer quantity:"+cust_qunt);
		System.out.println("Actual price:"+price1);
		
		

		//maintain remaining items
		int remain_item = item_quntity - cust_qunt;

		System.out.println("remaining plants:" + remain_item);
		System.out.println("total cost of plants:" + totalcost);

		if (cust_qunt > item_quntity) {
			
			

			if(plantname.equals("tower"))
			{
				
				response.sendRedirect("towerPots.jsp?stock=not");
				
			}
			else if(plantname.equals("color"))
			{
				response.sendRedirect("colorPots.jsp?stock=not");
			}
			else 
			{
				response.sendRedirect("standerdPots.jsp?stock=not");	
			}
			
					} else {
	%>

	<div class="container" style="margin-top: 70px;">
		<div class="row">
			<div class="col-md-12">

				<div class="col-md-offset-3 col-md-5" style="margin-left: 160px">
					<div class="form" style="background-color: white;">

						<form action="./CashPayment3" method="post">



							<table border="1px solid black">

<input type="hidden" name="type" value="<%=type%>"> 
<input type="hidden" name="pic" value="<%=pic%>">
<input type="hidden" name="cust_qunt" value="<%=cust_qunt%>">
<input type="hidden" name="item_quntity" value="<%=item_quntity%>">
<input type="hidden" name="totalcost" value="<%=totalcost%>">
<input type="hidden" name="remain_item" value="<%=remain_item%>">
<input type="hidden" name="fid" value="<%=fid%>">	
					<input type="hidden" name="pay_type" value="cash">

								<tr>
									<td><h1>CASH PAYMENT</h1></td>
								</tr>


								<tr>
									<td><h5>
											USER NAME:
											<%=username%></h5></td>
								</tr>

								<tr>
									<td><h5>
											ITEM Catagory:
											<%=cat_plant%></h5></td>
								</tr>

								<tr>
									<td><h5>
											ITEM Name:
											<%=pic%></h5></td>
								</tr>
								<tr>
									<td><h5>
											AMOUNT:<%=totalcost%></h5></td>
								</tr>
								<tr>
									<td>Enter Address for Cash On Delivery</td>
									
								</tr>
								<tr><td><input type="text" name="address" placeholder="Enter Address" required></td></tr>
								
								

							</table>
							<button type="submit">Make Payment</button>

						</form>



					</div>

				</div>


			</div>
		</div>

	</div>




	<div class="container" style="margin-top: 70px;">
		<div class="row">
			<div class="col-md-12">

				<div class="col-md-offset-3 col-md-5" style="margin-left: 160px">
					<div class="form" style="background-color: white;">

						<form action="./conlinePayment3" method="post" name="ureg">

							<table border="1px solid black">


<input type="hidden" name="type" value="<%=type%>"> 
<input type="hidden" name="pic" value="<%=pic%>">
<input type="hidden" name="cust_qunt" value="<%=cust_qunt%>">
<input type="hidden" name="item_quntity" value="<%=item_quntity%>">
<input type="hidden" name="totalcost" value="<%=totalcost%>">
<input type="hidden" name="remain_item" value="<%=remain_item%>">
<input type="hidden" name="fid" value="<%=fid%>">
<input type="hidden" name="pay_type" value="online">

								<tr>
									<td><h1>ONLINE PAYMENT</h1></td>
								</tr>


								<tr>
									<td><h5>
											USER NAME:
											<%=username%></h5></td>
								</tr>

								<tr>
									<td><h5>
											ITEM Catagory:
											<%=cat_plant%></h5></td>
								</tr>

								<tr>
									<td><h5>
											ITEM Name:
											<%=pic%></h5></td>
								</tr>
								<tr>
									<td><h5>
											AMOUNT:<%=totalcost%></h5></td>
								</tr>
								<tr>
									<td>Enter Address </td>
									
								</tr>
								
								<tr><td><input type="text" name="address" placeholder="Enter Address" required></td></tr>
								
								<tr>
									<td>Enter Debit Card number</td>
									
								</tr>
								<tr><td><input type="password" name="dcard" placeholder="Enter Debit Number" onblur="return  validuaernameandpass()" required></td></tr>
								<tr>
									<td>Enter CVV Pin</td>
									</tr>
									<tr>
									<td><input type="password" name="cvv" placeholder="Enter CVV Pin" onblur="return  validuaernameandpass()" required></td>
								</tr>
								

							</table>
							<button type="submit">Make Payment</button>

						</form>



					</div>

				</div>


			</div>
		</div>

	</div>


	<%
		}
	%>




<%} %>


	



</body>
</html>