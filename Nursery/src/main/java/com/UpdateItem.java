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
@WebServlet("/UpdateItem")
public class UpdateItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	public void init(ServletConfig config) throws ServletException {

con=ConnectionProvider.getConnection();	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		HttpSession session=request.getSession();
		String username=session.getAttribute("username").toString();


		String fid=request.getParameter("fid");
		String item=request.getParameter("item");
		String itemname=request.getParameter("itemname");
		String item_type=request.getParameter("item_type");
		String quant=request.getParameter("quant");
		String price=request.getParameter("price");
		
		
		
		
		
		System.out.println(fid);
		System.out.println(itemname);
		
		
		try {
			String qur="update nursery_items set item_qnt='"+quant+"',item_price='"+price+"' where id='"+fid+"'";
			System.out.println(qur);
			PreparedStatement ps=con.prepareStatement(qur);
			ps.executeUpdate();
			
			
			
			
			
			
			if(item.equals("plant"))
			{
				response.sendRedirect("AdminViewPlants.jsp?items=updated");	
			}
			

			else if(item.equals("pots"))
			{
				response.sendRedirect("AdminViewPots.jsp?items=updated");	
			}

			else if(item.equals("seeds"))
			{
				response.sendRedirect("AdminViewSeeds.jsp?items=updated");	
			}

			else if(item.equals("pebbles"))
			{
				response.sendRedirect("AdminViewPebbles.jsp?items=updated");	
			}
			
			
			
			
			
			
			
		} catch (Exception e) {
			System.out.println("Exe:"+e);		}
		
		
		
	
	}

}
