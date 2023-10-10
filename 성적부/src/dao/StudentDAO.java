package dao;

import java.util.ArrayList;
import java.util.List;

import db.MysqlCon;
import dto.StudentDTO;

public class StudentDAO extends MysqlCon {
	public StudentDAO() {
		super();
	}
	
	public List<StudentDTO> selectAll(String point){
		List<StudentDTO> dtolist = new ArrayList<StudentDTO>();
		String sql = "select * from 시험";
	
		if(point != null) {
		 	sql += " where 학점 = '" + point + "'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				StudentDTO dto = new StudentDTO();
				dto.setStudentId(rs.getString(1));
				dto.setKor(rs.getInt(2));
				dto.setEng(rs.getInt(3));
				dto.setMat(rs.getInt(4));
				dto.setPoint(rs.getString(5));
				dtolist.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("학생 점수 가져오기 실패");
		}
		
		return dtolist;
	}
	
}
