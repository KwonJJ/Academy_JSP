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
	
	public int CheckDuplicateId (String id) throws SQLException {
		String GET_MEMBER_SQL = "select id from member where id = ?";
		
		int result = 0;
		
		try {
			psmt = con.prepareStatement(GET_MEMBER_SQL);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
			System.out.println("아이디 중복 확인 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("아이디 중복 확인 실패");
		}
		
		return result;
	}
	
	public int CyworldLogin(String id, String pw) {
		String CYWORLD_LOGIN_QUERY = "select password from member where id = ?";
		
		int result = 0;
		
		try {
			psmt = con.prepareStatement(CYWORLD_LOGIN_QUERY);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("password").equals(pw)) {
					result = 1;
					
				} else {
					result = 0;
				}
				
			} else {
				result = -1;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
