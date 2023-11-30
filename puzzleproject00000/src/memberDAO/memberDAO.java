package memberDAO;


import java.sql.SQLException;

import DBconnect.DBconnect;
import memberDTO.memberDTO;

public class memberDAO extends DBconnect {

	public memberDAO() {
		super();
	}
	
	// 아이디 비번 일치하는 멤버 찾기 
	public memberDTO getMemberDTO(String id, String pw) {
		memberDTO dto = new memberDTO();
		String query = "select * from member where id=? and pw=?";
		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPw(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setNickname(rs.getString(4));
				dto.setBirthday(rs.getString(5));
				dto.setAddress(rs.getString(6));
				dto.setEmail(rs.getString(7));
				dto.setPhone(rs.getString(8));
				dto.setRecommender(rs.getString(9));
				dto.setPoint(rs.getInt(10));
			}
		} catch(Exception e) {
			System.out.println("memberdto 가져오기 실패");
		}
		
		return dto;
	}
	
	// 멤버 추가하기
	public void register(String id, String pw, String name, String nickname, String birthday, 
			String address, String email, String phone, String recommender, int point) {
		String query = "insert into member values(?,?,?,?,?,?,?,?,?,?)";
		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			psmt.setString(4, nickname);
			psmt.setString(5, birthday);
			psmt.setString(6, address);
			psmt.setString(7, email);
			psmt.setString(8, phone);
			psmt.setString(9, recommender);
			psmt.setInt(10, point);
			psmt.executeUpdate();
			System.out.println("회원 추가 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원 추가 실패");
		}

	}
	

	
	// 아이디 중복확인하기
	public int CheckDuplicateId(String id)  {
		int result=0;
		String sql="select id from  member where id=?";
		
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				result=1;
			} else {
				result=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 이메일 중복확인하기
	public int CheckDuplicateEmail(String email)  {
		int result=0;
		String sql="select email from  member where email=?";
		
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, email);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				result=1;
			} else {
				result=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 이메일 중복확인하기
	public int CheckDuplicateNickName(String nickname)  {
		int result=0;
		String sql="select nickname from  member where nickname=?";
		
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, nickname);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				result=1;
			} else {
				result=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//회원 정보 수정하는 메소드
	public void EditMember(String id, String pw, String nickname, String address, String phone) {
		String query = "update member set pw=?, nickname=?, address=?, phone=? where id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, pw);
			psmt.setString(2, nickname);
			psmt.setString(3, address);
			psmt.setString(4, phone);
			psmt.setString(5, id);
			psmt.executeUpdate();
			System.out.println("회원정보 수정성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원정보 수정실패");
		}
	}
	
	
}
