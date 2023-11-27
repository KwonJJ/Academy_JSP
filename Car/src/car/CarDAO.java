package car;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class CarDAO extends JDBConnect {

	public CarDAO() {
		super();
	}
	
	// 검색있으면 포함해서 가져오기
	public List<CarDTO> selectList(String searchField, String searchWord) {
        List<CarDTO> dtoList = new ArrayList<>();
        String query = "select * from car";

        if (searchWord != null) {
            query += " WHERE " + searchField + " LIKE '%" + searchWord + "%'";
        }

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                CarDTO dto = new CarDTO();
                dto.setCar_company(rs.getString(1));
                dto.setCar_name(rs.getString(2));
                dto.setCar_color(rs.getString(3));
                dto.setCar_cost(rs.getString(4));
                dto.setCar_deliveryDate(rs.getString(5));
                dto.setCar_info(rs.getString(6));
                dto.setCar_image(rs.getString(7));

                // 날짜 비교하여 결과 필터링
                if (isVisible(dto.getCar_deliveryDate())) {
                    dtoList.add(dto);
                }
            }
            
            System.out.println("목록 가져오기 및 검색 성공");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("목록 가져오기 및 검색 오류");
        }

        return dtoList;
    }
	
	private boolean isVisible(String deliveryDate) {
        // 등록 날짜를 LocalDate로 변환
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate registrationLocalDate = LocalDate.parse(deliveryDate, formatter);

        // 1년 후의 날짜 계산
        LocalDate oneYearLater = registrationLocalDate.plusYears(1);

        // 현재 날짜
        LocalDate currentDate = LocalDate.now();

        // 현재 날짜가 1년 후의 날짜보다 이후인지 여부를 반환
        return currentDate.isBefore(oneYearLater);
    }
	
}
