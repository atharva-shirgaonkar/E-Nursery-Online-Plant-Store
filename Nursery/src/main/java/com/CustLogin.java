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

@WebServlet("/CustLogin")
public class CustLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	
	public void init(ServletConfig config) throws ServletException {
		
		con=ConnectionProvider.getConnection();
				
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		
		try {
			
			String qur="select *from customer where username='"+username+"' and password='"+password+"'";
			PreparedStatement ps=con.prepareStatement(qur);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				
				int id=rs.getInt(1);
				session.setAttribute("id", id);
				session.setAttribute("username", username);
				response.sendRedirect("CustHome.jsp");
				
			}
			
			else{
				response.sendRedirect("custLogin.jsp?login=fail");
			}
			
		} catch (Exception e) {
			
		}
		
		
	}

}
