package mvc.database;

import java.sql.*;

public class DBConnection {
	public Connection con;  
	public Statement stmt;   
	public PreparedStatement psmt;   
	public ResultSet rs;  
	
	public DBConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/mvcboard?useUnicode=true&characterEncoding=utf8&useSSL=false";
			String id = "manager";
			String pwd = "1234";
			
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("데이터베이스 연결 성공");
			
		} catch(Exception e) {
			System.out.println("데이터베이스 연결 실패");
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
			System.out.println("데이터베이스 해제 성공");
		} catch(Exception e) {
			System.out.println("데이터베이스 해제 실패");
			e.printStackTrace();
		}
	}
		
}