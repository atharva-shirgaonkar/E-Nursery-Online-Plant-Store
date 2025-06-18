<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-image: url('./img/intro-carousel/24.jpg');">

 <jsp:include page="header/adminheader.jsp"/> 
 
<%

String ans=request.getParameter("ans");
if(ans!=null)
{
	out.print("<script>alert('Response send to Cust Successfully')</script>");
}


response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Cache-Control","no-store"); // HTTP 1.1
response.setDateHeader("Expires", 0);





if(session.getAttribute("username")==null){
	   
    response.sendRedirect("adminLogin.jsp?Result=");       
}
else{

	%>
		
	<div class="container" style="margin-top: 300px">	
		<div class="row" align="center">
			<div class="col-xs-12 col-sm-12 col-lg-12 col-md-12">

				<div class="col-xs-12 col-sm-8  col-lg-offset-3 col-lg-6 col-md-offset-2 col-md-6">
					
					<!-- <h1 style="font-family: Times New Roman;color: #8B4513">ADMIN HOME</h1> -->
					
		
				
			</div>
		</div>
		
	</div>
	</div>
	
	
	
	
	
	
	<% 
	
	
}

%>	
	








</body>
</html>