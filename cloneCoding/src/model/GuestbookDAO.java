package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;


public class GuestbookDAO extends JDBConnect {
	public int InsertGuestbook(Guestbook guestbook, String id) {
		String INSERT_GUESTBOOK_SQL = "insert into guestbook (id, owner_id, created, content) values (?, ?, ?, ?);";
		
		LocalDateTime currentTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm");
		String formattedTime = currentTime.format(formatter);
		
		int result = 0;
		
		try {
			psmt = con.prepareStatement(INSERT_GUESTBOOK_SQL);
			psmt.setString(1, guestbook.getId());
			psmt.setString(2, guestbook.getOwner_id());
			psmt.setString(3, formattedTime);
			psmt.setString(4, guestbook.getContent());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Guestbook> GetUserGuestbookList(String owner_id) {
		List<Guestbook> userGuestBookList = new ArrayList<Guestbook>();
		String GET_USER_GUESTBOOK_LIST_SQL = "select guestbook.*, imgName from guestbook join member on member.id=guestbook.id where guestbook.owner_id=? order by no desc;";
		
		try {
			psmt = con.prepareStatement(GET_USER_GUESTBOOK_LIST_SQL);
			psmt.setString(1, owner_id);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				Guestbook guestbook = new Guestbook();
				guestbook.setNo(rs.getInt(1));
				guestbook.setId(rs.getString(2));
				guestbook.setOwner_id(rs.getString(3));
				guestbook.setCreated(rs.getString(4));
				guestbook.setContent(rs.getString(5));
				guestbook.setImgName(rs.getString(6));
				
				userGuestBookList.add(guestbook);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return userGuestBookList;
	}
}
