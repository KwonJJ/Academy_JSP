package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.DBConnector;

public class memberDAO extends DBConnector {
	
	public memberDAO() {
		super();
	}
	
	public int CreateMember(member cyMember) throws ClassNotFoundException {
		String INSERT_MEMBER_SQL = "insert into Member (id, password, email, phone, isAdmin, imgName) values "
									+ "(?, ?, ?, ?, ?, ?)";
		
		int result = 0;
		
		try {
			psmt = con.prepareStatement(INSERT_MEMBER_SQL);
			psmt.setString(1, cyMember.getId());
			psmt.setString(2, cyMember.getPassword());
			psmt.setString(3, cyMember.getEmail());
			psmt.setString(4, cyMember.getPhone());
			psmt.setString(5, cyMember.getIsAdmin());
			psmt.setString(6, cyMember.getImgName());
			
			result = psmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int CheckDuplicateId(String id) throws SQLException {
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
		} catch (Exception e) {

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
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public member GetMember(String id) throws ClassNotFoundException {
		String GET_MEMBER_SQL = "select * from Member where id = ? ";
		member cyMember = new member();
		
		try {
			psmt = con.prepareStatement(GET_MEMBER_SQL);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cyMember = new member();
				cyMember.setId(rs.getString("id"));
				cyMember.setPassword(rs.getString("password"));
				cyMember.setEmail(rs.getString("email"));
				cyMember.setPhone(rs.getString("phone"));
				cyMember.setImgName(rs.getString("imgName"));
				cyMember.setIsAdmin(rs.getString("isAdmin"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cyMember;
	}
}
