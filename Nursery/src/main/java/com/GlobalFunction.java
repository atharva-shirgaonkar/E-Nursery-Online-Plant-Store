package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import conn.ConnectionProvider;

public class GlobalFunction {

	
		
		
	public String getMail(String uid)
		{
		String email="";
		
		try {
			Connection con=ConnectionProvider.getConnection();
			String qur="select * from customer where id='"+uid+"'";
			PreparedStatement ps=con.prepareStatement(qur);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				email=rs.getString("email");
			}
			
		} catch (Exception e) {
			System.out.println("Exe:"+e);
		}
		
			return email;
			
		}

	

	public String getCatagory(String fid)
	{
	String catagory="";
	
	try {
		Connection con=ConnectionProvider.getConnection();
		String qur="select * from nursery_items where id='"+fid+"'";
		PreparedStatement ps=con.prepareStatement(qur);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			catagory=rs.getString("item_type");
		}
		
	} catch (Exception e) {
		System.out.println("Exe:"+e);
	}
	
		return catagory;
		
	}


	
	
	
}
