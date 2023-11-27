package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
	public Connection con; // DB접속
	public Statement stmt; // 파라미터 없는 정적 쿼리문
	public PreparedStatement psmt; // 동적쿼리 사용
	public ResultSet rs; // 쿼리 실행 결과

	public JDBConnect() { // 기본생성자
		try {
			Class.forName("oracle.jdbc.OracleDriver"); // 오라클 드라이버 연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "manager";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd); // 오라클 데이터베이스 연결
			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			System.out.println("DB 연결 실패");
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
			System.out.println("연결 해제 성공");
		} catch (Exception e) {
			System.out.println("연결 해제 실패");

		}
	}
}
