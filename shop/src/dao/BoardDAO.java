package dao;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {
	
	public BoardDAO() {
		super();
	}
	
	public int selectCount() {
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
	
}
