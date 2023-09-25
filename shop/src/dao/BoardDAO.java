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
	
}
