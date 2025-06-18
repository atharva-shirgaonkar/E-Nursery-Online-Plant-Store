<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-image: url('./img/intro-carousel/18.jpg');">

 <jsp:include page="header/header.jsp"/> 
 
	
	
	
	
	
	
	
	<%
	 String Result=request.getParameter("Result");
			String login = request.getParameter("login");
			if (login != null) {
				out.print("<script>alert('Invalid Username or password')</script>");
			}
			
			
			else if(Result!=null)
			 {
				 out.print("<script>alert('Logout Successfull..!!')</script>");
			 }

		%>




<div class="container" style="margin-top: 30px;">

	<div class="row" align="center">
		<div class="col-xs-12 col-sm-12 col-lg-12 col-md-12">

			<div
				class="col-xs-12 col-sm-8  col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6">
				<div class="form">
					<h1 style="color: black">ADMIN LOGIN</h1>
					<br />

					<form action="AdminLogin" method="post">
						<table>
							<tr>
								<td>Username</td>
								<td><input type="text" name="uname" placeholder="Enter Username" required="required"></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input type="password" name="pwd" placeholder="Enter password" required="required"></td>
							</tr>
							<tr>
						
								<td></td>
										<td><button type="submit">Login</button> </td>
							</tr>

						</table>

					</form>
				</div>
			</div>
		</div>

	</div>
</div>
</div>
</body>
</html>