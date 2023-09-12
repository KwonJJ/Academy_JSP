package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class mysqlConnect {
	public Connection con; // DB접속
	public PreparedStatement psmt; // 동적 쿼리 사용
	public ResultSet rs; // 쿼리 실행 결과

	public mysqlConnect() {
		try {
			Class.forName("com.mysql.jdbc.Driver"); // sql드라이버 연결
			String url = "jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=utf8";
			// ?useUnicode=true&characterEncoding=utf8 -> DB에 한글로 넘겨줌
			String id = "manager";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd); // sql 데이터 베이스 여결
		} catch (Exception e) {
			System.out.println("DB 연결 실패");
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			System.out.println("DB 연결 해제 성공");
		} catch(Exception e) {
			System.out.println("연결 해제 실패");
		}
	}
}
