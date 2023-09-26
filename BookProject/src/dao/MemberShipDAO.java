package dao;

import common.JDBConnect;
import dto.MemberShipDTO;

public class MemberShipDAO extends JDBConnect {
	
	public MemberShipDAO() {
		super();
	}
	
	public MemberShipDTO selectMember(String member_id, String member_pw) {
		MemberShipDTO dto = new MemberShipDTO();
		String sql = "select * from membership where memberid = ? and memberpw = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, member_id);
			psmt.setString(2, member_pw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setMemberid(rs.getString(1));
				dto.setMemberpw(rs.getString(2));
				dto.setMembername(rs.getString(3));
				dto.setMemberaddress(rs.getString(4));
				dto.setMembertel(rs.getString(5));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("DB 연결 실패");
		}
		return dto;
	}
	
	public int AddMember(String memberid, String memberpw, String membername, String memberaddress, String membertel) {
		
		String sql = "insert into membership values(?, ?, ?, ?, ?)";
		int result = 0;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, memberid);
			psmt.setString(2, memberpw);
			psmt.setString(3, membername);
			psmt.setString(4, memberaddress);
			psmt.setString(5, membertel);
			psmt.executeUpdate();
			
			System.out.println("회원가입 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원가입 실패");
		}
		return result;
	}
}
