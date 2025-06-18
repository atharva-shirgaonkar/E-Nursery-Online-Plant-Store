<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-image: url('./img/intro-carousel/18.jpg');">

 <jsp:include page="header/custheader.jsp"/> 
 
 <% 
 String username=session.getAttribute("username").toString();
 String uid=session.getAttribute("id").toString();
 
 %>
 
 
 
 
 <div class="container" style="margin-top: 120px;margin-left: 110px">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-4 col-md-6" style="margin-left: 120px">
					<div class="form">
						<h2>ASK YOUR QUERY</h2>
						<form action="./AskQuery" method="post">

							<table>

								
							

								<tr>
									<td>Username</td>
									<td><%=username %> </td>
									</tr>
								
								<tr>
									<td>Subject</td>
									<td><input type="text" name="subject" placeholder="Subject related to Query" required> </td>
									</tr>
								
								
								
								<tr>
									<td>Ask Your query</td>
									<td><textarea rows="5" cols="30" name="cquery" required></textarea> </td>
									
								

								</tr>
								<tr />
								<tr>
									<td></td>
									<td align="center"><button type="submit">submit</button></td>
								

								</tr>




							</table>


						</form>
					</div>
				</div>


			</div>

		</div>
	</div>

</body>
</html>