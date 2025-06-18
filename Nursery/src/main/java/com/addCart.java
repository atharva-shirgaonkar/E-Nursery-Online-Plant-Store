package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.ConnectionProvider;

/**
 * Servlet implementation class addCart
 */
@WebServlet("/addCart")
public class addCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	String plimage = "";
	final String UPLOAD_DIRECTORY = "D:\\java workspace\\Nursery\\WebContent\\allimages\\";

	public void init(ServletConfig config) throws ServletException {

		con = ConnectionProvider.getConnection();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String itemtype = request.getParameter("itemtype");
		String pic = request.getParameter("pic");
		String price = request.getParameter("price");
		String item_qnt = request.getParameter("item_qnt");
		String item_name = request.getParameter("item_name");
		String cat_plant = request.getParameter("cat_plant");
		String fid = request.getParameter("fid");

		try {
			PreparedStatement ps = con
					.prepareStatement("INSERT INTO `cart`(`itemname`, `itemtype`, `custname`,`plant_cat`, `total_cost`) VALUES ('"+item_name+"','"+itemtype+"','"+username+"','"+cat_plant+"','"+price+"')");
			ps.executeUpdate();
			response.sendRedirect("CustHome.jsp?added=done");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}
}
