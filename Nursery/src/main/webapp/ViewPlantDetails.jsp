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
String plantname=session.getAttribute("plantname").toString();
String username=session.getAttribute("username").toString();
String uid=session.getAttribute("id").toString();


%>



<%

String id=request.getParameter("id");
System.out.println("id is:"+id);

String imagename="";
String filepath="";
Connection con;


%>

	<div class="container" style="margin-top: 70px;">
		<div class="row">
			<div class="col-md-12">
				
			
	 			
 

		<%
					 con=ConnectionProvider.getConnection();
						String qur1="select *from nursery_items where id='"+id+"'"; 
						PreparedStatement ps1=con.prepareStatement(qur1);
						ResultSet rs1=ps1.executeQuery();
						

					
							while(rs1.next())
								
							{
								
						String type=rs1.getString("item");	
						String price=rs1.getString("item_price");
						
						imagename=rs1.getString("item_image");	
						String item_qnt=rs1.getString("item_qnt");
						String description=rs1.getString("description");
						
							filepath="./allimages/"+imagename;
							
							
						
						
						
					%>
	

					
						
				
					<div class="col-md-offset-1 col-md-5" style="float: left;margin-right: 0;padding-right: 0">
					
					<div class="form" style="margin: 0;box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.9), 0 7px 5px 0 rgba(0, 0, 0, 0.1);background-color: white; ">	
						
						
						<img src="<%=filepath%>" width="400" height="400">
						
						
						</div>
						</div>
						
					
					
					<div class="col-md-6" style="float: left;margin-left: 0;padding-left: 0">
					
					<div class="form" style="margin: 0;  box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.9), 0 7px 5px 0 rgba(0, 0, 0, 0.1);background-color: white; ">	
						
						<%
						String [] pic=imagename.split("\\.");
						String item_name=pic[0];
						
						%>
						
						<!-- <table border="1px solid black" style="height: 350px;"> -->
						
						<h5>Item Description ---> <%=description %></h5><br>
					<h5>Item Type ---> <%=type %></h5><br>
					<h5>Sub Catagory ---> <%=item_name %></h5><br>
					<h5>Item Price ---> <%=price %></h5>	<br>
						
						
						
												<button type="submit" style="margin: 3px" onclick="location.href='addCart?username=<%=username%>&itemtype=Plant&type=<%=type%>&pic=<%= imagename %>&price=<%=price%>&item_qnt=<%= item_qnt %>&item_name=<%=item_name%>&cat_plant=<%=rs1.getString("item_type")%>&fid=<%=id%>'">Add Cart</button>
<%-- 						<button type="submit" style="margin: 3px" onclick="location.href='plantPaymant.jsp?type=<%=type%>&pic=<%= imagename %>&price=<%=price%>&item_qnt=<%= item_qnt %>&item_name=<%=item_name%>&cat_plant=<%=rs1.getString("item_type")%>&fid=<%=id%>'">Add Cart</button>
 --%>						</div>
						
					</div>
			
						
						
					
						
						
						
						
						

	
	
				<%					
	}
	%>		
	
				
					</div>
				</div>
	
			</div>
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>