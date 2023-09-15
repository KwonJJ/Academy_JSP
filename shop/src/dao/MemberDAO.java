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
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setPhone(rs.getString(4));
				dto.setAddress(rs.getString(5));
			}
			
		} catch(Exception e) {
			System.out.println("DB연결 실패");
		}
		
		return dto;
	}
	
	public String insertMember(String id, String password, String name, String phone, String address) {
		String query = "insert into member values(?, ?, ?, ?, ?)";
		String result = "";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, password);
			psmt.setString(3, name);
			psmt.setString(4, phone);
			psmt.setString(5, address);
			psmt.executeUpdate();
			System.out.println("회원 가입 성공");
		
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원 가입 실패");
		}
		return result;
	}
	
	public String deleteMember(String id, String password) {
		String query = "select * from member where id = ?";
		String result = "";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String password2 = rs.getString(2);
				
				if(password.equals(password2)) {
					result = "회원 탈퇴 성공";
					String query2 = "delete from member where id = ?";
					psmt = con.prepareStatement(query2);
					psmt.setString(1, id);
					psmt.executeUpdate();
					System.out.println("회원 탈퇴 성공");
					break;
					
				}
			}
		} catch (Exception e) {
			System.out.println("회원정보 삭제 실패");
		}
		return result;
	}
	
	public String editMember(String id, String password, String phone, String address) {
		String query = "update member set pw=?, phone=?, address=? where id=?";
		String result = "";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, password);
			psmt.setString(2, phone);
			psmt.setString(3, address);
			psmt.setString(4, id);
			psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("회원정보 수정 실패");
		}
		return result;
	}
	
}
