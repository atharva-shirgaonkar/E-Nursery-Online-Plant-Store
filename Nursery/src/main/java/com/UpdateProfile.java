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
import javax.servlet.http.HttpSession;

import conn.ConnectionProvider;

/**
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	public void init(ServletConfig config) throws ServletException {
		con=ConnectionProvider.getConnection();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession session=request.getSession();
		String uname = session.getAttribute("username").toString();
		String uid = session.getAttribute("id").toString();
		
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		
		String gender=request.getParameter("gender");
		String rdate=request.getParameter("rdate");
		String mob=request.getParameter("mob");
		String email=request.getParameter("email");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		
		
try {
		
	
				String qur="update customer set fname='"+fname+"',lname='"+lname+"',gender='"+gender+"',rdate='"+rdate+"',mob='"+mob+"',email='"+email+"',username='"+username+"',password='"+password+"' where id='"+uid+"'";
				
				PreparedStatement ps=con.prepareStatement(qur);
				ps.executeUpdate();
				response.sendRedirect("CustHome.jsp?update=done");
		
		
		} catch (Exception e) {
			System.out.println("Exc:"+e);
		}
		
		
		
		
		
	}

}
