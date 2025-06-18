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

@WebServlet("/DeleteItem")
public class DeleteItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	public void init(ServletConfig config) throws ServletException {

	con=ConnectionProvider.getConnection();
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	
		String fid=request.getParameter("fid");
		String itemname=request.getParameter("itemname");
		System.out.println(fid);
		System.out.println(itemname);
		
		
		try {
			String qur="delete from nursery_items where id='"+fid+"'";
			System.out.println(qur);
			PreparedStatement ps=con.prepareStatement(qur);
			ps.executeUpdate();
			
			
			
			
			
			
			if(itemname.equals("plant"))
			{
				response.sendRedirect("AdminViewPlants.jsp?item=deleted");	
			}
			

			else if(itemname.equals("pots"))
			{
				response.sendRedirect("AdminViewPots.jsp?item=deleted");	
			}

			else if(itemname.equals("seeds"))
			{
				response.sendRedirect("AdminViewSeeds.jsp?item=deleted");	
			}

			else if(itemname.equals("pebbles"))
			{
				response.sendRedirect("AdminViewPebbles.jsp?item=deleted");	
			}
			
			
			
			
			
			
			
		} catch (Exception e) {
			System.out.println("Exe:"+e);		}
		
		
		
	
	}

}
