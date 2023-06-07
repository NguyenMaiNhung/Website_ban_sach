package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
	
	protected Connection conn;
	
	public ConnectDB() {
		// TODO Auto-generated constructor stub
		String url = "jdbc:mysql://localhost:3306/qlbs";
		String user = "root";
		String pass = "10012002";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pass);
			System.out.println("ket noi thanh cong");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
//	public static void main(String[] args) {
//		ConnectDB conection = new ConnectDB();
//	}

}
