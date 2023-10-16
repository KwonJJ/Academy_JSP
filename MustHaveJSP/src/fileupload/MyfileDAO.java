package fileupload;

import java.util.List;
import java.util.Vector;

import common.JDBConnect;

public class MyfileDAO extends JDBConnect {

	public MyfileDAO() {
		super();
	}

	public int insertFile(MyfileDTO dto) {
		int applyResult = 0;

		try {
			String query = "insert into myfile ( " + " idx, name, title, cate, ofile, sfile) " + " values ( "
					+ " seq_board_num.nextval, ?, ?, ?, ?, ?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());

			applyResult = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 INSERT 중 예외 발생");
		}

		return applyResult;
	}

	public List<MyfileDTO> myFileList() {
		List<MyfileDTO> fileList = new Vector<>();
		
		String query = "select * from myfile order by idx desc";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MyfileDTO dto = new MyfileDTO();
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("목록 가져오기 실패");
		}
		
		
		return fileList;

	}

}
