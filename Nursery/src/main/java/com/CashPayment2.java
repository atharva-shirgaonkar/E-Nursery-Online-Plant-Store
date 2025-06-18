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

@WebServlet("/CashPayment2")
public class CashPayment2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;

	
	public void init(ServletConfig config) throws ServletException {
		con=ConnectionProvider.getConnection();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		GlobalFunction gf=new GlobalFunction();
		HttpSession session=request.getSession();
		String plantname=session.getAttribute("plantname").toString();
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
		String pay_type=request.getParameter("pay_type");
		
		System.out.println("fid:"+fid);
		
		String catagory=gf.getCatagory(fid);
		
		
		
		try {
		
			
			/*String qur3="select *from seed_book where cust_id='"+uid+"' and item_id='"+fid+"' and item_quant='"+cust_qunt+"' and payment_status='done'";
			System.out.println(qur3);
			PreparedStatement ps3=con.prepareStatement(qur3);
			ResultSet rs=ps3.executeQuery();
			if(rs.next())
			{
				response.sendRedirect("custSeedPayment.jsp?payment=already");
			}
			*/
			
			//insert customer details
		String qur="insert into seed_book(custname,cust_id,plant_cat,item_name,item_id,item_quant,total_cost,address,payment_type) values('"+username+"','"+uid+"','"+catagory+"','"+pic+"','"+fid+"','"+cust_qunt+"','"+totalcost+"','"+address+"','"+pay_type+"')";
		System.out.println(qur);
		PreparedStatement ps=con.prepareStatement(qur);
		ps.executeUpdate();
		
		// update items in nursery table
		
		String qur1="update nursery_items set item_qnt='"+remain_item+"' where id='"+fid+"'";
		System.out.println(qur1);
		PreparedStatement ps1=con.prepareStatement(qur1);
		ps1.executeUpdate();
		

		// send email
	
		String email=gf.getMail(uid);
		
		String sub="Product Booked Successfully";
		String msgC = "Hello : "+username+"\n"+"your Request for Item is:"+type+"\n"+" Item Quantity is:"+cust_qunt+"  and Total cost of product is:"+totalcost+".Paymant Type is:"+pay_type;
		
		email.SendMailSSL s=new email.SendMailSSL();
        s.EmailSending(email,sub , msgC);
		
		
					System.out.println("send");
			
		
		
		if(plantname.equals("english"))
		{
			response.sendRedirect("englishSeeds.jsp?book=success");	
		}
		
		
		else if(plantname.equals("indian")){
			response.sendRedirect("indianSeeds.jsp?book=success");		
		}
		
		else{
			response.sendRedirect("vegtableSeeds.jsp?book=success");		
		}
	
		
		
		
		
		} catch (Exception e) {
		System.out.println("Exe:"+e);
		}
		
		
			
	
	
	}

}

