package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
	public Connection con; // 데이터베이스 연결
	public Statement stmt; // 파라미터 없는 정적 쿼리문
	public PreparedStatement psmt; // 파라미터 있는 동적 쿼리문
	public ResultSet rs; // 쿼리문 결과 저장

	public JDBConnect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=utf8&useSSL=false";
			String id = "manager";
			String pwd = "1234";

			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("데이터베이스 연결 성공");

		} catch (Exception e) {
			System.out.println("데이터베이스 연결 실패");
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();
			System.out.println("데이터베이스 해제 성공");
		} catch (Exception e) {
			System.out.println("데이터베이스 해제 실패");
			e.printStackTrace();
		}
	}
}
