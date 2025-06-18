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
<body style="background-image: url('./img/intro-carousel/.jpg');">

	<jsp:include page="header/custheader.jsp" />


<%


String cancel=request.getParameter("cancel");
String book=request.getParameter("book");
String username=session.getAttribute("username").toString();
String uid=session.getAttribute("id").toString();
String stock=request.getParameter("stock");
if(stock!=null)
{
	out.print("<script>alert('Stock is not Available..!!')</script>");
}

else if(cancel!=null)
{
	out.print("<script>alert('Your previous Product will be cancel..!!')</script>");
}



else if(book!=null)
{
	out.print("<script>alert('Product book successfully..!!')</script>");
}


%>



<%

String plantname="indian";
session.setAttribute("plantname", plantname);
String imagename="";
String filepath="";
Connection con;
int id;

%>

	<div class="container" style="margin-top: 70px;">
		<div class="row">
			<div class="col-md-12">
								<%
					 con=ConnectionProvider.getConnection();
						String qur1="select *from nursery_items where item_type='Indian Vegetable Seeds'"; 
						PreparedStatement ps1=con.prepareStatement(qur1);
						ResultSet rs1=ps1.executeQuery();
						

					
							while(rs1.next())
								
							{
								
								id=rs1.getInt(1);
						imagename=rs1.getString("item_image");		
						
							filepath="./allimages/"+imagename;
							
						
						
						
					%>
	
				<div class="col-md-offset-1 col-md-3" style="float: left;margin-bottom: 2%">
			
	 			<div class="form" style="width: auto;padding: 10px" onclick="location.href='./ViewSeedDetails.jsp?id=<%=id%>'">
 


					
						
						
					
					
					
						
						
						<img src="<%=filepath%>" width="100" height="100">
						<h5><%=imagename %></h5>
						
						
						
					
					
					
						
						
					
						
						
						
						
						

	
	
		
	
				
					</div>
				</div>
				<%					
	}
	%>	
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
</body>
</html>