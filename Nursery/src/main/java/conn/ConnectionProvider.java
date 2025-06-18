package conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	public static Connection getConnection()
	{
		
		Connection con=null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nursery","root","");
			System.out.println("connected");
			return con;
			
		} catch (Exception e) {
			
		}
		return con;
		
	}
}
