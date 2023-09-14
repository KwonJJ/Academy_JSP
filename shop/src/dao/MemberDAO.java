package dao;

import common.JDBConnect;
import dto.MemberDTO;

public class MemberDAO extends JDBConnect {

	public MemberDAO() {
		super();
	}
	
	public MemberDTO getmemberDto(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id = ? and pw = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setPass(rs.getString(3));
			}
			
		} catch(Exception e) {
			System.out.println("DB연결 실패");
		}
		
		return dto;
	}
}
