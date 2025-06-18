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
@WebServlet("/CashPayment")
public class CashPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	public void init(ServletConfig config) throws ServletException {
	
	con=ConnectionProvider.getConnection();
	
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		
		
		HttpSession session=request.getSession();
		String usernname=session.getAttribute("username").toString();
		
		try {
		
			
			String qur3="UPDATE `cart` SET `payment_status`='Done'";
			PreparedStatement ps=con.prepareStatement(qur3);
			ps.executeUpdate();
			response.sendRedirect("CustHome.jsp?payment=done");
		
		} catch (Exception e) {
		System.out.println("Exe:"+e);
		}
		
		
	
	
	
	

	
	
	
	
			
			
			
		
		
		
		
		
	
	
	}

}
