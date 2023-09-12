package dto;

import java.util.ArrayList;

public class carRepository {
	private ArrayList<Car> allCar = new ArrayList<Car>();
	private static carRepository instance = new carRepository();

	public static carRepository getInstance() {
		return instance;
	}

	public carRepository() {
		Car car1 = new Car();
		car1.setCarId("a123");
		car1.setCarType("BMW 5시리즈");
		car1.setCarCompany("BMW");
		car1.setCarCost(6200);
		car1.setCarColor("White(흰색)");
		car1.setCarOption("선루프, 네비게이션, 스마트키, 후방카메라");

		allCar.add(car1);

		Car car2 = new Car();
		car2.setCarId("a124");
		car2.setCarType("벤츠 E-클래스");
		car2.setCarCompany("벤츠");
		car2.setCarCost(4200);
		car2.setCarColor("gray(회색)");
		car2.setCarOption("풀옵션");

		allCar.add(car2);

		Car car3 = new Car();
		car3.setCarId("a125");
		car3.setCarType("아우디 Q7");
		car3.setCarCompany("아우디");
		car3.setCarCost(6100);
		car3.setCarColor("Black(검정색)");
		car3.setCarOption("후방카메라, 스마트키, 열선시트(앞,뒤), 가죽시트");

		allCar.add(car3);
	}

	public ArrayList<Car> getallCar() {
		return allCar;
	}

	public Car getCarById(String carId) {
		Car carById = null;

		for (int i = 0; i < allCar.size(); i++) {
			Car car = allCar.get(i);

			if (car.getCarId().equals(carId)) {
				carById = car;
				break;
			}
		}
		return carById;
	}

	public void addCar(Car car) {
		allCar.add(car);
	}
}