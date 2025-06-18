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

	<jsp:include page="header/custheader.jsp" />




	<%
		Connection con;
	
	String username=request.getParameter("username");
	String userid=request.getParameter("userid");
	String subject=request.getParameter("subject");
	String cquery=request.getParameter("cquery");
	%>

	<div class="container" style="margin-top: 70px; margin-left: 250px">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-3 col-md-8">
					<div class="form" style="background-color: white;">
<form action="./SubmitAnswer" method="post">


<input type="hidden" name="username" value="<%=username%>">
<input type="hidden" name="userid" value="<%=userid%>">
<input type="hidden" name="subject" value="<%=subject%>">
<input type="hidden" name="cquery" value="<%=cquery%>">


						<h2>Give Response</h2>
						<h5 style="color: #900C3F">Customer Name-> <%=username %></h5>
						<h5 style="color: #900C3F">Subject-> <%=subject %></h5>
						<h5 style="color: #900C3F">Customer Query-> <%=cquery %></h5>
						<h5 style="color: #228B22">Send Your Answer</h5>
						<textarea rows="5" cols="30" name="answer"></textarea>
						<br>
						<button type="submit">Send Response</button>
						
						
						
						</form>
						

					</div>
				</div>
			</div>
		</div>
	</div>





</body>
</html>