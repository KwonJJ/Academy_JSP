package dto;

public class StudentDTO {
	// 멤버 변수 선언
	private String name; // 학생 이름
	private String studentId; // 학번
	private String gender; // 성별
	private int kor; // 국어점수
	private int eng; // 영어점수
	private int mat; // 수학점수

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
	}

	public int average() {
		int result = Math.round((kor + eng + mat) / 3);
				
		return result;
	}
	
}
