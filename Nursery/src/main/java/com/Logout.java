package com;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String result=request.getParameter("result");
		
		if(result.equals("user"))
		{
		session.removeAttribute("username");
		
		session.invalidate();
		response.sendRedirect("custLogin.jsp?Result=Logoutsucessful");
		}
		else
		{
			session.removeAttribute("username");
			session.invalidate();
			response.sendRedirect("adminLogin.jsp?Result=Logoutsucessful");	
		}
		
		
		}

}
