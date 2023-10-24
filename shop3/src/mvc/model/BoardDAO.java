package mvc.model;

import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO extends DBConnection  {
	
	public BoardDAO() {
		super();
	}
	
	
	public int getListCount(String items, String text) {   // 게시물의 개수 세기
		int count=0;
		String sql;
		
		if (items == null && text == null)   // 검색 조건이 없으면 전체 레코드 개수 출력
			sql = "select count(*) from board";
		else  // 검색 조건이 있으면 조건에 맞는 개수 출력
			sql = "select count(*) from board where " + items + " like '%" + text + "%'";  
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();

			if (rs.next())  {
				count = rs.getInt(1);
			}
			
		} catch (Exception ex) {
			System.out.println("getListCount 오류 : " + ex);
		} 	
		return count;

	}
	
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
	// board 테이블에 데이터 가져오기
		
		int total_record = getListCount(items, text);  //조건에 맞는 전체 행의 개수
		int start = (page - 1) * limit;   // 해당 페이지 게시물의 시작 지점
		int index = start + 1;
		
		String sql;

		if (items == null && text == null) {
			sql = "select * from board order by num desc";  // 조건이 없으면 전체 게시물 중 최근 게시물부터 표시함
		} else {
			sql = "select * from board where " + items + " like '%" + text + "%' order by num desc";  // 조건이 있으면 조건에 맞는 게시물 중 최근 게시물부터 표시함
		}
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

		try {

			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.absolute(index)) {   // 반복문 이용하여 해당 게시물을 게시판에 넣음
				BoardDTO board = new BoardDTO();   
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				list.add(board);

				if (index < (start + limit) && index < total_record) {
					index++;
				} else {
					break;
				}
			}
			return list;
		} catch (Exception ex) {
			System.out.println("연결 오류 : " + ex);
		} 
		return null;
	}
	
	public void boardWrite(BoardDTO dto) {
		String sql = "insert into board values(?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getNum());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getSubject());
			psmt.setString(5, dto.getContent());
			psmt.setString(6, dto.getRegist_day());
			psmt.setInt(7, dto.getHit());
			psmt.setString(8, dto.getIp());
			psmt.executeUpdate();
			
			System.out.println("게시글 쓰기 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시글 쓰기 오류");
		}
	}
	
	public BoardDTO BoardByNum(int num) {
		String sql = "select * from board where num = ?";
		BoardDTO dto = null;
		
		// 게시판 조회수 증가
		// updateHit(num);
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegist_day(rs.getString("regist_day"));
				dto.setHit(rs.getInt("hit"));
				dto.setIp(rs.getString("ip"));
			}
			System.out.println("게시물 상세 보기 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 상세 보기 실패");
		}
		return dto;
	}
}
