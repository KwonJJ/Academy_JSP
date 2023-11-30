package DBconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBconnect {
	public Connection con;
	public PreparedStatement psmt;
	public Statement stmt;
	public ResultSet rs;
	
	public DBconnect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/puzzle?useUNicode=true&characterEncoding=utf8&useSSL=false";
			String id="manager";
			String pw="1234";
			con=DriverManager.getConnection(url, id, pw);
			System.out.println("db연결 성공");
		} catch (Exception e) {
			System.out.println("db연결 실패");
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
