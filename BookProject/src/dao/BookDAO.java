package dao;

import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;
import dto.BookDTO;

public class BookDAO extends JDBConnect {

	public List<BookDTO> selectList() {
		List<BookDTO> booklist = new ArrayList<BookDTO>();

		String sql = "select * from bookinfo";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setBookid(rs.getString("bookid"));
				dto.setAuthor(rs.getString("author"));
				dto.setBooktitle(rs.getString("booktitle"));
				dto.setBookcontent(rs.getString("bookcontent"));
				dto.setBookprice(rs.getInt("bookprice"));
				dto.setBookdate(rs.getString("bookdate"));
				dto.setMemberid(rs.getString("memberid"));
				booklist.add(dto);
				System.out.println("도서 목록 가져오기 성공");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("도서 목록 가져오기 실패");
		}
		return booklist;
	}
}
