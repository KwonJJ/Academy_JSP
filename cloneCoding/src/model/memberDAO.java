package model;

import java.sql.SQLException;

import common.JDBConnect;

public class memberDAO extends JDBConnect{
	
	public memberDAO() {
		super();
	}
	
	public int CreateMember(member cyMember) throws ClassNotFoundException {
		String INSERT_MEMBER_SQL = "insert into member" + "(id, password, email, phone, isAdmin) "
								+ "values (?, ?, ?, ?, ?)";
		
		int result = 0;
		
		try {
			psmt = con.prepareStatement(INSERT_MEMBER_SQL);
			psmt.setString(1, cyMember.getId());
			psmt.setString(2, cyMember.getPassword());
			psmt.setString(3, cyMember.getEmail());
			psmt.setString(4, cyMember.getPhone());
			psmt.setString(5, cyMember.getIsAdmin());
			
			result = psmt.executeUpdate();
			System.out.println("회원가입 성공");
			
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("회원가입 실패");
		}
		
		return result;
	}
}
