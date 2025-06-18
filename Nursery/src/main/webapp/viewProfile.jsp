<%@page import="java.util.Date"%>
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
<title>Insert title here</title>



<script>
	function AllowAlphabet() {
		if (!ureg.fname.value.match(/^[a-zA-Z]+$/) && ureg.fname.value != "") {
			ureg.fname.value = "";
			ureg.fname.focus();
			alert("Please Enter only alphabet in text");
		}
		
		if (!ureg.lname.value.match(/^[a-zA-Z]+$/) && ureg.lname.value != "") {
			ureg.lname.value = "";
			ureg.lname.focus();
			alert("Please Enter only alphabets in text");
		}

	}

	function Validate() 
	{
		var y = document.ureg.mob.value;

		if (y.charAt(0)!="7"&&y.charAt(0)!="8"&&y.charAt(0)!="9" ) 
        {
			ureg.mob.value = "";
			//ureg.mob.focus();
             alert("Invalide Start Digit");
             return false
        } 
		
		if (isNaN(y) || y.indexOf(" ") != -1) {

			ureg.mob.value = "";
			//ureg.mob.focus();
			alert("Enter Only Numeric value");
			return false;
		}
		if (y.length != 10) 
		{
			ureg.mob.value = "";
			//ureg.mob.focus();
			alert("Enter 10 Number");
			return false;
		}

		if (!y.match(/^[0-9]+$/) && y != "") {
			y = "";
			
			ureg.mob.value = "";
			//ureg.mob.focus();
			alert("Enter only Digits");
		}

	}

	function validEmail() 
	{
		var mail = document.ureg.email.value;
		if (mail == "") 
		{
		//	document.ureg.email.focus();
			document.ureg.email = "";
			alert("Enter  Email Id");

			return false;
		}
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)) {
		} else {
			document.ureg.email = "";
			document.ureg.email.focus();
			
			alert("Enter Valid Email Id");

			return false;
		}
	}

	
</script>


</head>
<body style="background-image: url('./img/intro-carousel/18.jpg');">

 <jsp:include page="header/custheader.jsp"/> 




<%


response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Cache-Control","no-store"); // HTTP 1.1
response.setDateHeader("Expires", 0);


if(session.getAttribute("username")==null){
	   
    response.sendRedirect("custLogin.jsp?Result=");       
}
else{

String username = session.getAttribute("username").toString();
String uid = session.getAttribute("id").toString();

String already=request.getParameter("already");
if(already!=null)
{
	out.print("<script>alert('Username or mobile number already exists')</script>");
}

SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
Date date = new Date();  
System.out.println(formatter.format(date));  


String fname="";
String lname="";
String mob="";
String email="";
String uname="";
String password="";
String gender="";

Connection con=ConnectionProvider.getConnection();
String qur="select *from customer where id='"+uid+"'";
PreparedStatement ps=con.prepareStatement(qur);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	fname=rs.getString("fname");
	lname=rs.getString("lname");
	gender=rs.getString("gender");
	mob=rs.getString("mob");
	email=rs.getString("email");
	uname=rs.getString("username");
	password=rs.getString("password");
}


%>




	<div class="container" style="margin-top: 70px; margin-left: 140px">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-3 col-md-8">




					<div class="form" style="width: 100%">
						<h2>Update Your Profile</h2>
						<form action="./UpdateProfile" method="post" name="ureg">

							<table>
							
							
								<tr>
									<td>First Name</td>
									<td><input type="text" name="fname" value="<%=fname %>"
										placeholder="First Name" onblur="return AllowAlphabet()"
										required /></td>
									<td>Last Name</td>
									<td><input type="text" name="lname" value="<%=lname %>"
										placeholder="Last Name" onblur="AllowAlphabet()" required /></td>

								</tr>
								<tr>
									


									<td>Gender:</td>

									<td><input type="text" name="gender" value="<%=gender%>"/></td>
									<td>Registration Date</td>

									<td style="color: black"><input type="text" name="rdate"
										value="<%=formatter.format(date)%>"
										readonly="readonly"></td>

								</tr>


								
									<td>Mobile Number</td>
									<td><input type="text" name="mob" value="<%=mob %>"
										onblur="return Validate()" placeholder="Enter only 10 Digit"
										required /></td>

									<td>Email ID</td>
									<td><input type="text" name="email" value="<%=email %>"
										placeholder="Enter E-mail ID" onblur="return validEmail()"
										required /></td>

								</tr>






								<tr />
								<tr>
									<td>Username</td>
									<td><input type="text" name="username" value="<%=uname %>"
										placeholder="Username" required /></td>
									<td align="center">Password</td>
									<td><input type="text" name="password" value="<%=password %>"
										 required /></td>
								</tr>
								<tr />

								<tr />

								<tr>
									<td></td>
									<td></td>
									<td><button type="submit">Update</button></td>
									<td></td>
								</tr>
							</table>



						</form>
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