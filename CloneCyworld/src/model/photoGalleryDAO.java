package model;


import java.util.ArrayList;
import java.util.List;

import common.DBConnector;

public class photoGalleryDAO extends DBConnector{
	
	public int InsertPhoto(photoGallery photo) {
		// 싸이월드 사진첩 사진 업로드 DAO
		String INSERT_PHOTO_SQL = "insert into photoGallery (id, title, content, created, image) values (?, ?, ?, now(), ?)";
		
		int result = 0;
		
		try {
			psmt = con.prepareStatement(INSERT_PHOTO_SQL);
			psmt.setString(1, photo.getId());
			psmt.setString(2, photo.getTitle());
			psmt.setString(3, photo.getContent());
			psmt.setString(4, photo.getImage());
			
			result = psmt.executeUpdate();
			
			System.out.println("사진 업로드 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("사진 업로드 실패");
		}
		
		return result;
	}
	
	public List<photoGallery> GetUserPhotoList(String id){
		// List에 member테이블의 id와 photoGallery의 id를 연결시켜서 해당 id와 일치하는 사진첩 불러오기 DAO
		List<photoGallery> userPhotoList = new ArrayList<photoGallery>();
		String GET_USER_PHOTOLIST_SQL = "select photoGallery.*, image from photoGallery join member on member.id=photoGallery.id where photoGallery.id = ? order by p_no desc;";
		
		try {
			
			psmt = con.prepareStatement(GET_USER_PHOTOLIST_SQL);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				photoGallery photo = new photoGallery();
				
				photo.setId(rs.getString(1));
				photo.setTitle(rs.getString(2));
				photo.setContent(rs.getString(3));
				photo.setCreated(rs.getString(4));
				photo.setImage(rs.getString(5));
				photo.setP_no(rs.getInt(6));
				
				userPhotoList.add(photo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userPhotoList;
	}
	
	public photoGallery getPhoto(String id) throws ClassNotFoundException{
		// 싸이월드 사진첩 불러오기 DAO
		String GET_PHOTO = "select * from photoGallery where id = ?";
		photoGallery photo = new photoGallery();
		
		try {
			psmt = con.prepareStatement(GET_PHOTO);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				photo.setId(rs.getString("id"));
				photo.setTitle(rs.getString("title"));
				photo.setContent(rs.getString("content"));
				photo.setImage(rs.getString("image"));
			}
			
			System.out.println("사진첩 불러오기 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("사진첩 불러오기 실패");
		}
		
		return photo;
	}
}
