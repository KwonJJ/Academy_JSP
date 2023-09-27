package dao;

import db.MysqlCon;
import dto.StudentDTO;

public class StudentDAO extends MysqlCon {
	public StudentDAO() {
		super();
	}

	public StudentDTO selectStudent() {
		StudentDTO dto = new StudentDTO();
		String sql = "select 이름, 대학생.학번, 성별, 국어 from 대학생 join 시험 on 대학생.학번 = 시험.학번 where 이름 = '루나'";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				dto.setName(rs.getString(1));
				dto.setStudentId(rs.getString(2));
				dto.setGender(rs.getString(3));
				dto.setKor(rs.getInt(4));
			}
			
			System.out.println("학생 정보 가져오기 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("학생 정보 가져오기 실패");
		}
		
		return dto;

	}
	
}
