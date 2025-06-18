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


@WebServlet("/onlinePayment")
public class onlinePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	
	public void init(ServletConfig config) throws ServletException {
	con=ConnectionProvider.getConnection();
	
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	

		
		
		HttpSession session=request.getSession();
		
		String username=session.getAttribute("username").toString();
		String uid=session.getAttribute("id").toString();
		
		
		String type=request.getParameter("type");
		String pic=request.getParameter("pic");
		String cust_qunt=request.getParameter("cust_qunt");
		String item_quntity=request.getParameter("item_quntity");
		String totalcost=request.getParameter("totalcost");
		String remain_item=request.getParameter("remain_item");
	
		String address=request.getParameter("address");
		String fid=request.getParameter("fid");
		
		String dcard=request.getParameter("dcard");
		String cvv=request.getParameter("cvv");
		
		System.out.println("fid:"+fid);
		
		try {
		
			
			String qur3="select *from plant_book where cust_id='"+uid+"' and item_id='"+fid+"' and payment_status='done'";
			System.out.println(qur3);
			PreparedStatement ps3=con.prepareStatement(qur3);
			ResultSet rs=ps3.executeQuery();
			if(rs.next())
			{
				response.sendRedirect("custPlantPayment.jsp?payment=already");
			}
			
			
			//insert customer details
		String qur="insert into plant_book(custname,cust_id,plant_cat,item_name,item_id,item_quant,total_cost,address) values('"+username+"','"+uid+"','"+type+"','"+pic+"','"+fid+"','"+item_quntity+"','"+totalcost+"','"+address+"')";
		System.out.println(qur);
		PreparedStatement ps=con.prepareStatement(qur);
		ps.executeUpdate();
		
		// update items in nursery table
		
		String qur1="update nursery_items set item_qnt='"+remain_item+"' where id='"+fid+"'";
		System.out.println(qur1);
		PreparedStatement ps1=con.prepareStatement(qur1);
		ps1.executeUpdate();
		
		response.sendRedirect("aquaticPlants.jsp?book=success");
		
		} catch (Exception e) {
		System.out.println("Exe:"+e);
		}
		
		
	
	
	
	

	
	
	
	
			
			
			
		
		
		
		
		
	
	
	}

}
