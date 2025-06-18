package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sms.SMS;
import conn.ConnectionProvider;


@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	
	public void init(ServletConfig config) throws ServletException {
	
		con=ConnectionProvider.getConnection();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String username=request.getParameter("username");
		
		
	try {
		
		
		String q1="insert into fpass(username) values('"+username+"')";
		PreparedStatement p1=con.prepareStatement(q1);
		p1.executeUpdate();
		
		
		
			String qur="select *from customer where username='"+username+"'";
			PreparedStatement ps=con.prepareStatement(qur);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				
				String email=rs.getString("email");
				String password=rs.getString("password");
				
				String sub="Password Reset Successfully";
				String msgC = "Hello : "+username+"\n"+"your Request for reset password Accepted successfully.  Your password is:"+password+"\n"+" .Please Do Not Shared to Any one";
				
				email.SendMailSSL s=new email.SendMailSSL();
		        s.EmailSending(email,sub , msgC);
				
				
							System.out.println("send");
					
					
				
				
				
			/*	 SMS sm=new SMS();
					
					String msgC = "Hello : "+username+"\n"+"your Request for reset password Accepted successfully.  Your password is:"+password+"\n"+" .Please Do Not Shared to Any one";
					String myURL = "http://sms.wecreatead.com/API/WebSMS/Http/v1.0a/index.php";

					
					sm.callURL(myURL, msgC, mob);
					System.out.println("send");*/
					response.sendRedirect("custLogin.jsp?pass=send");
				
				
				
			}
			
			else{
				response.sendRedirect("forgotPassword.jsp?Invalid=username");
			}
			
		} catch (Exception e) {
			
		}
		
		
	}

}
