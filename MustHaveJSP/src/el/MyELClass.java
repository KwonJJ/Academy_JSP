package el;

public class MyELClass {
	public String getGender(String jumin) {
		String returnStr = "";
		/*
		 *  예) 주민번호 991205 - 1233258일 때
		 *  성별을 표시하는 1의 index번호를 가져옴
		 */
		int beginIdx = jumin.indexOf("-") + 1;
		String genderStr = jumin.substring(beginIdx, beginIdx + 1);
		int genderInt = Integer.parseInt(genderStr);
		
		/*
		 * 예) 991205 - 1233258
		 * jumin.substring(7, 9) -> 12 출력
		 * jumin.substring(0, 6) -> 991205 출력
		 */
		
		if(genderInt == 1 || genderInt == 3) {
			returnStr = "남자";
		} else if(genderInt == 2 || genderInt == 4) {
			returnStr = "여자";
		} else {
			returnStr = "주민번호 오류";
		}
		
		return returnStr;
	}
}
