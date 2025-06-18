package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.ConnectionProvider;


@WebServlet("/SubmitAnswer")
public class SubmitAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	public void init(ServletConfig config) throws ServletException {
		
		con=ConnectionProvider.getConnection();
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		String username=request.getParameter("username");
		String userid=request.getParameter("userid");
		String subject=request.getParameter("subject");
		String cquery=request.getParameter("cquery");
		String answer=request.getParameter("answer");
		
		
		try {
			
			String qur="update cust_query set answer='"+answer+"',status='send' where userid='"+userid+"' and subject='"+subject+"' and cquery='"+cquery+"'";
			System.out.println(qur);
			PreparedStatement ps=con.prepareStatement(qur);
			ps.executeUpdate();
			
			
			response.sendRedirect("AdminHome.jsp?ans=send");
			
			
			
		} catch (Exception e) {
		System.out.println("exe:"+e);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	}

}
