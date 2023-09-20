package medel1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {
	public BoardDAO(ServletContext application) {
		super(application);
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "select count(*) from board";

		if (map.get("searchWord") != null) { // 검색한는 단어가 있다면
			query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'"; // 정식 코드
			// searchField -> 검색 분류(종류) , searchWord -> 검색 단어로 쿼리문 완성

			/*
			 * query += " where " + map.get("searchField") + " " + "like '%" +
			 * map.get("searchWord") + "%'";
			 * 
			 * like의 l앞에서 enter치면 자동으로 이렇게 분리됨.
			 */
		}

		try {
			stmt = con.createStatement(); // 쿼리문 생성
			rs = stmt.executeQuery(query); // 쿼리문 실행
			rs.next(); // 커서 첫 번째 행으로 이동
			totalCount = rs.getInt(1); // 첫 번째 값인 개시물 개수를 가져옴

			System.out.println("개수물 개수 추출 성공");
		} catch (Exception e) {
			System.out.println("게시물 개수 오류");
		}

		return totalCount;
	}

	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();

		String query = "select * from board";
		if (map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'"; // 정식 코드
		}
		query += " order by num desc";
		// 게시물 번호로 내림차순 정렬(최근 게시물이 위로 오게 정렬)

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				bbs.add(dto);
				
			}
			
			System.out.println("개시물 조회 성공");
		} catch (Exception e) {
			System.out.println("게시물 조회 실패");
		}

		return bbs;
	}
	
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		
		try {
			String query = "insert into board(num, title, content, id, visitcount) values(seq_board_num.NEXTVAL, ?, ?, ?, 0)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate(); // 쿼리 실행문
			
			System.out.println("글쓰기 성공");
		} catch(Exception e) {
			
			System.out.println("글쓰기 오류");
			e.printStackTrace();
		}
		return result;
	}
}
