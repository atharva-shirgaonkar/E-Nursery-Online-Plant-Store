package com;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.ConnectionProvider;




@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;
	public void init(ServletConfig config) throws ServletException 
	{
		try {

			con = ConnectionProvider.getConnection();
		} catch (Exception e1) {
			e1.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		HttpSession session = request.getSession();

		PreparedStatement ps1;
		try {
			ps1 = con.prepareStatement("select * from admin where uname='"+ uname + "' AND pwd='" + pwd + "'");
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) 
			{
				session.setAttribute("username", uname);
				response.sendRedirect("AdminHome.jsp?login=done");

			}
			else 
			{
				System.out.println("Login fail");
				response.sendRedirect("adminLogin.jsp?login=fail");
			}
		} catch (SQLException e) 
		{
			System.out.println("Exception Occure :- " + e);
		}


	}

}
