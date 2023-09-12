package dto;

public class Car {
	private String carId;
	private String carType; // 차 종류
	private String carCompany; // 제조 회사
	private int carCost; // 차량 가격
	private String carColor; // 차량 색상
	private String carOption; // 차량 옵션

	public Car() {
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public String getCarCompany() {
		return carCompany;
	}

	public void setCarCompany(String carCompany) {
		this.carCompany = carCompany;
	}

	public int getCarCost() {
		return carCost;
	}

	public void setCarCost(int carCost) {
		this.carCost = carCost;
	}

	public String getCarColor() {
		return carColor;
	}

	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}

	public String getCarOption() {
		return carOption;
	}

	public void setCarOption(String carOption) {
		this.carOption = carOption;
	}

}