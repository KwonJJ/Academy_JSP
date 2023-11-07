package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import common.DBConnector;

public class GuestbookDAO extends DBConnector {
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
			e.printStackTrace();
		}
		
		return userGuestBookList;
	}
	
	public void addGuestbookReply(int b_no, String id, String content) {
		try {
			String ADD_GUESTBOOK_REPLY = "insert into guestbookReply(b_no, id, created, content) VALUES (?, ?, now(), ?)";
			psmt = con.prepareStatement(ADD_GUESTBOOK_REPLY);
			
			psmt.setInt(1, b_no);
			psmt.setString(2, id);
			psmt.setString(3, content);
			psmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<GuestbookReply> selectReply(int b_no) {
		List<GuestbookReply> list = new ArrayList<>();
		
		try {
			String SELECT_REPLY = "select * from guestbookReply where b_no = ?";
			
			psmt = con.prepareStatement(SELECT_REPLY);
			
			psmt.setInt(1, b_no);
			
			rs = psmt.executeQuery();
			while (rs.next()) {
				GuestbookReply dto = new GuestbookReply();
				dto.setR_no(rs.getInt(1));
				dto.setB_no(rs.getInt(2));
				dto.setId(rs.getString(3));
				dto.setCreated(rs.getString(4));
				dto.setContent(rs.getString(5));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
