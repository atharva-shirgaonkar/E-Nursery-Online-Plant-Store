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

@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	
	public void init(ServletConfig config) throws ServletException {
		
		con=ConnectionProvider.getConnection();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		HttpSession session=request.getSession();
		String username=session.getAttribute("username").toString();
		 String uid=session.getAttribute("id").toString();
		
		String feedback=request.getParameter("feedback");
		
		
		
		
		
		
try {
		
	
				String qur="insert into feedback(username,uid,feedback) values('"+username+"','"+uid+"','"+feedback+"')";
				
				PreparedStatement ps=con.prepareStatement(qur);
				ps.executeUpdate();
				response.sendRedirect("CustHome.jsp?feedback=submit");
	
		
		} catch (Exception e) {
			System.out.println("Exc:"+e);
		}
		
		
		
		
		
	}

}
