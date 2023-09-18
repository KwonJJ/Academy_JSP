package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con; // 데이터베이스 연결
	public Statement stmt; // 정적 쿼리문 사용
	public PreparedStatement psmt; // 동적 쿼리문 사용
	public ResultSet rs; // 쿼리 실행 결과 저장

	public JDBConnect() { // 생성자
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			// com.mysql.jdbc.Driver mysql 드라이버 이름

			String url = "jdbc:oracle:thin:@localhost:1521:xe"; // db 접속 주소
			String id = "manager"; // 사용자 계정 아이디
			String pwd = "1234"; // 계정 비밀번호
			con = DriverManager.getConnection(url, id, pwd);
			// 상단 정보로 db에 연결

			System.out.println("데이터 베이스 연결 성공");

		} catch (Exception e) {
			System.out.println("데이터 베이스 연결 오류입니다.");
			e.printStackTrace();
		}
	}

	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("2번째 생성자 연결 성공");
		} catch (Exception e) {
			System.out.println("2번째 데이터베이스 연결 오류입니다.");
			e.printStackTrace();
		}
	}

	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);

			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			con = DriverManager.getConnection(url, id, pwd);

			System.out.println("application DB 연결 성공(인수 생성자2)");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("application DB연결 실패");
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
			System.out.println("자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
