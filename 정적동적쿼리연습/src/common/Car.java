package common;

public class Car {
	private String CarName;
	private int CarPrice;
	private String CarColor;

	public Car() {
	}

	public Car(String carName, int carPrice, String carColor) {
		CarName = carName;
		CarPrice = carPrice;
		CarColor = carColor;
	}

	public String getCarName() {
		return CarName;
	}

	public void setCarName(String carName) {
		CarName = carName;
	}

	public int getCarPrice() {
		return CarPrice;
	}

	public void setCarPrice(int carPrice) {
		CarPrice = carPrice;
	}

	public String getCarColor() {
		return CarColor;
	}

	public void setCarColor(String carColor) {
		CarColor = carColor;
	}

}