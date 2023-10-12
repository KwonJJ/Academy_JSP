package fileupload;

import common.JDBConnect;

public class MyfileDAO extends JDBConnect{
	
	public MyfileDAO() {
		super();
	}
	
	public int insertFile(MyfileDTO dto) {
		int applyResult = 0;
		
		try {
			String query = "insert into myfile ( "
					+ " idx, name, title, cate, ofile, sfile) "
					+ " values ( "
					+ " seq_board_num.nextval, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			applyResult = psmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("파일 INSERT 중 예외 발생");
		}
		
		return applyResult;
	}
}
