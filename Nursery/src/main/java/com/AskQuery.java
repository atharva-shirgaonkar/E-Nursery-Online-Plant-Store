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
import javax.servlet.http.HttpSession;

import conn.ConnectionProvider;


@WebServlet("/AskQuery")
public class AskQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	public void init(ServletConfig config) throws ServletException {

		con=ConnectionProvider.getConnection();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session=request.getSession();
		 String username=session.getAttribute("username").toString();
		 String uid=session.getAttribute("id").toString();
		 
		 
		 String subject=request.getParameter("subject");
		 String cquery=request.getParameter("cquery");
		 
		 
		 try {
			
			 
			 String stmt="insert into cust_query(username,userid,subject,cquery) values('"+username+"','"+uid+"','"+subject+"','"+cquery+"')";
			 PreparedStatement ps=con.prepareStatement(stmt);
			 ps.executeUpdate();
			 response.sendRedirect("CustHome.jsp?query=send");
			 
			 
			 
			 
		} catch (Exception e) {
System.out.println(e);
		}
		
		
	
	}

}
