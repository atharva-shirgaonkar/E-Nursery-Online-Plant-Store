package com;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import conn.ConnectionProvider;


@WebServlet("/AddPlants")
public class AddPlants extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	String plimage="";
	final String UPLOAD_DIRECTORY = "D:\\java workspace\\Nursery\\WebContent\\allimages\\";

	public void init(ServletConfig config) throws ServletException {

	con=ConnectionProvider.getConnection();
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int i = 0;
		String []data=new String[7];
		if (ServletFileUpload.isMultipartContent(request)) 
		{
		
			try 
			{
				@SuppressWarnings("unchecked")
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				
				
				String FileExtention = "";
				long FileSize = 0;

				for (FileItem item1 : multiparts) 
				{
					if (!item1.isFormField()) 
					{
						System.out.println("4");
						plimage = new File(item1.getName()).getName();
						System.out.println("5");
						
						item1.write(new File(UPLOAD_DIRECTORY + File.separator + plimage));
						plimage = item1.getName();
						FileExtention = item1.getContentType();
						System.out.println("file ext is:"+FileExtention);
						FileSize = item1.getSize();
						System.out.println(plimage);
					}
					if(item1.isFormField())
					{
						data[i]=item1.getString();
						i++;
						
					}
					
					
				}
		
				
				
				
				
				System.out.println(plimage);
				
			
				
				
				try {
					
						
						String query="insert into nursery_items(item,item_type,item_name,item_qnt,item_price,description,item_image) values('"+data[0]+"','"+data[1]+"','"+data[2]+"','"+data[3]+"','"+data[4]+"','"+data[5]+"','"+plimage+"')";
						
						PreparedStatement ps1=con.prepareStatement(query);
						ps1.executeUpdate();
						
						
						
						
						
						
						if(data[0].equals("plant"))
						{
							response.sendRedirect("addPlants.jsp?add=plant");	
						}

						else if(data[0].equals("pots"))
						{
							response.sendRedirect("addPots.jsp?add=plant");	
						}
						
						else if(data[0].equals("seeds"))
						{
							response.sendRedirect("addSeeds.jsp?add=plant");	
						}
						
						else if(data[0].equals("pebbles"))
						{
							response.sendRedirect("addPebbles.jsp?add=plant");	
						}
						
								
						
						
					
					
				} catch (Exception e) {
					System.out.println("Exe:"+e);
				}
			
		
	}catch(Exception e)
	{
		System.out.println("Exe:"+e);
	}

}
}
	
	
	
	
	}

