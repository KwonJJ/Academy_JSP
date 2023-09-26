package dao;

import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;
import dto.BoardDTO;

public class BoardDAO extends JDBConnect {
	
	public BoardDAO() {
		super();
	}
	
	public int selectCount() {
		// 게시물 개수 세기
		int result = 0;
		String query = "select count(*) from board";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			result = rs.getInt(1);
			
			System.out.println("게시물 개수 세기 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 개수 세기 오류");
		}
		
		return result;
	}
	
	public List<BoardDTO> selectList(){
		// 게시물의 내용 가져오기
		List<BoardDTO> dto = new ArrayList<BoardDTO>();
		
		String query = "select * from board order by num desc";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while(rs.next()) {
				BoardDTO bto = new BoardDTO();
				bto.setNum(rs.getString("num"));
				bto.setTitle(rs.getString("title"));
				bto.setContent(rs.getString("content"));
				bto.setId(rs.getString("id"));
				bto.setPostdate(rs.getString("postdate"));
				bto.setVisitcount(rs.getInt("visitcount"));
				dto.add(bto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 가져오기 오류");
		}
		
		return dto;
	}
	
	public int insertWrite(BoardDTO dto) {
		// 글쓰기
		int result = 0;
		
		try {
			String query = "insert into board(title, content, id, postdate, visitcount) values(?, ?, ?, ?, 0) ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			psmt.setString(4, dto.getPostdate());
			result = psmt.executeUpdate();
			
			System.out.println("게시물 글쓰기 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 글쓰기 오류");
		}
		
		return result;
	}
	
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		String query = "select board.*, member.name from board inner join member on board.id = member.id where num = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getInt("visitcount"));
				dto.setName(rs.getString("name"));
			}
			
			System.out.println("세부내용 출력 성공");
			
		} catch(Exception e){
			e.printStackTrace();
			System.out.println("세부 내용 출력 오류");
		}
		
		return dto;
	}
	
	public void updateVisitCount(String num) {
		String query = "update board set visitcount = visitcount + 1 where num = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate();
			
			System.out.println("게시물 조회수 증가 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 조회수 증가 실패");
		}
		
	}
	
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		String query = "update board set title = ?, content = ? where num = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
			System.out.println(result);
			System.out.println("게시물 수정 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 수정 실패");
		}
		return result;
	}
	
	public int deletePost(BoardDTO dto) {
		int result = 0;
		
		String query = "delete from board where num = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			result = psmt.executeUpdate();
			
			System.out.println("게시물 삭제 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 삭제 오류 발생");
		}
		
		return result;
	}
	
}
