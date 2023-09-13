package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	
	public MemberDAO(/*String dry, String url, String id, String pw*/) {
		// 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성
		super(/*dry, url, id, pw*/);
	}
	
	public MemberDTO getmemberDto(String uid, String upass) {
		// 명시한 아이디/패스워드와 일치하는 회원 정보를 반환
		MemberDTO dto = new MemberDTO(); // 회원정보 DTO 객체 생성
		String query = "select * from member where id = ? and pass = ?"; // 쿼리문 템플릿
		
		try { // 쿼리 실행
			psmt = con.prepareStatement(query); // 동적 쿼리문 준비
			psmt.setString(1, uid); // 쿼리문의 첫 번째 인파라미터에 값 설정
			psmt.setString(2, upass); // 쿼리문의 두 번째 인파라미터에 값 설정
			rs = psmt.executeQuery(); // 쿼리문 실행
			
			if(rs.next()) { // 결과 처리
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
				// 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
			}
			
		} catch(Exception e) {
			System.out.println("db 연결 실패");
			e.printStackTrace();
		}
		
		return dto; // DTO객체 반환
	}
}
