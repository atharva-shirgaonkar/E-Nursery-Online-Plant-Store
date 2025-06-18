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

import conn.ConnectionProvider;


@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	int count=0;
	
	public void init(ServletConfig config) throws ServletException {
		
		con=ConnectionProvider.getConnection();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		
		String gender=request.getParameter("gender");
		String rdate=request.getParameter("rdate");
		String mob=request.getParameter("mob");
		String email=request.getParameter("email");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		
		
try {
		
	String query="select * from customer where mob='"+mob+"' or username='"+username+"'";
	System.out.println(query);
	PreparedStatement ps4=con.prepareStatement(query);
	ResultSet rs4=ps4.executeQuery();
	if(rs4.next())
	{
		
		response.sendRedirect("Register.jsp?already=grp");	
	}
	
		else{
				String qur="insert into customer(fname,lname,gender,rdate,mob,email,username,password) values('"+fname+"','"+lname+"','"+gender+"','"+rdate+"','"+mob+"','"+email+"','"+username+"','"+password+"')";
				
				PreparedStatement ps=con.prepareStatement(qur);
				ps.executeUpdate();
				response.sendRedirect("custLogin.jsp?reg=done");
		}	
		
		} catch (Exception e) {
			System.out.println("Exc:"+e);
		}
		
		
		
		
		
	}

}
